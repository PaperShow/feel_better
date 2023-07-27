import 'package:cached_network_image/cached_network_image.dart';
import 'package:feel_better/blocs/image_download/image_downlaod_bloc.dart';
import 'package:feel_better/model/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Hero(
              tag: photo.id,
              child: CachedNetworkImage(
                imageUrl: photo.src.portrait,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.amber,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      context
                          .read<ImageDownlaodBloc>()
                          .add(LoadDownloadEvent(photo));
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.amber,
                      child: Icon(
                        Icons.arrow_downward_rounded,
                        size: 25,
                      ),
                    ),
                  ),
                )
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(20),
                //   child: BackdropFilter(
                //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                //     child: Container(
                //       height: MediaQuery.of(context).size.height * 0.13,
                //       width: MediaQuery.of(context).size.width,
                //       padding: EdgeInsets.all(20),
                //       color: Colors.white.withOpacity(0.1),
                //       child: RichText(
                //           text: TextSpan(
                //               text: 'By ',
                //               style: TextStyle(fontSize: 18),
                //               children: [
                //             TextSpan(
                //                 text: photo.photographer,
                //                 style: TextStyle(
                //                     fontSize: 24,
                //                     color: Color(int.parse(
                //                             '0xff${photo.avgColor.substring(1)}'))
                //                         .withBlue(10),
                //                     fontWeight: FontWeight.bold))
                //           ])),
                //     ),
                //   ),
                // ),
                // Text(photo.photographer)
              ],
            )
          ],
        ),
      ),
    );
  }
}
