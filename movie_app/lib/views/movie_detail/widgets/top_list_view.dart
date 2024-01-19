import 'package:flutter/material.dart';
import 'package:movie_app/views/movie_detail/widgets/custom_list_view.dart';

class TopViewCard extends StatelessWidget {
  final String imageURL;
  final String title;
  final String? genres;
  final String? language;

  const TopViewCard({
    super.key,
    required this.title,
    required this.imageURL,
    this.genres,
    this.language,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      // Custom list tile widget with specific height
      height: 100, // Set custom height for each list tile
      leading: FittedBox(
        fit: BoxFit.fill,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            imageURL,
            height: 100,
            width: 100,
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subTitle: Text("${language} • ${genres} • ${}"),
    );
  }
}
