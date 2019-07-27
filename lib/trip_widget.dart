import 'package:flutter/material.dart';

class TripWidget extends StatelessWidget {
  Color shadowColor;
  String imagePath;
  String title;

  TripWidget(this.shadowColor, this.imagePath, this.title);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          height: 600,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.8),
                blurRadius: 15,
                offset: Offset(0, 10),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 22,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 22,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 22,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 22,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 22,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 12,
          top: 0,
          child: Container(
            width: 80,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32),
              ),
            ),
            child: Icon(
              Icons.star_border,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
