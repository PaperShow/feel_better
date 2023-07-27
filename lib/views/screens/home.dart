import 'package:cached_network_image/cached_network_image.dart';
import 'package:feel_better/blocs/trending/trending_bloc.dart';
import 'package:feel_better/model/photo.dart';
import 'package:feel_better/views/widgets/category_gridview.dart';
import 'package:feel_better/views/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'image_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Photo> photoList = [];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              SearchBox(),
              const SizedBox(height: 20),
              BlocBuilder<TrendingBloc, TrendingState>(
                builder: (context, state) {
                  if (state is TrendingNoData) {
                    return const Text('No Data');
                  }
                  if (state is TrendingLoading || state is TrendingInitial) {
                    const CircularProgressIndicator();
                  }
                  if (state is TrendingLoaded) {
                    photoList = state.photoList;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Popular Now',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.yellowAccent),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: List.generate(
                                  15,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ImagePage(
                                                        photo: photoList[index],
                                                      )));
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Hero(
                                            tag: photoList[index].id,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    photoList[index].src.medium,
                                                fit: BoxFit.cover,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                  return Center(
                    child: Container(),
                  );
                },
              ),
              const CategoryGridView(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
