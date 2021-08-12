import 'package:flutter/material.dart';
import 'package:shoppy_app/screens/home_screen.dart';
import 'package:shoppy_app/utils/colors.dart';

void main() {
  runApp(
    MaterialApp(
      home: ShoppyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ShoppyApp extends StatefulWidget {
  const ShoppyApp({Key? key}) : super(key: key);

  @override
  _ShoppyAppState createState() => _ShoppyAppState();
}

class _ShoppyAppState extends State<ShoppyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            textDirection: TextDirection.rtl,
            fit: StackFit.loose,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              Container(
                width: 150.0,
                height: 150.0,
                margin: EdgeInsets.only(
                  left: 20.0,
                  // bottom: 10.0,
                ),
                decoration: BoxDecoration(
                  color: primary300,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 150.0,
                height: 150.0,
                margin: EdgeInsets.only(
                  right: 20.0,
                  // bottom: 10.0,
                ),
                decoration: BoxDecoration(
                  color: primary300,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: primary,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                "Shoppy",
                style: TextStyle(
                    // color: Colors.white,
                    fontSize: 52.0,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = white),
              ),
              Text(
                "Shoppy",
                style: TextStyle(
                  color: primary900,
                  fontSize: 52.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
