import 'dart:math';

import 'package:battery_indicator/battery_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_internet_signal/flutter_internet_signal.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:xfly/navBar.dart';

class console_page extends StatefulWidget {
  const console_page({super.key});

  @override
  State<console_page> createState() => _console_pageState();
}

class _console_pageState extends State<console_page> {
  double _value = 0;
  int batLevel = 65;
  int height_drone = 50;
  double speed_drone = 5;
  int _wifiSignal = 10;


  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    // TODO: implement initState
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  final _internetSignal = FlutterInternetSignal();

  Future<void> _getInternetSignal() async {
    int? wifi;

    try {
      wifi = await _internetSignal.getWifiSignalStrength();
    } on PlatformException {
      if (kDebugMode) print('Error get internet signal.');
    }
    setState(() {
      _wifiSignal = wifi!;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF070A1D),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "H",
                style: TextStyle(fontSize: width * 0.025,color: Colors.white70),
              ),
              Text(
                ' ${height_drone} m',
                style: TextStyle(fontSize: width * 0.022,color: Colors.white70),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              BatteryIndicator(
                batteryFromPhone: false,
                batteryLevel: batLevel,
                style: BatteryIndicatorStyle.skeumorphism,
                colorful: true,
                showPercentNum: false,
                mainColor: Colors.white70,
                size: width * 0.02,
                ratio: 1.6,
                showPercentSlide: true,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Icon(
                _wifiSignal < 7
                    ? (_wifiSignal < 3 ? Icons.wifi_1_bar : Icons.wifi_2_bar)
                    : Icons.wifi,
                size: width * 0.035,
                  color: Colors.white,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Container(
                  width: width * 0.15,
                  child: Image.asset(
                    "images/X-FLY.png",
                  )),
              SizedBox(
                width: width * 0.025,
              ),
              Text(
                "HS",
                style: TextStyle(fontSize: width * 0.025,color: Colors.white70),
              ),
              Text(
                ' ${speed_drone} m/s',
                style: TextStyle(fontSize: width * 0.022,color: Colors.white70),
              ),
            ],
          ),
          centerTitle: true,
        ),
        drawer: NavBar(),
        body: Stack(
          children: [
            Container(
              width: width,
              color: Color(0xFF26252F),
              child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    "images/console_back.jpg",
                    fit: BoxFit.fill,
                  )),
            ), //back image
            Positioned(
              top: -height * 0.15,
              left: width * 0.15,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(

                  "images/01-1 (1) 2.png",


                ),
              ),
            ), //qubebots image
            Positioned(
              left: width * 0.015,
              top: height * 0.1,
              child: Joystick(
                base: Container(
                  width: width * 0.26,
                  height: width * 0.26,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: GradientBoxBorder(
                          width: 1.5,
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.black,
                                Colors.black,
                                Colors.blue,
                                Colors.blue,
                                Colors.blue,
                                Colors.blue,
                                Colors.black,
                                Colors.black,

                                //Colors.blue,
                                // Colors.black,
                              ]))

                      // borderRadius: BorderRadius.all(Radius.circular(width*0.5))

                      ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: width * 0.105,
                        top: height * 0.03,
                        child: Transform.rotate(
                          angle: -pi / 2,
                          child: Icon(
                            Icons.double_arrow_outlined,
                            color: Colors.white70,
                            size: width * 0.04,
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.107,
                        top: height * 0.4,
                        child: Transform.rotate(
                          angle: pi / 2,
                          child: Icon(
                            Icons.double_arrow_outlined,
                            color: Colors.white70,
                            size: width * 0.04,
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.195,
                        top: height * 0.21,
                        child: Icon(
                          Icons.rotate_right,
                          color: Colors.white70,
                          size: width * 0.05,
                        ),
                      ),
                      Positioned(
                        left: width * 0.015,
                        top: height * 0.21,
                        child: Icon(
                          Icons.rotate_left,
                          color: Colors.white70,
                          size: width * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),
                listener: (details) {
                  print('Stick offset: ${details.x}');
                  print('Stick angle: ${-1 * details.y}');
                  //print('Stick direction: ${details.direction}');
                },
                stick: Container(
                  width: width * 0.066,
                  height: width * 0.066,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        spreadRadius: -15.0,
                      ), //BoxShadow
                    ],
                    color: Colors.indigo,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white70,
                      width: 5,
                    ),

                    // borderRadius: BorderRadius.all(Radius.circular(width*0.5))
                  ),
                ),
              ),
            ), //left joystick
            Positioned(
              left: width * 0.73,
              top: height * 0.1,
              child: Joystick(
                base: Container(
                  width: width * 0.26,
                  height: width * 0.26,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: GradientBoxBorder(
                        width: 1.5,
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            //transform: GradientRotation(),
                            colors: [
                              Colors.black,
                              Colors.black,
                              Colors.blue,
                              Colors.blue,
                              Colors.blue,
                              Colors.blue,
                              Colors.black,
                              Colors.black,

                              //Colors.blue,
                              // Colors.black,
                            ]),
                      )

                      // borderRadius: BorderRadius.all(Radius.circular(width*0.5))

                      ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: width * 0.085,
                        top: height * 0,
                        child: Transform.rotate(
                          angle: -pi,
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.white70,
                            size: width * 0.08,
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.085,
                        top: height * 0.37,
                        child: Transform.rotate(
                          angle: 0,
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.white70,
                            size: width * 0.08,
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.18,
                        top: height * 0.19,
                        child: Icon(
                          Icons.arrow_right_sharp,
                          color: Colors.white70,
                          size: width * 0.08,
                        ),
                      ),
                      Positioned(
                        left: width * 0.00,
                        top: height * 0.19,
                        child: Icon(
                          Icons.arrow_left_sharp,
                          color: Colors.white70,
                          size: width * 0.08,
                        ),
                      ),
                    ],
                  ),
                ),
                listener: (details) {
                  print('Stick offset: ${details.x}');
                  print('Stick angle: ${-1 * details.y}');
                  //print('Stick direction: ${details.direction}');
                },
                stick: Container(
                  width: width * 0.066,
                  height: width * 0.066,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white70,
                      width: 5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                      ),
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: -5.0,
                        blurRadius: 1.0,
                      ),
                    ],

                    // borderRadius: BorderRadius.all(Radius.circular(width*0.5))
                  ),
                ),
              ),
            ), //right joystick
            Positioned(
              left: width * 0.30,
              top: height * 0.65,
              child: Stack(
                children: [
                  Image.asset("images/Rectangle 1.png"),
                ],
              ),
            ),//bottom navigation
            Positioned(

              top: height*0.675,
              left: width*0.39,

              child: Row(
              children: [
            GestureDetector(
              onTap:(){setState(() {
                _value=0;
                openDialog();
              });},

              child: Container(
              width:width*0.052,
              height: width*0.052,
              decoration: BoxDecoration(
                border: GradientBoxBorder(
                    width: 1.5,
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.black,
                          Colors.black,
                          Colors.blue,
                          Colors.blue,
                          Colors.blue,
                          Colors.black,
                          Colors.black,

                          //Colors.blue,
                          // Colors.black,
                        ])),

              shape: BoxShape.circle,


              ),
                child: Icon(Icons.flight_takeoff,color: Colors.white70,)
              ),
            ),
                SizedBox(
                  width: width*0.03,
                ),
                Container(
                    width:width*0.056,
                    height: width*0.056,
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                          width: 1.5,
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.black,
                                Colors.black,
                                Colors.blue,
                                Colors.blue,
                                Colors.blue,
                                Colors.black,
                                Colors.black,

                                //Colors.blue,
                                // Colors.black,
                              ])),

                      shape: BoxShape.circle,


                    ),
                    child: Icon(Icons.place_outlined,color: Colors.white70,)
                ),
                SizedBox(
                  width: width*0.03,
                ),
                Container(
                    width:width*0.052,
                    height: width*0.052,
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                          width: 1.5,
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.black,
                                Colors.black,
                                Colors.blue,
                                Colors.blue,
                                Colors.blue,
                                Colors.black,
                                Colors.black,

                                //Colors.blue,
                                // Colors.black,
                              ])),

                      shape: BoxShape.circle,


                    ),
                    child: Icon(Icons.meeting_room_outlined,color: Colors.white70,)
                ),


          ],
        ),)
          ],
        ),
      ),
    );
  }

  void batIncrement() {
    setState(() {
      if (batLevel < 100) {
        batLevel++;
      }
    });
  }

  void batDecrement() {
    setState(() {
      if (batLevel > 0) {
        batLevel--;

      }
    });
  }
  Future openDialog()=> showDialog(context: context,
      builder: (context)=>StatefulBuilder(
        builder: (context,setState)=> AlertDialog(
          backgroundColor: Color(0xFF26252F),
          alignment: Alignment.center,
          title: Row(children: [
            Icon(Icons.airplanemode_active,color: Colors.greenAccent,),
            SizedBox(width: 10.0,),
            Text("Take off?",textAlign: TextAlign.center,),
          ],

          mainAxisAlignment: MainAxisAlignment.center,),

          titleTextStyle: TextStyle(color: Colors.white,fontSize: 13.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.0,
              ),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 20.0,
                  inactiveTrackColor: Colors.white24,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 12.0,
                  ),
                ),
                child: Slider(
                    value: _value,
                    onChanged: (value){
                  setState(() {
                    _value = value;
                    if(_value == 100){
                      Navigator.pop(context);
                    }

                  },);
                  
                },
                  max: 100.0,
                  min: 0.0,
                  thumbColor: Colors.white,
                  activeColor: Colors.greenAccent.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),

              Container(
                width: 250.0,
                height: 2.0,
                color: Colors.white24,
              ),
              SizedBox(
                height: 25.0,
              ),

              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text("Cancel",style: TextStyle(fontSize: 13.0,color: Colors.white),),

              ),






            ],
          ),


          actionsAlignment: MainAxisAlignment.center,


        ),
      ),);//takeoff window
}
