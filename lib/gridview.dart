import 'package:flutter/material.dart';
import 'package:fwear/screen1.dart';

GridView buildGridView(
    Orientation orientation, double itemWidth, double itemHeight, Size size) {
  return GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
      scrollDirection:
          orientation == Orientation.portrait ? Axis.horizontal : Axis.vertical,
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: Screen1()
          .listItem
          .map((item) => Container(
                height: size.height,
                width: size.width,
                child: Card(
                  color: Colors.grey[100],
                  child: Row(
                    children: [
                      Image.asset(
                        item,
                      ),
                      SizedBox(
                        width: size.width / 15,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Love Like A Midnight Whistle",
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height / 50),
                            ),
                            Text(
                              "Lacy Johnson",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: size.width / 20,
                                ),
                                Text(
                                  "4.9",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
          .toList());
}
