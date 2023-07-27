import 'package:feel_better/blocs/photo/photo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/search_page.dart';

class SearchBox extends StatelessWidget {
  SearchBox({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              onSubmitted: (val) {
                context
                    .read<PhotoBloc>()
                    .add(LoadSearchedPhotoEvent(perPage: 80, query: val));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage(
                              query: val,
                            )));
              },
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Find Wallpaper..',
                  contentPadding: EdgeInsets.only(left: 10),
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 208, 208, 208),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3)),
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage(
                              query: searchController.text,
                            )));
              },
              child: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 104, 103, 103),
              ))
        ],
      ),
    );
  }
}
