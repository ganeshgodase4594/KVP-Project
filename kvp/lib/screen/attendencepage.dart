import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kvp/provider/dateprovider.dart';
import 'package:kvp/provider/vastifilterprovider.dart';
import 'package:provider/provider.dart';

import '../provider/attendenceprovider.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({super.key});

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  TextEditingController searchcontroller = TextEditingController();

  List vastisearchresult = [];
  List vibhagsearchresult = [];
  bool _isDataFetched = false;

  @override
  void initState() {
    super.initState();
    if (!_isDataFetched) {
      Future.microtask(() {
        Provider.of<VastiProvider>(context, listen: false).fetchAllData();
      });
      _isDataFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // here we access the different provider....

    final dateProvider = Provider.of<DateProvider>(context);
    final attendenceProvider =
        Provider.of<AttendenceProvider>(context, listen: false);
    final vastiProvider = Provider.of<VastiProvider>(context, listen: false);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(25, 72, 106, 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(),
                      Center(
                        child: Text(
                          "Girl Attendance",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.white, thickness: 2),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.white, Colors.blueAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          dateProvider.selectedDate != null
                              ? DateFormat('dd-MMM-yyyy')
                                  .format(dateProvider.selectedDate!)
                              : "Select Date",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            shadows: [
                              Shadow(
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(1, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      /*
                      When we click the calender icon then call the _selectDate Function..
                      _selectDate Function Return The showDateTimePicker Widget.....
                      */
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Text(
                              "📅",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showVastiBottomSheet(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.blueAccent, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            border: Border.all(
                                color: Colors.white.withOpacity(0.5), width: 2),
                          ),
                          child: Consumer<VastiProvider>(
                            builder: (context, value, child) {
                              return Text(
                                vastiProvider.selectedVasti.isNotEmpty
                                    ? vastiProvider.selectedVasti
                                    : "Select Vasti",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              );
                            },
                          ),
                        ),
                      ),
                      Consumer<VastiProvider>(
                        builder: (context, value, child) {
                          return value.isvastiIcon
                              ? IconButton(
                                  icon: const Icon(Icons.clear_outlined,
                                      color: Colors.white),
                                  onPressed: () {
                                    value.clearSelectedVasti();
                                  },
                                )
                              : Container();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showVibhagBottomSheet(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.blueAccent, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            border: Border.all(
                                color: Colors.white.withOpacity(0.5), width: 2),
                          ),
                          child: Consumer<VastiProvider>(
                            builder: (context, value, child) {
                              return Text(
                                value.selectedVibhag.isNotEmpty
                                    ? value.selectedVibhag
                                    : "Select Vibhag",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              );
                            },
                          ),
                        ),
                      ),
                      Consumer<VastiProvider>(
                        builder: (context, value, child) {
                          return value.isvibhagIcon
                              ? IconButton(
                                  icon: const Icon(Icons.clear_outlined,
                                      color: Colors.white),
                                  onPressed: () {
                                    value.clearSelectedVibhag();
                                  },
                                )
                              : Container();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          /*
          when we visit the first time on attendence page,so we don't select any date..
          so if date is null then we show image else we show girlsname with attendence status.... 
          */
          dateProvider.selectedDate == null
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset("assets/images/finalattend.png"),
                      const SizedBox(height: 16),
                      Text(
                        "Please select the date and continue to take attendance.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(25, 72, 106, 1.0),
                          letterSpacing: 1.2,
                          height: 1.5,
                          shadows: [
                            Shadow(
                              blurRadius: 4.0,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(2.0, 2.0),
                            ),
                          ],
                          decoration: TextDecoration.underline,
                          decorationColor:
                              const Color.fromRGBO(25, 72, 106, 1.0),
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Consumer<VastiProvider>(
                      builder: (context, value, child) {
                        /*
                        Here We Return The Girl Name with attendence status
                        */
                        return ListView.builder(
                          itemCount: vastiProvider.filteredData.length,
                          itemBuilder: (context, index) {
                            String nameOfGirl = vastiProvider
                                .filteredData[index]['name of girl'];
                            String girlid =
                                vastiProvider.filteredData[index]['id'];

                            // Fetch the attendance status based on the selected date
                            attendenceProvider.fetchAttendenceData(girlid);

                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    nameOfGirl,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      DateTime date =
                                          dateProvider.selectedDate!;
                                      /*
                                          Here we firstly get the attendence status of a girl using currentStatus Function....
                                          */
                                      String currentStatus = attendenceProvider
                                          .getStatus(date, context, girlid);

                                      /*
                                          if we click the A then its convert on P Else remain same ("A")....
                                          in newStatus we Store The attendence status....
                                          */

                                      String newStatus =
                                          currentStatus == 'A' ? 'P' : 'A';

                                      /*
                                      if we get newStatus then we update this status using updateAttendence Function....
                                      */

                                      attendenceProvider.updateAttendence(
                                          date, newStatus, context, girlid);
                                    },
                                    child: Consumer<AttendenceProvider>(
                                      builder: (context, value, child) {
                                        String status = value.getStatus(
                                            dateProvider.selectedDate!,
                                            context,
                                            girlid);

                                        return Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: status == 'A'
                                                ? Colors.red
                                                : Colors.green,
                                          ),
                                          child: Center(
                                            child: Text(
                                              status,
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  /*
  Function for selectTheDate....
  */

  Future<void> _selectDate(BuildContext context) async {
    final DateProvider dateProvider =
        Provider.of<DateProvider>(context, listen: false);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateProvider.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateProvider.setSelectedDate(picked);
    }
  }

  /*
  Function for VastiFilter....
  */

  void showVastiBottomSheet(BuildContext context) async {
    QuerySnapshot firebaseVasti =
        await FirebaseFirestore.instance.collection("girldetails").get();

    Set<String> vastiNameSet = {};

    for (var vastidata in firebaseVasti.docs) {
      String vastiname = vastidata['vasti name'];
      vastiNameSet.add(vastiname);
    }
    List<String> vastiName = vastiNameSet.toList();

    String selectedVasti =
        Provider.of<VastiProvider>(context, listen: false).selectedVasti;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Select Vasti Name",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: vastiName.length,
                    itemBuilder: (BuildContext context, int index) {
                      String vasti = vastiName[index];
                      bool isSelected = vasti == selectedVasti;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<VastiProvider>(context, listen: false)
                                .setSelectedVasti(vastiName[index]);
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue.withOpacity(0.2)
                                  : Colors.transparent,
                              border: isSelected
                                  ? Border.all(color: Colors.blue, width: 2)
                                  : Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              vastiName[index],
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/*
  Function for selectVastiFilter....
  */

void showVibhagBottomSheet(BuildContext context) async {
  QuerySnapshot firebaseVibhag =
      await FirebaseFirestore.instance.collection("girldetails").get();

  Set<String> vibhagNameSet = {};

  String selectedVibhag =
      Provider.of<VastiProvider>(context, listen: false).selectedVibhag;

  for (var vibhagdata in firebaseVibhag.docs) {
    print("vibhagdata is : ${vibhagdata['vibhag name']}");
    String vibhagname = vibhagdata['vibhag name'];
    vibhagNameSet.add(vibhagname);
  }

  List<String> vibhagName = vibhagNameSet.toList();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Select Vibhag Name",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: vibhagName.length,
                  itemBuilder: (BuildContext context, index) {
                    String vibhag = vibhagName[index];
                    bool isSelected = vibhag == selectedVibhag;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<VastiProvider>(context, listen: false)
                              .setSelectedVibhag(vibhagName[index]);
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.blue.withOpacity(0.2)
                                : Colors.transparent,
                            border: isSelected
                                ? Border.all(color: Colors.blue, width: 2)
                                : Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            vibhagName[index],
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
