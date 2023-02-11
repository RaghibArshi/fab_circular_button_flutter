// import this Package in pubspec.yaml file
// dependencies:
//
//   fab_circular_menu: ^1.0.2

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:web_view_flutter/GoToHomeView.dart';
import 'package:web_view_flutter/imageSlider.dart';
import 'package:web_view_flutter/productScreen.dart';
import 'package:web_view_flutter/profileScreen.dart';
import 'package:web_view_flutter/userscreen.dart';

class MyCustomWidget extends StatelessWidget {

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xFF192A56),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(125.0),
                    child: Image.asset('assets/gif.gif', height: 250, width: 250,)
                ),
                SizedBox(height: 10.0,),
                MaterialButton(
                  onPressed: () {
                    // The menu can be handled programatically using a key
                    if (fabKey.currentState!.isOpen) {
                      fabKey.currentState!.close();
                    } else {
                      fabKey.currentState!.open();
                    }
                  },
                  color: Colors.white,
                  child: Text('Tap For Options', style: TextStyle(color: Colors.blueGrey)),
                ),
                SizedBox(height: 100.0,),
              ],
            ),
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FabCircularMenu(
            key: fabKey,
            // Cannot be `Alignment.center`
            alignment: Alignment.bottomLeft,
            ringColor: Colors.white.withAlpha(25),
            ringDiameter: 500.0,
            ringWidth: 150.0,
            fabSize: 64.0,
            fabElevation: 8.0,
            fabIconBorder: CircleBorder(),
            fabOpenColor: Colors.red,
            fabCloseColor: Colors.green,
            fabColor: Colors.white,
            fabOpenIcon: Icon(Icons.menu, color: Colors.black),
            fabCloseIcon: Icon(Icons.close, color: Colors.white),
            fabMargin: const EdgeInsets.all(16.0),
            animationDuration: const Duration(milliseconds: 800),
            animationCurve: Curves.bounceOut,
            onDisplayChange: (isOpen) {

            },
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.home, color: Colors.white),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.people, color: Colors.white),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TopProductScreen()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.star, color: Colors.white),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ImageSlider()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.photo_library, color: Colors.white),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.person_pin_rounded, color: Colors.white),
              ),
            ],
          ),
        ),
      );
  }
}
