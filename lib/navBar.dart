import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Drawer(
      backgroundColor: Color(0xFF26252F),
      width: width,
      child: Stack(
        children: [
          Positioned(
            top: height * 0.09,
            left: width * 0.92,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                )),
          ), //back button
          Positioned(
            top: height * 0.05,
            left: width * 0.4,
            child: Container(
              width: width * 0.005,
              height: height * 0.9,
              color: Colors.white24,
            ),
          ), //devider bar
          Positioned(
            top: height * 0.01,
            left: width * 0.48,
            child: Image.asset(
              "images/01-1.png",
              width: width * 0.5,
              height: width * 0.5,
              color: Color(0xFF26252F),
              colorBlendMode: BlendMode.overlay,
            ),
          ), //logo
          Positioned(
            top: height * 0.25,
            left: width * 0.05,
            child: Column(
              children: [
                Container(
                  width: width * 0.33,
                  height: height * 0.13,
                  decoration: BoxDecoration(
                    color: Color(0xFF3A3848),
                    borderRadius:
                        BorderRadius.all(Radius.circular(width * 0.008)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 1.0,
                        blurRadius: 6,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width*0.02,
                        height: height*0.13,
                        color: Colors.greenAccent.withOpacity(1.0),
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Icon(
                        Icons.bar_chart,
                        color: Colors.white,
                        size: height * 0.07,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Text(
                        "Graph Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.023,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ), //graph
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  width: width * 0.33,
                  height: height * 0.13,
                  decoration: BoxDecoration(
                    color: Color(0xFF3A3848),
                    borderRadius:
                    BorderRadius.all(Radius.circular(width * 0.008)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 1.0,
                        blurRadius: 6,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width*0.02,
                        height: height*0.13,
                        color: Colors.greenAccent.withOpacity(1.0),
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Icon(
                        Icons.tune,
                        color: Colors.white,
                        size: height * 0.07,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Text(
                        "PID Tuning",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.023,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  width: width * 0.33,
                  height: height * 0.13,
                  decoration: BoxDecoration(
                    color: Color(0xFF3A3848),
                    borderRadius:
                    BorderRadius.all(Radius.circular(width * 0.008)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 1.0,
                        blurRadius: 6,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width*0.02,
                        height: height*0.13,
                        color: Colors.greenAccent.withOpacity(1.0),
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Icon(
                        Icons.bar_chart,
                        color: Colors.white,
                        size: height * 0.07,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Text(
                        "Graph Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.023,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  width: width * 0.33,
                  height: height * 0.13,
                  decoration: BoxDecoration(
                    color: Color(0xFF3A3848),
                    borderRadius:
                    BorderRadius.all(Radius.circular(width * 0.008)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 1.0,
                        blurRadius: 6,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width*0.02,
                        height: height*0.13,
                        color: Colors.greenAccent.withOpacity(1.0),
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Icon(
                        Icons.bar_chart,
                        color: Colors.white,
                        size: height * 0.07,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Text(
                        "Graph Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.023,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
