import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../helpers.dart';

class ShimmerForHomePage extends StatefulWidget {
  ShimmerForHomePage({Key? key}) : super(key: key);

  @override
  State<ShimmerForHomePage> createState() => _ShimmerForHomePageState();
}

class _ShimmerForHomePageState extends State<ShimmerForHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      child: Expanded(
        child: Column(children: [
          SizedBox(
            height: screenHeight / 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Color.fromARGB(255, 224, 224, 224),
                highlightColor: Colors.white,
                child: Container(
                  width: screenWidth / 1.5,
                  height: screenHeight / 8,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.circular(15)),
                ),
              )
            ],
          ),
          SizedBox(
            height: screenHeight / 10,
          ),
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                  left: screenWidth / 22, right: screenHeight / 22),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: screenWidth / 33,
                mainAxisSpacing: screenHeight / 20,
                crossAxisCount: 2,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Shimmer.fromColors(
                  baseColor: Color.fromARGB(255, 224, 224, 224),
                  highlightColor: Colors.white,
                  child: Container(
                    width: screenWidth / 4,
                    height: screenHeight / 4,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 224, 224, 224),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
