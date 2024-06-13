import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            //shop name
            Text(
              "SUSHI MAN",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),

            const SizedBox(height: 25),
            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/sushi_egg.png'),
            ),
            const SizedBox(height: 25),
            //title
            Text(
              "THE TASTS OF JAPANESE FOOD",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 44, color: Colors.white),
            ),
            const SizedBox(height: 25),
            //subtitle
            Text(
              "feel the tasts of the most populer Japanese food from anywhere and anytime",
              style: TextStyle(
                color: Colors.grey[200],
                height: 2,
              ),
            ),
            //getstarted button
            Mybutton(
              text: "Get Started",
              onTap: () {
                //go to menu pages
                Navigator.pushNamed(context, '/menupage');
              } ,
            )
          ],
        ),
      ),
    );
  }
}
