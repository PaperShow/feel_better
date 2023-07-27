import 'package:feel_better/blocs/image_download/image_downlaod_bloc.dart';
import 'package:feel_better/blocs/trending/trending_bloc.dart';
import 'package:feel_better/controllers/api_controller.dart';
import 'package:feel_better/controllers/download_controller.dart';
import 'package:feel_better/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/photo/photo_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final repo = ApiController();
  final down = DownloadController();
  runApp(MyApp(
    repo: repo,
    down: down,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.repo, required this.down})
      : super(key: key);
  final ApiController repo;
  final DownloadController down;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhotoBloc(repo),
        ),
        BlocProvider(
          create: (context) =>
              TrendingBloc(repo)..add(const LoadTrendingPhoto(80)),
        ),
        BlocProvider(
          create: (context) => ImageDownlaodBloc(down),
        ),
      ],
      child: MaterialApp(
        title: 'WallPaper App',
        // theme: ThemeData.dark(),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
