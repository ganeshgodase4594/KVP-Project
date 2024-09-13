// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:kvp/provider/attendenceprovider.dart';
// import 'package:kvp/provider/girlidprovider.dart';
// import 'package:provider/provider.dart';
// import 'package:table_calendar/table_calendar.dart';

// class AttendencePage extends StatefulWidget {
//   const AttendencePage({super.key});

//   @override
//   State<AttendencePage> createState() => _AttendencePageState();
// }

// class _AttendencePageState extends State<AttendencePage> {
//   @override
//   void initState() {
//     super.initState();

//     print("in initstate");

//     final girlid =
//         Provider.of<GirlIdProvider>(context, listen: false).selectedgirlid;

//     if (girlid != null) {
//       Provider.of<AttendenceProvider>(context, listen: false)
//           .fetchAttendanceData(girlid);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 50,
//             ),
//             Consumer<AttendenceProvider>(
//               builder: (BuildContext context, provider, Widget? child) {
//                 return TableCalendar(
//                   headerStyle: const HeaderStyle(
//                       titleCentered: true, formatButtonVisible: false),
//                   focusedDay: DateTime.now(),
//                   firstDay: DateTime.utc(2010, 10, 16),
//                   lastDay: DateTime.utc(2030, 3, 14),
//                   onDaySelected: (selectedDay, focusedDay) {
//                     _showDailogOfOnSelected(selectedDay, context);
//                   },
//                   calendarBuilders: CalendarBuilders(
//                     defaultBuilder: (context, day, focusedDay) {
//                       final status = provider.getStatus(day);

//                       Color dayColor = Colors.transparent;

//                       if (status == "Present") {
//                         dayColor = Colors.green.withOpacity(0.3);
//                       } else if (status == "Absent") {
//                         dayColor = Colors.red.withOpacity(0.3);
//                       } else if (status == "Holiday") {
//                         dayColor = Colors.blue.withOpacity(0.3);
//                       } else if (status == "none") {
//                         dayColor = Colors.transparent;
//                       }
//                       return Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           color: dayColor,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Center(child: Text('${day.day}')),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Divider(
//               thickness: 2,
//               color: Colors.black38,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.green.withOpacity(0.3),
//                   radius: 7,
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Text(
//                   "Present",
//                   style: GoogleFonts.poppins(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.red.withOpacity(0.3),
//                   radius: 7,
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Text(
//                   "Absent",
//                   style: GoogleFonts.poppins(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.blue.withOpacity(0.3),
//                   radius: 7,
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Text(
//                   "Holiday",
//                   style: GoogleFonts.poppins(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Divider(
//               thickness: 2,
//               color: Colors.black38,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _showDailogOfOnSelected(DateTime date, BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Center(
//               child: Text(
//                 "Mark Attendence",
//                 style: GoogleFonts.poppins(
//                   color: Colors.black,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   title: Text(
//                     "Present",
//                     style: GoogleFonts.poppins(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   onTap: () {
//                     Provider.of<AttendenceProvider>(context, listen: false)
//                         .updateAttendence(date, "Present", context);
//                   },
//                 ),
//                 ListTile(
//                   title: Text(
//                     "Absent",
//                     style: GoogleFonts.poppins(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   onTap: () {
//                     Provider.of<AttendenceProvider>(context, listen: false)
//                         .updateAttendence(date, "Absent", context);
//                   },
//                 ),
//                 ListTile(
//                   title: Text(
//                     "Holiday",
//                     style: GoogleFonts.poppins(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   onTap: () {
//                     Provider.of<AttendenceProvider>(context, listen: false)
//                         .updateAttendence(date, "Holiday", context);
//                   },
//                 ),
//                 ListTile(
//                   title: Text(
//                     "None",
//                     style: GoogleFonts.poppins(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   onTap: () {
//                     Provider.of<AttendenceProvider>(context, listen: false)
//                         .updateAttendence(date, "None", context);
//                   },
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
