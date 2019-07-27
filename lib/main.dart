import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_app/detail_page.dart';
import 'package:trip_app/trip_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'JosefinSans',
      ),
      home: HomePage(),
    );
  }
}

bool isOpened = true;
double toLeft = 1.0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TopListViewClass> topList = new List<TopListViewClass>();
  List<SliderClass> carouselSlider = new List<SliderClass>();

  @override
  void initState() {
    super.initState();

    topList.add(TopListViewClass('Dubai', true));
    topList.add(TopListViewClass('China', false));
    topList.add(TopListViewClass('Korea', false));
    topList.add(TopListViewClass('Japan', false));
    topList.add(TopListViewClass('Tayland', false));
    topList.add(TopListViewClass('Hongkong', false));

    carouselSlider.add(SliderClass(
        'Seychelles', 'assets/images/maldives.jpg', Color(0xff4FAFBF)));
    carouselSlider.add(SliderClass(
        'Maldives', 'assets/images/maldives_2.jpg', Color(0xff41E0CC)));
    carouselSlider.add(SliderClass(
        'Boracay', 'assets/images/maldives_1.jpg', Color(0xff1FA188)));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(right: 24, left: 24, top: 48, bottom: 32),
              child: Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Asia',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.dashboard),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24,
              ),
              child: Container(
                width: width,
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 14.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: topList[index].isSelected
                              ? Color(0xff0245FC)
                              : Color(0xffDDE7F9),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: Text(
                            topList[index].title,
                            style: TextStyle(
                              letterSpacing: 1.1,
                              fontSize: 18,
                              color: topList[index].isSelected
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: width,
                child: CarouselSlider(
                  enlargeCenterPage: true,
                  height: 600,
                  initialPage: 1,
                  viewportFraction: 0.9,
                  items: carouselSlider.map((f) {
                    return Builder(
                      builder: (context) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(f.imagePath)));
                          },
                          child: Hero(
                            tag: f.imagePath,
                            child:
                                TripWidget(f.shadowColor, f.imagePath, f.title),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 36,
                left: 36,
                bottom: 10,
              ),
              child: Container(
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'World',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.home,
                      color: Colors.black12,
                      size: 36,
                    ),
                    Icon(
                      Icons.shopping_basket,
                      color: Colors.black12,
                      size: 36,
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.black12,
                      size: 36,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopListViewClass {
  String title;
  bool isSelected;

  TopListViewClass(this.title, this.isSelected);
}

class SliderClass {
  String title;
  String imagePath;
  Color shadowColor;

  SliderClass(this.title, this.imagePath, this.shadowColor);
}
