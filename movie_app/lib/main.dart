import 'package:flutter/material.dart';
import 'package:movie_app/views/home/home_page.dart';
import 'package:movie_app/views/movie_detail/movie_detail_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/models/movie_list_response.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieDataAdapter());

  runApp(const RootPage());
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Walaoweh',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => const HomePage(),
        // GalleryScreen.routeName: (context) => const GalleryScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MovieDetailPage.routeName:
            {
              final args = settings.arguments as MovieDetailPageArgs;
              return MaterialPageRoute(
                builder: (context) {
                  return MovieDetailPage(args: args);
                },
              );
            }
          default:
            {
              assert(false, 'Need to implement ${settings.name}');
              return null;
            }
        }
      },
    );
  }
}
