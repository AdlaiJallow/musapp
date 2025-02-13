import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_app/prayer_time.dart';
import 'quran_verses.dart';
import 'tasbih_page.dart';
import 'dart:ui'; // Import for blur effect

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String quranVerse = '';

  @override
  void initState() {
    super.initState();
    quranVerse = getQuranVerse(); // Load a verse when the app starts
  }

  String getQuranVerse() {
    Random random = Random();
    var juli = quran[random.nextInt(quran.length)];
    return '"${juli['text']}"\n\n(${juli['surah']}, ${juli['ayah']})';
  }

  void updateVerse() {
    setState(() {
      quranVerse = getQuranVerse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur Effect
          Positioned.fill(
            child: Image.asset(
              "images/background.webp",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),

          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50), // Adjusted top space

              // Title
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5), // Improved visibility
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Welcome to MusApp',
                  style: GoogleFonts.amiri(
                    fontSize: 28.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 15),

              // Quran Verse Display with Animation
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      quranVerse,
                      key: ValueKey(quranVerse), // Ensures animation on update
                      style: GoogleFonts.notoNastaliqUrdu(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Button to Get New Verse
              Center(
                child: ElevatedButton.icon(
                  onPressed: updateVerse,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.85),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                  icon: const Icon(Icons.refresh, color: Colors.black),
                  label: Text(
                    "New Verse",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Buttons for Navigation
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TasbihPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.85),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5,
                        ),
                        icon: const Icon(Icons.mosque, color: Colors.black),
                        label: Text(
                          'Tasbih',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // Spacing between buttons
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Add another feature here (e.g., Prayer Times)
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PrayerTime()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.85),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5,
                        ),
                        icon:
                            const Icon(Icons.access_time, color: Colors.black),
                        label: Text(
                          'Prayer Times',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

























































// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:google_fonts/google_fonts.dart';
// import 'quran_verses.dart';
// import 'tasbih_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String quranVerse = '';

//   @override
//   void initState() {
//     super.initState();
//     quranVerse = getQuranVerse(); // Load a verse when the app starts
//   }

//   String getQuranVerse() {
//     Random random = Random();
//     var juli = quran[random.nextInt(quran.length)];
//     return '"${juli['text']}"\n\n(${juli['surah']}, ${juli['ayah']})';
//   }

//   void updateVerse() {
//     setState(() {
//       quranVerse = getQuranVerse();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                     "images/background.webp"), // Add a beautiful Islamic background
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           // Content Overlay
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 10), // Space from top
//               // Title
//               Container(
//                 padding: const EdgeInsets.all(5.0),
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.4), // Glassmorphism effect
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Text(
//                   'Welcome to MusApp',
//                   style: GoogleFonts.amiri(
//                     fontSize: 28.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),

//               const SizedBox(height: 10),

//               // Quran Verse Display
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.all(10.0),
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.4),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text(
//                       quranVerse,
//                       style: GoogleFonts.notoNastaliqUrdu(
//                         fontSize: 26.0,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // Button to Get New Verse
//               Center(
//                 child: ElevatedButton(
//                   onPressed: updateVerse,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white.withOpacity(0.8),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 30, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Text(
//                     "Get New Verse",
//                     style: GoogleFonts.aBeeZee(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 25), // Space from bottom
//               Row(
//                 children: [
//                   Expanded(
//                       child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const TasbihPage()));
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white.withOpacity(0.8),
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 30, vertical: 12),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             elevation: 5,
//                           ),
//                           child: Text(
//                             'Tasbih',
//                             style: GoogleFonts.aBeeZee(
//                                 fontSize: 20,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ))),
//                   const SizedBox(width: 5), // Space from bottom
//                   Expanded(
//                       child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const TasbihPage()));
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white.withOpacity(0.8),
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 30, vertical: 12),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             elevation: 5,
//                           ),
//                           child: Text(
//                             'Tasbih',
//                             style: GoogleFonts.aBeeZee(
//                                 fontSize: 20,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ))),
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }














































// import 'package:flutter/material.dart';
// // import 'package:muslim_app/quran_verses.dart';
// import 'quran_verses.dart';
// import 'dart:math';
// import 'package:google_fonts/google_fonts.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String getQuranVerse() {
//     Random random = Random();
//     var juli = quran[random.nextInt(quran.length)];
//     return '"${juli['text']}"\n (${juli['surah']}, ${juli['ayah']}) ';
//   }

//   // String getQuranVerseText() {
//   //   Random ran
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF757575),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//               flex: 1,
//               child: Container(
//                 padding: const EdgeInsets.only(top: 5.0),
//                 margin: const EdgeInsets.all(5.0),
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.elliptical(7, 9)),
//                     color: Color(0xFF9E9E9E)),
//                 child: Text(
//                   'Welcome to MusApp',
//                   style: GoogleFonts.aBeeZee(
//                     fontSize: 33.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               )),
//           Expanded(
//               flex: 2,
//               child: Container(
//                 padding: const EdgeInsets.only(top: 5.0),
//                 margin: const EdgeInsets.all(5.0),
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.elliptical(7, 9)),
//                     color: Color(0xFF9E9E9E)),
//                 child: Text(
//                   getQuranVerse(),
//                   style: GoogleFonts.aBeeZee(
//                     fontSize: 33.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               )),
//           Expanded(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
                
//                 child: Container(
//                     padding: const EdgeInsets.only(top: 5.0),
//                     margin: const EdgeInsets.all(5.0),
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.elliptical(7, 9)),
//                         color: Color(0xFF9E9E9E)),
//                     child: GestureDetector(
//                       onTap: () {},
//                       child: Container(margin: const EdgeInsets.all(15.0),
//                         decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0)
//                         ),
//                     )),
//               ),
//               // const SizedBox(
//               //   width: 5.0,
//               // ),
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.only(top: 5.0),
//                   margin: const EdgeInsets.all(5.0),
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.elliptical(7, 9)),
//                       color: Color(0xFF9E9E9E)),
//                   child: const Text('Hello'),
//                 ),
//               )
//             ],
//           )),
//         ],
//       ),
//       // ],
//     );
//   }
// }


// // TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 30.0,
// //                       fontWeight: FontWeight.bold),
// //                   textAlign: TextAlign.center,