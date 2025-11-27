import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MiCard extends StatelessWidget {
  const MiCard({super.key});

  @override
  Widget build(BuildContext context) {
    const spacing = 5.0;
    return Scaffold(
      appBar: AppBar(title: const Text("MiCard")),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: spacing ,
          children: [
            Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
                border: Border.all(color: Colors.grey),
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/imgs/IamRich.jpg",
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Text(
              "Mai Nguyen",
              style: GoogleFonts.merriweather(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Email: "),
                Container(
                  height: 20,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Text("maint.22git@gmail.com"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Phone Number: "),
                Container(
                  height: 20,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Text("123455678"),
                ),
              ],
            ),

          ]),
    );
  }
}
