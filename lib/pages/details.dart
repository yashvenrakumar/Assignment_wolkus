import 'package:flutter/material.dart';
import 'package:myapp/pages/watch_list.dart';
import 'package:myapp/services/movie_model.dart';
import 'package:myapp/style/theme.dart' as Style;
import 'package:google_fonts/google_fonts.dart';

class MovieDetails extends StatefulWidget {
  final MovieModel currMovie;
  MovieDetails({@required this.currMovie});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Style.Colors.mainColor,
        body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(30),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/resim_yok.png",
                      image: widget.currMovie.poster,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.currMovie.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.overpass(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 17),
                          Text("Type:  ",
                              style: GoogleFonts.overpass(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic)),
                          Text(
                              widget.currMovie.type[0].toUpperCase() +
                                  widget.currMovie.type.substring(1),
                              style: GoogleFonts.overpass(
                                  fontSize: 18,
                                  color: Style.Colors.secondColor))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 17),
                          Text(
                            "Year:   ",
                            style: GoogleFonts.overpass(
                                fontSize: 18,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(widget.currMovie.year,
                              style: GoogleFonts.overpass(
                                  fontSize: 18,
                                  color: Style.Colors.secondColor))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                       InkWell(
                         
                       
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back',
                            style: GoogleFonts.overpass(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      buttonChoice(widget.currMovie),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            )));
  }

  Widget buttonChoice(MovieModel item) {
    if (WatchList.watchList
        .where((element) =>
            element.title == item.title &&
            element.poster == item.poster &&
            element.year == item.year)
        .isEmpty) {
      return Flexible(
        child: InkWell(
          // color: Style.Colors.mainColor,
          // elevation: 3,
          // shape:
             // RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onTap: () {
            WatchList.addToList(item);
            WatchList.saveList();
            setState(() {});
          },
          child: Text('Click Add to List',
              style: GoogleFonts.overpass(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          highlightColor: Style.Colors.secondColor,
        ),
      );
    } else {
      return Flexible(
        child:  InkWell(
          // color: Style.Colors.mainColor,
          // elevation: 3,
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onTap: () {
            WatchList.watchList.removeWhere((element) =>
                element.title == item.title &&
                element.poster == item.poster &&
                element.year == item.year);
            setState(() {});
            WatchList.saveList();
          },
          child: Text('Remove from List',
              style: GoogleFonts.overpass(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          highlightColor: Style.Colors.secondColor,
        ),
      );
    }
  }
}
