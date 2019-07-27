import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String imagePath;

  final double toLeft = 1.0;
  final double toRight = 0.0;
  final double bubblesOpened = 1.0;

  DetailPage(this.imagePath);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with AfterLayoutMixin<DetailPage> {
  List<Images> _images = new List<Images>();

  @override
  void initState() {
    super.initState();

    _images.add(Images('assets/images/boracay.jpeg'));
    _images.add(Images('assets/images/maldives.jpg'));
    _images.add(Images('assets/images/maldives_1.jpg'));
    _images.add(Images('assets/images/maldives_2.jpg'));
    _images.add(Images('assets/images/boracay_1.jpeg'));
    _images.add(Images('assets/images/maldives_k.jpg'));
    _images.add(Images('assets/images/maldives_1_k.jpg'));
  }

  double infosPosition = 1.0;
  double bubbles = 0.0;
  double bottomWidgetPosition = -0.65;
  bool isOnRight = false;

  bool isHide = false;
  double firstOpacity = 0.0;
  double lastOpacity = 1.0;
  double containerPositined = 0.0;

  bool isTapped = false;
  IconData favIcon = Icons.favorite_border;
  Color favIconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Scaffold(
        body: Hero(
          tag: widget.imagePath,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  top: -100 * containerPositined,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 210,
                  left: 200,
                  child: Opacity(
                    opacity: isHide == false ? lastOpacity : firstOpacity,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 1200),
                      curve: Interval(0.5, 1.0, curve: Curves.bounceIn),
                      opacity: bubbles,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            width: 58,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(width: 6),
                                Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    '36',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 220,
                  child: Opacity(
                    opacity: isHide == false ? firstOpacity : lastOpacity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '30 DAYS',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.flag,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '862 KM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 800),
                  curve: Interval(0.2, 1.0, curve: Curves.easeInOut),
                  top: 270,
                  left: 24 + (500.0 * infosPosition),
                  child: Opacity(
                    opacity: isHide == false ? lastOpacity : firstOpacity,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        'Maldives\ntour',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 800),
                  curve: Interval(0.4, 1.0, curve: Curves.easeInOut),
                  top: 360,
                  left: 24 + (500.0 * infosPosition),
                  child: Opacity(
                    opacity: isHide == false ? lastOpacity : firstOpacity,
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '30 DAYS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.flag,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '862 KM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 800),
                  curve: Interval(0.6, 1.0, curve: Curves.easeInOut),
                  top: 405,
                  left: 24 + (500.0 * infosPosition),
                  child: Opacity(
                    opacity: isHide == false ? lastOpacity : firstOpacity,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          'Commodo consectetur laborum qui elit consectetur veniam cupidatat. Enim nisi voluptate Lorem ipsum laboris laboris veniam dolore id sint quis. Duis velit ex sint adipisicing aliqua duis.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 460,
                  right: 40,
                  child: Opacity(
                    opacity: isHide == false ? lastOpacity : firstOpacity,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 1200),
                      curve: Interval(0.5, 1.0, curve: Curves.bounceIn),
                      opacity: bubbles,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 6),
                                  Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      '207',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 580,
                  left: 100,
                  child: Opacity(
                    opacity: isHide == false ? lastOpacity : firstOpacity,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 1200),
                      curve: Interval(0.5, 1.0, curve: Curves.bounceIn),
                      opacity: bubbles,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 6),
                                  Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      '295',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isHide
                            ? bottomWidgetPosition = -0.65
                            : bottomWidgetPosition = 0.0;

                        isHide
                            ? containerPositined = 0.0
                            : containerPositined = 1.0;

                        isHide = !isHide;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 800),
                  curve: Interval(0.8, 1.0, curve: Curves.easeInOut),
                  left: 24 + (500.0 * infosPosition),
                  bottom: 24,
                  child: Opacity(
                    opacity: isHide == false ? lastOpacity : firstOpacity,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      alignment: Alignment.bottomLeft,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Container(
                              width: 120,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: AssetImage(_images[index].imagesPath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                    left: 24,
                    right: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  bottom: (MediaQuery.of(context).size.height + 55) *
                      bottomWidgetPosition,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 30.0, left: 24),
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  'Maldives tour',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.0, right: 24),
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  'Commodo consectetur laborum qui elit consec tetur veniam cupidatat. Enim nisi voluptate Lorem ipsum laboris laboris veniam dolore id sint quis.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffB6BECD),
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30.0, horizontal: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/comment-bubble.png',
                                        width: 22,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          '24',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Material(
                                        color: Colors.transparent,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              !isTapped
                                                  ? favIcon = Icons.favorite
                                                  : Icons.favorite_border;
                                              !isTapped
                                                  ? favIconColor = Colors.red
                                                  : Colors.black;

                                              isTapped = !isTapped;
                                            });
                                          },
                                          icon: Icon(
                                            favIcon,
                                            color: favIconColor,
                                            size: 26,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          '65',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.black,
                                        size: 26,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          '17',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/comment.png',
                                        width: 22,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          '80',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 24.0, right: 24, bottom: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/user1.jpeg',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/user2.jpeg',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/user3.jpeg',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xffDDE7F9),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(Icons.more_horiz),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 24),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Color(0xffDDE7F9),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(24),
                                      width: MediaQuery.of(context).size.width -
                                          48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                width: 44,
                                                height: 44,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(44),
                                                  color: Color(0xffDDE7F9),
                                                ),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Color(0xffA596F8),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Material(
                                                    color: Colors.transparent,
                                                    child: Text(
                                                      'From:',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffB7BFCD),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    child: Text(
                                                      'Beijing',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 2,
                                            height: 60,
                                            color: Color(0xffDDE7F9),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Material(
                                                color: Colors.transparent,
                                                child: Text(
                                                  'To:',
                                                  style: TextStyle(
                                                    color: Color(0xffB7BFCD),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                child: Text(
                                                  'Maldives',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 24),
                                      width: MediaQuery.of(context).size.width -
                                          48,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xff0245FF),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          'Commence The Tour',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -33,
                        right: 33,
                        child: Material(
                          elevation: 10,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(66),
                          shadowColor: Colors.teal.withOpacity(0.2),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            alignment: Alignment.center,
                            width: 66,
                            height: 66,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(66),
                            ),
                            child: Transform.rotate(
                              angle: 5.4,
                              child: Image.asset(
                                'assets/images/right-arrow.png',
                                color: Color(0xff1BC0B1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        isOnRight = true;
        infosPosition = widget.toRight;
      });
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        bubbles = widget.bubblesOpened;
      });
    });
  }
}

class Images {
  String imagesPath;

  Images(this.imagesPath);
}
