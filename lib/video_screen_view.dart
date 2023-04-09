import 'package:flutter/material.dart';
import 'package:wvdeneme/models/class_models.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/note_app.dart';

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
  late String _videoTitle =
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
    super.dispose();
    _controller?.dispose();
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
              playedColor: Color.fromRGBO(111, 64, 137, 1),
              handleColor: Color(0xFF592F8B),
            )),
        builder: (context, player) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              title: Expanded(
                child: Text(
                  _videoTitle,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            drawer: Drawer(
              backgroundColor: Colors.blue.shade400,
              child: SafeArea(
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
                                _videoTitle = DerslerMap
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
                    padding: const EdgeInsets.only(top: 10),
                    child: Notes(),
                  ))
                ],
              ),
            ),
          );
        });
  }
}
