import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CardVideoWidget extends StatefulWidget {
  final String videoUrl;
  const CardVideoWidget({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<CardVideoWidget> createState() => _CardVideoWidgetState();
}

class _CardVideoWidgetState extends State<CardVideoWidget> {
  // late final VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller = VideoPlayerController.network(widget.videoUrl)
    //   ..initialize().then((_) {
    //     controller.setVolume(0.0);
    //     setState(() {});
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(5),
        //   color: Theme.of(context).cardTheme.color,
        //   boxShadow: const [
        //     BoxShadow(
        //       color: Color(0xCCE5BE51),
        //       blurRadius: 2.5,
        //       spreadRadius: 0.5,
        //       offset: Offset(0, 0),
        //     ),
        //   ],
        // ),
        // child: controller.value.isInitialized
        //     ? Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SizedBox(
        //             width: controller.value.size.width,
        //             height: 300,
        //             child: VideoPlayer(controller),
        //           ),
        //           IconButton(
        //             onPressed: () {
        //               if (!controller.value.isPlaying) {
        //                 controller.play();
        //                 controller.setLooping(true);
        //               } else {
        //                 controller.pause();
        //               }
        //               setState(() {});
        //             },
        //             icon: Icon(
        //               !controller.value.isPlaying ? Icons.play_arrow : Icons.pause,
        //               size: 30,
        //             ),
        //           ),
        //         ],
        //       )
        //     : const Center(
        //         child: CircularProgressIndicator(),
        //       ),
        );
  }

  @override
  void dispose() {
    super.dispose();
    // controller.dispose();
  }
}
