import 'package:myapp/services/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCell extends StatelessWidget {
  final MovieModel movie;
  const MovieCell(this.movie);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: FadeInImage.assetNetwork(
              placeholder: "assets/kure.gif",
              image: movie.poster ?? "assets/kure.gif",
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
            child: Text(
              movie.title,
              maxLines: 2,
              //softWrap: true,
              
              textAlign: TextAlign.center,
              style: GoogleFonts.overpass(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
