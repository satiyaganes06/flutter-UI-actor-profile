import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';

class Actors_Card extends StatefulWidget {

  String name;
  double rating_value;
  String img;

  Actors_Card(this.name, this.rating_value, this.img);


  @override
  _Actors_CardState createState() => _Actors_CardState();
}

class _Actors_CardState extends State<Actors_Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.img),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 1],
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.6)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  Container(
                    color: Colors.transparent,
                    width: 70,
                    child: Text('${widget.name}', style: GoogleFonts.oswald(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 2,
                    ), overflow: TextOverflow.ellipsis,),
                  ),

                  RatingStars(
                    value: widget.rating_value,
                    starCount : 5,
                    maxValueVisibility : false,
                    valueLabelVisibility: false,
                    starSize: 10.0,
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}