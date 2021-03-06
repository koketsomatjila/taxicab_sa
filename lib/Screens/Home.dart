import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxicab_sa/Common/Drawer.dart';
import 'package:taxicab_sa/Common/screen_navigation.dart';
import 'package:taxicab_sa/Screens/Calculator.dart';
import 'package:taxicab_sa/Screens/Gauteng.dart';
import 'package:taxicab_sa/Screens/NewsList.dart';
import 'package:taxicab_sa/Screens/NorthWest.dart';
import 'package:taxicab_sa/Screens/RankMap.dart';
// import 'package:taxicab_sa/Screens/Traffic.dart';
import 'package:taxicab_sa/Screens/Welcome.dart';
import 'package:taxicab_sa/Screens/WesternCape.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _checkPermission() async {
    final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;
    if (!isGpsOn) {
      print('Turn on location services before requesting permission.');
      return;
    }

    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      changeScreen(context, RankMap());
    } else if (status == PermissionStatus.denied) {
      print(
          'Permission denied. Show a dialog and again ask for the permission');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Take the user to the settings page.');
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.orange),
            backgroundColor: Colors.white.withOpacity(0.8),
            title: Text(
              'Taxi Cab SA',
              textAlign: TextAlign.center,
              style: GoogleFonts.aclonica(color: Colors.orange, fontSize: 25),
            )),
        extendBodyBehindAppBar: true,
        // menu drawer
        drawer: AppDrawer(),

        // home body
        body: Stack(children: [
          Image.asset('images/taxi1.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              // width: double.infinity,
              color: Colors.yellow[700].withOpacity(0.4),
              colorBlendMode: BlendMode.srcOver),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 18),
                      child: InkWell(
                        onTap: () {
                          changeScreen(context, Welcome());
                        },
                        child: ListTile(
                          title: Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                            size: 40,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Welcome",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: InkWell(
                        onTap: () {
                          _checkPermission();
                        },
                        child: ListTile(
                          title: Icon(
                            Icons.map,
                            color: Colors.white,
                            size: 40,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Nearest Rank Locator",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: InkWell(
                        onTap: () {
                          changeScreen(context, Calculator());
                        },
                        child: ListTile(
                          title: Icon(
                            Icons.calculate_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Taxi Fare Calculator",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: InkWell(
                        onTap: () {
                          changeScreen(context, News());
                        },
                        child: ListTile(
                          title: Icon(
                            Icons.article,
                            color: Colors.white,
                            size: 40,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Word On The Street",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: InkWell(
                        onTap: () {
                          changeScreen(context, Gauteng());
                        },
                        child: ListTile(
                          title: Icon(
                            Icons.local_taxi,
                            color: Colors.white,
                            size: 40,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Gauteng",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: InkWell(
                        onTap: () {
                          changeScreen(context, WesternCape());
                        },
                        child: ListTile(
                          title: Icon(
                            Icons.local_taxi,
                            color: Colors.white,
                            size: 40,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Western Cape",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: InkWell(
                        onTap: () {
                          changeScreen(context, NorthWest());
                        },
                        child: ListTile(
                          title: Icon(
                            Icons.local_taxi,
                            color: Colors.white,
                            size: 40,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "North West",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
