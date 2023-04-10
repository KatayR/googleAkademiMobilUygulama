import 'package:flutter/material.dart';
import 'package:wvdeneme/models/class_models.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/hero_dialog_route.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  final mybox = Hive.box('box');
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
        flags: const YoutubePlayerFlags(
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
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: GoogleColors.blue,
                iconTheme: const IconThemeData(color: Colors.black),
                title: Text(
                  videoTitle,
                  style: const TextStyle(color: Colors.black),
                ),
                flexibleSpace: Container(
                    decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: <Color>[Colors.yellow.shade100, Colors.blue]),
                )),
                actions: [
                  IconButton(
                    icon: Hero(
                      tag: _heroAddNote,
                      createRectTween: (begin, end) {
                        return CustomRectTween(begin: begin!, end: end!);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: noteColors.bg,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  color: (Colors.grey[400])!,
                                  offset: const Offset(0.5, 0.5),
                                  blurRadius: 0.5,
                                  spreadRadius: 0.2),
                              const BoxShadow(
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
                      setState(() {
                        Navigator.of(context)
                            .push(HeroDialogRoute(builder: (context) {
                          return _AddNotePopupCard(
                              title: videoTitle,
                              position: _controller!.value.position);
                        }));
                      });
                    },
                  ),
                ],
              ),
              drawer: Drawer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topCenter,
                        colors: <Color>[Colors.yellow.shade100, Colors.blue]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          moduleLabel,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            DerslerMap.modulListOfMaps[moduleIndex].length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: _controller!.metadata.videoId ==
                                    DerslerMap
                                        .modulListOfMaps[moduleIndex].values
                                        .toList()[index]
                                ? Colors.grey
                                : Colors.green.shade50,
                            child: ListTile(
                              leading: const Icon(Icons.ondemand_video_sharp),
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
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: noteColors.bg,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                                color: (Colors.grey[400])!,
                                offset: const Offset(0.2, 0.2),
                                blurRadius: 0.5,
                                spreadRadius: 0.2),
                            const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-1.5, -1.5),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ]),
                      child: player),
                  Hero(
                    tag: _heroAddNote,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context)
                              .push(HeroDialogRoute(builder: (context) {
                            return _AddNotePopupCard(
                                title: videoTitle,
                                position: _controller!.value.position);
                          }));
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Expanded(
                            child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.all(17),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: (Colors.grey[400])!,
                                      offset: const Offset(0.2, 3.2),
                                      blurRadius: 0.5,
                                      spreadRadius: 0.2),
                                  const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-1.5, -1.5),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                  ),
                                ],
                                color: noteColors.bg,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            width: MediaQuery.of(context).size.width * 0.94,
                            height: MediaQuery.of(context).size.height * 0.52,
                            child: Text(
                              mybox.get(videoTitle) == null
                                  ? "Bir not yazın..."
                                  : mybox.get(videoTitle),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                          ),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

const String _heroAddNote = 'add-note-hero';

class _AddNotePopupCard extends StatefulWidget {
  var position;
  var title;
  _AddNotePopupCard({Key? key, required this.title, required this.position})
      : super(key: key);

  @override
  State<_AddNotePopupCard> createState() =>
      _AddNotePopupCardState(title: title);
}

class _AddNotePopupCardState extends State<_AddNotePopupCard> {
  final mybox = Hive.box('box');
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
    setState(() {});
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
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: (Colors.grey[400])!,
                                offset: const Offset(0.9, 0.3),
                                blurRadius: 0.3,
                                spreadRadius: 0.2),
                            const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-0.3, -0.3),
                              blurRadius: 0.1,
                              spreadRadius: 0.2,
                            ),
                          ]),
                      child: IconButton(
                          onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Tüm notlar silinecek!'),
                                  content: const Text(
                                      'Bu derse ait tüm notları silmek istediğinize emin misiniz?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('HAYIR'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          mybox.delete(title);
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: const Text('Evet'),
                                    ),
                                  ],
                                ),
                              ),
                          icon: const Icon(Icons.delete_forever)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Divider(
                        color: Colors.white,
                        thickness: 0.9,
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      controller: TextEditingController(
                          text:
                              //TODO Zaman işaretli not sistemi yazılacak
                              // widget.position.toString() +
                              //     "\n" +
                              mybox.get(title)),
                      decoration: const InputDecoration(
                        hintText: 'Not almak için buraya dokunun...',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                      maxLines: 8,
                      onChanged: (value) {
                        mybox.put(title, value);
                      },
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
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
