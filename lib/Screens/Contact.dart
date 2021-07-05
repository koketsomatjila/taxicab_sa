import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxicab_sa/Common/Drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  Contact({Key key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.white.withOpacity(0.8),
        title: Text(
          'Taxi Cab SA',
          textAlign: TextAlign.center,
          style: GoogleFonts.aclonica(color: Colors.orange, fontSize: 25),
        ),
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: [
          Image.asset('images/taxi1.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              // width: double.infinity,
              color: Colors.white.withOpacity(0.8),
              colorBlendMode: BlendMode.srcOver),
          Container(
            alignment: Alignment.center,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 80, 4, 24),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Image.asset(
                    'images/tcsalogo.png',
                    scale: 20,
                  ),
                ),
              ),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(48, 18, 48, 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(59, 89, 152, 1),
                  ),
                  child: ListTile(
                    onTap: () async {
                      await launch("https://www.facebook.com/taxicabsa");
                    },
                    leading: Image.asset(
                      'images/facebook.png',
                      scale: 12,
                    ),
                    title: Text(
                      'Facebook',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(48, 8, 48, 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(80, 171, 241, 1),
                  ),
                  child: ListTile(
                    onTap: () async {
                      await launch("https://twitter.com/taxicabsa");
                    },
                    leading: Image.asset(
                      'images/twitter.png',
                      scale: 12,
                    ),
                    title: Text(
                      'Twitter',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(48, 8, 48, 8),
                child: Container(
                  decoration: BoxDecoration(color: Colors.indigo[800]),
                  child: ListTile(
                    onTap: () async {
                      await launch("mailto:taxicabza@gmail.com");
                    },
                    leading: Icon(
                      Icons.mail,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text(
                      'E-Mail',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
