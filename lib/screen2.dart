import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final List<String> _listItem = [
    'assets/book1.jpg',
    'assets/book2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 5;
    void _onHorizontalDrag(DragEndDetails details) {
      if (details.primaryVelocity == 0)
        return; // user have just tapped on screen (no dragging)

      if (details.primaryVelocity.compareTo(0) != -1) Navigator.pop(context);
    }

    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) =>
          _onHorizontalDrag(details),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Stack(children: <Widget>[
            Container(
              height: size.height,
              width: size.width / 8,
              color: Colors.yellow,
            ),
            Positioned(
                left: size.width / 18,
                top: size.height / 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: size.height / 16,
                      width: size.width / 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                      child: Icon(Icons.arrow_back)),
                )),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width / 5, vertical: size.height / 25),
              child: Text(
                "Bookshelf",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width / 5, vertical: size.height / 12),
              child: GridView.count(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                scrollDirection: orientation == Orientation.portrait
                    ? Axis.horizontal
                    : Axis.vertical,
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _listItem
                    .map((item) => Container(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Morning On The Banks Of The Seine",
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Read   ",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "75%",
                                        style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    item,
                                    height: size.height / 5,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )
          ]))),
    );
  }
}
