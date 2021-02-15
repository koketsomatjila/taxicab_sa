import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.orange),
          backgroundColor: Colors.white.withOpacity(0.8),
          title: Flexible(
            child: (Text(
              'Taxi Cab SA',
              textAlign: TextAlign.center,
              style: GoogleFonts.aclonica(color: Colors.orange, fontSize: 25),
            )),
          ),
        ),
        extendBodyBehindAppBar: true,
        // menu drawer
        drawer: Drawer(
          child: Stack(
            children: [
              Image.asset('images/jozi.jpg',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.6),
                  colorBlendMode: BlendMode.srcOver),
              Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: Column(
                      children: [
                        // Container(
                        //     child: Padding(
                        //   padding: const EdgeInsets.all(18.0),
                        //   child: Image.asset(
                        //     'images/tcsalogo.png',
                        //     height: 80,
                        //     alignment: Alignment.centerLeft,
                        //   ),
                        // )),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
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
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
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

                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
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
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
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
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
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
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
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
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
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
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
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
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
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
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
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
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
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
                          height: 27,
                        ),
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                              'About',
                              style: TextStyle(color: Colors.orange[100]),
                            ),
                            leading: Icon(
                              Icons.help_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: ListTile(
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

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
              padding: const EdgeInsets.only(top: 78.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 18),
                      child: InkWell(
                        onTap: () {},
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
                        onTap: () {},
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
                        onTap: () {},
                        child: ListTile(
                          title: Icon(
                            Icons.traffic,
                            color: Colors.white,
                            size: 40,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Traffic News Feed",
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
                        onTap: () {},
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
                        onTap: () {},
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
                        onTap: () {},
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
