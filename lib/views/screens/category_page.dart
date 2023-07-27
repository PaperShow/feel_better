import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../blocs/photo/photo_bloc.dart';
import '../../model/photo.dart';
import 'image_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    var photoBloc = BlocProvider.of<PhotoBloc>(context);
    photoBloc.perPage = 80;
    photoBloc
        .add(LoadSearchedPhotoEvent(perPage: photoBloc.perPage, query: query));
    List<Photo> photoList = [];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocConsumer<PhotoBloc, PhotoState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is PhotoInitial || state is PhotoLoading) {
              const CircularProgressIndicator();
            }
            if (state is PhotoNoData) {
              return const Text('No Data');
            }
            if (state is PhotoLoaded) {
              photoList = state.photoList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      query,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.custom(
                      gridDelegate: SliverWovenGridDelegate.count(
                        crossAxisCount: 2,
                        pattern: const [
                          WovenGridTile(1),
                          WovenGridTile(
                            5 / 7,
                            crossAxisRatio: 0.9,
                            alignment: AlignmentDirectional.centerEnd,
                          ),
                          // WovenGridTile(
                          //   6 / 7,
                          //   crossAxisRatio: 0.9,
                          //   alignment: AlignmentDirectional.centerEnd,
                          // ),
                        ],
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                        childCount: photoList.length,
                        (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ImagePage(
                                          photo: photoList[index],
                                        )));
                            // print(photoList[index].src.small);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: photoList[index].src.medium,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
