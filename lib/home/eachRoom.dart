import 'package:etics_app/home/rooms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class eachRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "NunitoLight",
          scaffoldBackgroundColor: Color(0xFF152238)),
      home: Equipment(),
    );
  }
}

class Equipment extends StatefulWidget {
  @override
  _EquipmentState createState() => _EquipmentState();
}

class _EquipmentState extends State<Equipment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon:
                    Icon(Icons.arrow_back, size: 30, color: Color(0xFF40F2E0)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Rooms()),
                  );
                },
              ),
              Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.keyboard_voice,
                            size: 30, color: Color(0xFF40F2E0)),
                        onPressed: () {},
                      )
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(height: 25.0),
        Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Row(
            children: <Widget>[
              Text('XII MIPA 1',
                  style: TextStyle(
                      color: Color(0xFFE0FFFF),
                      fontSize: 28,
                      fontFamily: 'NunitoBold'))
            ],
          ),
        ),
        SizedBox(height: 40.0),
        Container(
            height: MediaQuery.of(context).size.height - 200.0,
            decoration: BoxDecoration(
              color: Color(0xFFE0FFFF),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 250.0,
                        child: ListView(
                          children: [
                            _sensorWidget("assets/images/lightbulb.png",
                                "Light", "Connected"),
                            _sensorWidget("assets/images/air-conditioner.png",
                                "AC", "24* Celcius"),
                            _sensorWidget("assets/images/camera.png",
                                "Watch Class", "See Details"),
                            _sensorWidget(
                                "assets/images/door.png", "Door", "Opened"),
                            _sensorWidget("assets/images/parade.png",
                                "Motion Detector", "5 Detected Motions"),
                            _sensorWidget("assets/images/gas-mask.png",
                                "Gas Detector", "Not Detected"),
                          ],
                        )))
              ],
            ))
      ],
    ));
  }

  Widget _sensorWidget(String image, String sensorName, String text) {
    return Padding(
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10),
        child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                  children: [
                    Hero(
                        tag: image,
                        child: Image(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                            height: 85.0,
                            width: 85.0)),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(sensorName,
                            style: TextStyle(
                                color: Color(0xFF152238),
                                fontSize: 20,
                                fontFamily: 'NunitoBold')),
                        Text(text,
                            style: TextStyle(
                                color: Color(0xFF152238),
                                fontSize: 15,
                                fontFamily: 'NunitoLight'))
                      ],
                    )
                  ],
                )),
                IconButton(
                  icon: Icon(Icons.power_settings_new, size: 30),
                  color: Colors.green,
                  onPressed: () {},
                )
              ],
            )));
  }
}
