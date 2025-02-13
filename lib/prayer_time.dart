import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

const apiUrl =
    'http://api.aladhan.com/v1/timingsByCity?city=Banjul&country=Gambia&method=2';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key});

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  Map<String, String> prayerTimes = {};
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchPrayerTimes(); // Fetch prayer times when the page loads
  }

  Future<void> fetchPrayerTimes() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final timings = data['data']['timings'];

        setState(() {
          prayerTimes = {
            "Fajr": timings["Fajr"],
            "Dhuhr": timings["Dhuhr"],
            "Asr": timings["Asr"],
            "Maghrib": timings["Maghrib"],
            "Isha": timings["Isha"],
          };
          isLoading = false;
          errorMessage = null; // Clear previous errors
        });
      } else {
        throw Exception('Failed to load prayer times. Server error.');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = "Failed to fetch prayer times. Please try again later.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF795548),
        title: const Center(
          child: Text(
            'MusApp',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator() // Show loading spinner
            : errorMessage != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, color: Colors.red, size: 40),
                      const SizedBox(height: 10),
                      Text(
                        errorMessage!,
                        style: GoogleFonts.aBeeZee(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: fetchPrayerTimes,
                        child: const Text("Retry"),
                      )
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: prayerTimes.entries.map((entry) {
                        return Card(
                          color: Colors.brown[100],
                          elevation: 2,
                          child: ListTile(
                            title: Text(
                              entry.key, // Prayer name
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(
                              entry.value, // Prayer time from API
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
      ),
    );
  }
}










































































































// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

// const apiUrl =
//     'http://api.aladhan.com/v1/timingsByCity?city=Banjul&country=Gambia&method=2';

// class PrayerTime extends StatefulWidget {
//   const PrayerTime({super.key});

//   @override
//   State<PrayerTime> createState() => _PrayerTimeState();
// }

// class _PrayerTimeState extends State<PrayerTime> {
//   Map<String, String> prayerTimes = {};
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchPrayerTimes(); // Fetch prayer times when the page loads
//   }

//   Future<void> fetchPrayerTimes() async {
//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final timings = data['data']['timings'];

//         setState(() {
//           prayerTimes = {
//             "Fajr": timings["Fajr"],
//             // "Sunrise": timings["Sunrise"], // Optional
//             "Dhuhr": timings["Dhuhr"],
//             "Asr": timings["Asr"],
//             "Maghrib": timings["Maghrib"],
//             "Isha": timings["Isha"],
//           };
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load prayer times');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       print("Error fetching prayer times: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF795548),
//         title: const Center(
//           child: Text(
//             'MusApp',
//             style: TextStyle(color: Colors.white),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//       body: Center(
//         child: isLoading
//             ? const CircularProgressIndicator() // Show loading spinner
//             : Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Column(
//                   children: prayerTimes.entries.map((entry) {
//                     return Card(
//                       color: Colors.brown[100],
//                       elevation: 2,
//                       child: ListTile(
//                         title: Text(
//                           entry.key, // Prayer name
//                           style: GoogleFonts.aBeeZee(
//                               fontSize: 22, fontWeight: FontWeight.bold),
//                         ),
//                         trailing: Text(
//                           entry.value, // Prayer time from API
//                           style: GoogleFonts.aBeeZee(
//                               fontSize: 22, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//       ),
//     );
//   }
// }
































































































































// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

// const apiKey =
//     'http://api.aladhan.com/v1/timingsByCity?city=Mecca&country=Saudi%20Arabia&method=2';

// class PrayerTime extends StatefulWidget {
//   const PrayerTime({super.key});

//   @override
//   State<PrayerTime> createState() => _PrayerTimeState();
// }

// class _PrayerTimeState extends State<PrayerTime> {
//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse(apiKey));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       print(data['data']['timings']);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF795548),
//         title: const Center(
//           child: Text(
//             'MusApp',
//             style: TextStyle(color: Colors.white),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//       body: Center(
//           child: Column(
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//               child: Padding(
//             padding: const EdgeInsets.only(left: 15),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                         child: Text(
//                       'Fajr',
//                       style: GoogleFonts.aBeeZee(
//                           color: Color(0xFF795548), fontSize: 25.0),
//                     )),
//                     Expanded(
//                         child: Text('06:35',
//                             style: GoogleFonts.aBeeZee(
//                                 color: Color(0xFF795548), fontSize: 25.0))),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                         child: Text('Zuhr',
//                             style: GoogleFonts.aBeeZee(
//                                 color: Color(0xFF795548), fontSize: 25.0))),
//                     Expanded(
//                         child: Text('14:00',
//                             style: GoogleFonts.aBeeZee(
//                                 color: Color(0xFF795548), fontSize: 25.0))),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                         child: Text('Asr',
//                             style: GoogleFonts.aBeeZee(
//                                 color: Color(0xFF795548), fontSize: 25.0))),
//                     Expanded(
//                         child: Text('17:00',
//                             style: GoogleFonts.aBeeZee(
//                                 color: Color(0xFF795548), fontSize: 25.0))),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                         child: Text('Maghrib',
//                             style: GoogleFonts.aBeeZee(
//                                 color: Color(0xFF795548), fontSize: 25.0))),
//                     Expanded(
//                         child: Text('19:18',
//                             style: GoogleFonts.aBeeZee(
//                                 color: Color(0xFF795548), fontSize: 25.0))),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                         child: Text('Isha',
//                             style: GoogleFonts.aBeeZee(
//                                 color: Color(0xFF795548), fontSize: 25.0))),
//                     Expanded(
//                         child: Text('20:18',
//                             style: GoogleFonts.aBeeZee(
//                                 color: Color(0xFF795548), fontSize: 25.0))),
//                   ],
//                 ),
//               ],
//             ),
//           ))
//         ],
//       )),
//     );
//   }
// }
