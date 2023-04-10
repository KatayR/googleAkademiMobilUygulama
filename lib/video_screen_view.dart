import 'package:flutter/material.dart';
import 'package:wvdeneme/models/class_models.dart';
import 'package:wvdeneme/models/notePreferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/note_app.dart';
import '../models/hero_dialog_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoPageView extends StatefulWidget {
  final String moduleLabel;
  final int moduleIndex;
  const VideoPageView(
      {super.key, required this.moduleLabel, required this.moduleIndex});

  @override
  State<VideoPageView> createState() =>
      _VideoPageViewState(moduleLabel: moduleLabel, moduleIndex: moduleIndex);
}

class _VideoPageViewState extends State<VideoPageView> {
  _VideoPageViewState({required this.moduleLabel, required this.moduleIndex});
  final moduleLabel;
  final int moduleIndex;
  YoutubePlayerController? _controller;
  late String videoTitle =
      DerslerMap.modulListOfMaps[moduleIndex].keys.toList()[0];
  String ytLink = "";

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: DerslerMap.modulListOfMaps[moduleIndex].values.first,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ))
      ..addListener(() {});
    ;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
            aspectRatio: 16 / 9,
            controller: _controller!,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: ProgressBarColors(
              playedColor: Colors.redAccent,
              handleColor: GoogleColors.red,
            )),
        builder: (context, player) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: GoogleColors.blue,
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  videoTitle,
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  IconButton(
                    icon: Hero(
                      tag: _heroAddNote,
                      child: Container(
                        decoration: BoxDecoration(
                            color: noteColors.bg,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  color: (Colors.grey[400])!,
                                  offset: Offset(0.5, 0.5),
                                  blurRadius: 0.5,
                                  spreadRadius: 0.2),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-0.5, -0.5),
                                blurRadius: 0.5,
                                spreadRadius: 0.2,
                              ),
                            ]),
                        child: Icon(
                          Icons.sticky_note_2_outlined,
                          color: Colors.grey.shade800,
                          size: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(HeroDialogRoute(builder: (context) {
                        return _AddNotePopupCard(title: videoTitle);
                      }));
                    },
                  ),
                ],
              ),
              drawer: Drawer(
                backgroundColor: GoogleColors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        moduleLabel,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: DerslerMap.modulListOfMaps[moduleIndex].length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: _controller!.metadata.videoId ==
                                  DerslerMap.modulListOfMaps[moduleIndex].values
                                      .toList()[index]
                              ? Colors.grey
                              : Colors.white,
                          child: ListTile(
                            leading: Icon(Icons.ondemand_video_sharp),
                            title: Text(DerslerMap
                                .modulListOfMaps[moduleIndex].keys
                                .toList()[index]),
                            onTap: () {
                              setState(() {
                                _controller!.load(DerslerMap
                                    .modulListOfMaps[moduleIndex].values
                                    .toList()[index]);
                                videoTitle = DerslerMap
                                    .modulListOfMaps[moduleIndex].keys
                                    .toList()[index];
                              });
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        alignment: Alignment.center,
                      ),
                    ),
                    player,
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Notes(
                        title: videoTitle,
                        not: Text(
                          "of"

                          // finalNoteData[finalNoteData.indexOf(videoTitle) + 1]
                          ,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}

const String _heroAddNote = 'add-note-hero';

class _AddNotePopupCard extends StatefulWidget {
  var title;
  _AddNotePopupCard({Key? key, required this.title}) : super(key: key);

  @override
  State<_AddNotePopupCard> createState() =>
      _AddNotePopupCardState(title: title);
}

class _AddNotePopupCardState extends State<_AddNotePopupCard> {
  var title;
  _AddNotePopupCardState({required this.title});
  final textController = TextEditingController();
  static String notes = "";
  @override
  void initState() {
    textController.text = notes;
    super.initState();
  }

  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddNote,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: noteColors.bg,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: 'Bir not yazın',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                      maxLines: 7,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextButton(
                      onPressed: () async {
                        // await notePreferences.init();
                      },
                      child: const Text('Kaydet'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
