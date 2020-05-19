import 'package:flutter/material.dart';

enum StarState {
filled, half, empty
}

class DescriptionPlace extends StatelessWidget {
  String namePlace;
  double stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    final titleStarts = Row(
        children: <Widget> [
          Container(
              margin: EdgeInsets.only(
                  top: 320.0,
                  left: 20.0,
                  right: 20.0
              ),
              child: Text(
                  this.namePlace,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900
                  ),
                  textAlign: TextAlign.left
              )
          ),
          Row(
              children: this.getStars(this.stars)
          )
        ]
    );

    final descriptionText = Container(
        margin: EdgeInsets.only(
            top: 16.0,
            left: 20.0,
            right: 20.0
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
              this.descriptionPlace,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(51, 51, 51, .7)
              ),
              textAlign: TextAlign.left
          ),
        )
    );

    final mainContainer = Container(
        child: Column(
            children: <Widget>[
              titleStarts,
              descriptionText
            ]
        )
    );

    return mainContainer;
  }

  List <Widget> getStars(double length) {
    List <Widget> result = new List <Widget>();

    if(length >= 5) {
      result.addAll(
          List.generate( 5, (_) => this.getStar(StarState.filled) )
      );

    } else {
      int filledStars = length.floor();
      double floatPoint = length - filledStars;

      result.addAll(
          List.generate( filledStars, (_) => this.getStar(StarState.filled) )
      );

      if(floatPoint > .4) {
        result.add( this.getStar(StarState.half) );
      }

      int rest = 5 - result.length;
      result.addAll(
          List.generate( rest, (_) => this.getStar(StarState.empty) )
      );
    }

    return result;
  }

  Widget getStar(StarState state) {
    Icon starToUse;
    Color amber = Color(0xFFF2C611);

    switch( state ) {
    case StarState.filled:
    starToUse = Icon(
    Icons.star,
    color: amber
    );
    break;

    case StarState.half:
    starToUse = Icon(
    Icons.star_half,
    color: amber,
    );
    break;

    case StarState.empty:
    starToUse = Icon(
    Icons.star_border,
    color: Colors.grey,
    );
    break;
      case StarState.half:
        // TODO: Handle this case.
        break;
      case StarState.empty:
        // TODO: Handle this case.
        break;
    }

    final star = Container(
    margin: EdgeInsets.only(
    top: 323.0,
    right: 3.0
    ),
    child: starToUse
    );

    return star;
  }
}
