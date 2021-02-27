import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

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
      body: Stack(children: [
        Image.asset('images/taxi1.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            // width: double.infinity,
            color: Colors.yellow[700].withOpacity(0.5),
            colorBlendMode: BlendMode.srcOver),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 24, 4, 24),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.8),
                ),
                child: Image.asset(
                  'images/tcsalogo.png',
                  scale: 10,
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 556,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.green[100].withOpacity(0.7),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            shadows: [
                              Shadow(
                                offset: Offset(-1.0, -1.0),
                                blurRadius: 6.0,
                                color: Colors.grey[300],
                              ),
                            ],
                            fontSize: 25,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                                style: GoogleFonts.inknutAntiqua(
                                  fontWeight: FontWeight.bold,
                                ),
                                text:
                                    'Welcome and thank you for choosing Taxi Cab SA!\n\n'),
                            TextSpan(
                                text:
                                    "This app is quick and easy to use. Just click on the desired province and decide whether you want to search where you want to go, or navigate through our list of available destinations. We also have a handy taxi fare calculator to assist you in the front seat of the cab.\n\n"),
                            TextSpan(
                                style: GoogleFonts.inknutAntiqua(
                                    fontWeight: FontWeight.bold),
                                text:
                                    'Switch on your location settings for better results.\n\n'),
                            TextSpan(
                                text:
                                    'More content shall be added regularily so bare with us if you are having trouble finding your taxi. You can visit our Facebook and Twitter pages to engage with the Taxi Cab SA community for more assistance.\n\n'),
                            TextSpan(
                                text:
                                    'In general, taxi fare prices are estimated similarily by distance...\n0 to 10km(local taxis) R5 - R12.50\n15 to 25km R11 - R20\n30 to 40km R18 - R33 etc..\nLong distance taxis(above 60km) also range but usually start at R50 and above.\n\n',
                                style:
                                    TextStyle(backgroundColor: Colors.white)),
                            TextSpan(
                                text:
                                    'Some taxi ranks do not have a high volume of commuters after a certain time so the availabilty could depend on the time of day. Which also leads to taxis mixing destinations.(eg. Phumula and Spruitview passengers share the same taxi after 7 pm at Noord taxi rank)\n\n'),
                            TextSpan(
                                text:
                                    "Even though we are the most reliable source of this information, we do advise that you confirm the taxi's destination with the driver of the taxi when boarding.\n\n"),
                            TextSpan(
                                text:
                                    "Engage with us on any of our social media accounts for any enquiries. \n\nThank you for using Taxi Cab SA. Safe travels.\n ")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
