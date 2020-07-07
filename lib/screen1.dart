import 'package:flutter/material.dart';
import 'package:fwear/screen2.dart';
import 'cubepageroute.dart';
import 'instagramstorywipe.dart';
import 'gridview.dart';

class Screen1 extends StatelessWidget {
  final List<String> listItem = [
    'assets/book1.jpg',
    'assets/book2.jpg',
    'assets/book3.jpg',
    'assets/book4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // To get the measure of screen size
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    //Default Padding of all contents except except yellowish container
    final kPadding = EdgeInsets.symmetric(
        horizontal: size.width / 20, vertical: size.height / 25);
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 5;

    _onInstagramStorySwipeClicked() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InstagramStorySwipe(
            children: <Widget>[
              Screen1(),
              Screen2(),
            ],
          ),
        ),
      );
    }

    //returning gesture detector to add the swipe effect on total Scaffold
    return GestureDetector(
      onTap: () {
        _onInstagramStorySwipeClicked();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: kPadding,
                    //The following row has the top contents of the screen displaying hello and a search icon
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hello, \nDimest",
                          style: TextStyle(
                              color: Color(0XFF3E4C34),
                              fontSize: size.height / 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.search,
                          color: Color(0XFF3E4C34),
                          size: size.height / 25,
                        ),
                      ],
                    ),
                  ),
                  //The following row contains the yellowish container present in the UI
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        //Properties of container as per the UI
                        height: size.height / 8,
                        width: size.width / 1.1,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        //the following represents the contents inside the yellowish container
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(CubePageRoute(
                                    backgroundColor: Colors.yellow,
                                    enterPage: Screen2(),
                                    exitPage: this,
                                    duration: Duration(milliseconds: 900)));
                              },
                              child: CircleAvatar(
                                  backgroundColor: Color(0XFF3E4C34),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Color(0XFFFCDE0A),
                                    size: size.height / 35,
                                  )),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "READING 2 \n",
                                  style: TextStyle(
                                      fontSize: size.height / 35,
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.w700),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "BOOK LISTS",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400))
                                  ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: kPadding,
                    //This is third Column representing Popular Section of UI
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular",
                          style: TextStyle(
                              color: Color(0XFF3E4C34),
                              fontWeight: FontWeight.bold,
                              fontSize: size.height / 30),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(color: Color(0XFFFEDE0D)),
                        ),
                      ],
                    ),
                  ),
                  //The following card views gives description of popular books
                  Expanded(
                    child:
                        buildGridView(orientation, itemWidth, itemHeight, size),
                  ),

                  // The following is the audiobook section
                  Padding(
                    padding: kPadding,
                    child: Text(
                      "AudioBook",
                      style: TextStyle(
                          color: Color(0XFF3E4C34),
                          fontWeight: FontWeight.bold,
                          fontSize: size.height / 30),
                    ),
                  ),
                  //The following is the collapsed audio player
                  Container(
                    //padding: kPadding,
                    height: size.height / 10,
                    color: Colors.grey[100],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/audiobook.jpg"),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Eula Hardy\n",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Cecilla Alexander",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal))
                              ]),
                        ),
                        Icon(Icons.play_arrow)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          //The following is the bottom navigation bar containing 4 items
          bottomNavigationBar: BottomNavigationBar(
            // type: BottomNavigationBarType.shifting,
            //currentIndex: _cindex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.change_history, color: Color(0XFF3E4C34)),
                  title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star_border, color: Color(0XFF3E4C34)),
                  title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.label_outline, color: Color(0XFF3E4C34)),
                  title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.panorama_fish_eye, color: Color(0XFF3E4C34)),
                  title: Text(""))
            ],
          )),
    );
  }
}
