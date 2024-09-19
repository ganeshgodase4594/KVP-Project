import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kvp/provider/dateprovider.dart';
import 'package:kvp/provider/vastifilterprovider.dart';
import 'package:provider/provider.dart';

import '../provider/attendenceprovider.dart';

class SearchName extends StatefulWidget {
  const SearchName({super.key});

  @override
  State<SearchName> createState() => _SearchNameState();
}

class _SearchNameState extends State<SearchName> {
  TextEditingController searchcontroller = TextEditingController();

  List vastisearchresult = [];
  List vibhagsearchresult = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<VastiProvider>(context, listen: false).fetchAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    final attendenceProvider = Provider.of<AttendenceProvider>(context);
    final vastiProvider = Provider.of<VastiProvider>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            height: 170,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(25, 72, 106, 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dateProvider.selectedDate != null
                              ? DateFormat('dd-MMM-yyyy')
                                  .format(dateProvider.selectedDate!)
                              : "Select Date",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: const Text(
                            "📅",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Filters : ",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showVastiDialog(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
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
                        IconButton(
                          icon: const Icon(Icons.clear_outlined,
                              color: Colors.white),
                          onPressed: () {
                            vastiProvider.clearSelectedVasti();
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showVibhagDialog(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
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
                        IconButton(
                          icon: const Icon(Icons.clear_outlined,
                              color: Colors.white),
                          onPressed: () {
                            vastiProvider.clearSelectedVibhag();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                                      String currentStatus = attendenceProvider
                                          .getStatus(date, context, girlid);
                                      String newStatus =
                                          currentStatus == 'A' ? 'P' : 'A';

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

  void showVastiDialog(BuildContext context) async {
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

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(20),
          title: Center(
            child: Text(
              "Select Vasti Name",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showVibhagDialog(BuildContext context) async {
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

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(20),
          title: Center(
            child: Text(
              "Select Vibhag Name",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
          ),
        );
      },
    );
  }
}
