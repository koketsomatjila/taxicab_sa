import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxicab_sa/Common/screen_navigation.dart';
import 'package:taxicab_sa/Screens/Calculator.dart';
import 'package:taxicab_sa/Screens/Contact.dart';
import 'package:taxicab_sa/Screens/Gauteng.dart';
import 'package:taxicab_sa/Screens/Home.dart';
import 'package:taxicab_sa/Screens/NorthWest.dart';
import 'package:taxicab_sa/Screens/Traffic.dart';
import 'package:taxicab_sa/Screens/WesternCape.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({Key key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
      children: [
        Image.asset('images/taxis.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.6),
            colorBlendMode: BlendMode.srcOver),
        Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 48.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Image.asset(
                            'images/tcsalogo.png',
                            height: 70,
                            alignment: Alignment.centerLeft,
                          ),
                        )),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      changeScreen(context, Home());
                    },
                    child: ListTile(
                      title: Text(
                        'Home',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      changeScreen(context, Calculator());
                    },
                    child: ListTile(
                      title: Text(
                        'Fare Calculator',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.calculate,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      changeScreen(context, Gauteng());
                    },
                    child: ListTile(
                      title: Text(
                        'Gauteng',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.local_taxi_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      changeScreen(context, WesternCape());
                    },
                    child: ListTile(
                      title: Text(
                        'Western Cape',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.local_taxi_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      changeScreen(context, NorthWest());
                    },
                    child: ListTile(
                      title: Text(
                        'North West',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.local_taxi_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      changeScreen(context, Traffic());
                    },
                    child: ListTile(
                      title: Text(
                        'Kwa-Zulu Natal',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.local_taxi_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      changeScreen(context, Traffic());
                    },
                    child: ListTile(
                      title: Text(
                        'Mpumalanga',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.local_taxi_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      changeScreen(context, Traffic());
                    },
                    child: ListTile(
                      title: Text(
                        'Limpopo',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.local_taxi_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      changeScreen(context, Traffic());
                    },
                    child: ListTile(
                      title: Text(
                        'Freestate',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.local_taxi_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      changeScreen(context, Traffic());
                    },
                    child: ListTile(
                      title: Text(
                        'Northern Cape',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.local_taxi_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      changeScreen(context, Traffic());
                    },
                    child: ListTile(
                      title: Text(
                        'Eastern Cape',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.local_taxi_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.white.withOpacity(0.1)),
                  Divider(
                    height: 27,
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      onTap: () {
                        changeScreen(context, Contact());
                      },
                      title: Text(
                        'Contact Us',
                        style: TextStyle(color: Colors.orange[100]),
                      ),
                      leading: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(
                    height: 17,
                  ),
                  Text(
                    '© TCSA APP, 2021',
                    style:
                        GoogleFonts.ubuntu(color: Colors.white30, fontSize: 10),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
