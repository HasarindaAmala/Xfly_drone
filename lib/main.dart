import 'package:flutter/material.dart';
import 'package:xfly/console.dart';


void main() {
  runApp( xfly());
}

class xfly extends StatefulWidget {
  const xfly({super.key});

  @override
  State<xfly> createState() => _xflyState();
}

class _xflyState extends State<xfly> {


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}



class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  initState() {
    print("initState Called");

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => console_page(),));
      print('5 second has passed.'); // Prints after 1 second.
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: height,
        width: width,
        color: Color(0xFF070A1D),
        child: Stack(children: [
          Positioned(
            top: height * 0.1,
            left: -width * 0.03,
            child: Container(
              width: width * 1.05,
              height: height * 0.6,
              color: Color(0xFF070A1D),
              child: Image.asset(
                "images/drone.png",
                color: Color(0xFF070A1D),
                colorBlendMode: BlendMode.difference,
              ),
            ),
          ),
          Positioned(
            top: height * 0.68,
            left: width * 0.235,
            child: Container(

              width: width * 0.57,
              height: height * 0.1,
              child: Image.asset(
                "images/X-FLY.png",

              ),
            ),
          ),
          Positioned(
            top: height * 0.735,
            left: width * 0.235,
            child: Container(

              width: width * 0.53,
              height: height * 0.1,
              child: Image.asset(
                "images/Learn, Code & Fly.png",

              ),
            ),
          ),
          // Positioned(
          //     top: height * 0.85,
          //     left: width * 0.45,
          //     child: CircularProgressIndicator(
          //       backgroundColor: Colors.greenAccent,
          //     )
          // ),
          Positioned(
            top: height * 0.94,
            left: width * 0.77,
            child: Container(
              width: width * 0.2,
              height: height * 0.1,
              child: Image.asset(
                "images/qubebots.png",

              ),
            ),
          ),
          Positioned(
              top: height * 0.97,
              left: width * 0.76,
              child: Text("by",style: TextStyle(color: Colors.white),)
          ),
        ]),
      ),
    );
  }
}

