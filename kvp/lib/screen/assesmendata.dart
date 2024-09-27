import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvp/provider/assesmentrecordprovider.dart';
import 'package:kvp/provider/girlidprovider.dart';
import 'package:provider/provider.dart';

class AssesmentResult extends StatefulWidget {
  const AssesmentResult({super.key});

  @override
  State<AssesmentResult> createState() => _AssesmentResultState();
}

class _AssesmentResultState extends State<AssesmentResult> {
  @override
  Widget build(BuildContext context) {
    final assesmentdata =
        Provider.of<AssesmentRecordProvider>(listen: false, context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Assessment Record",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Label Text
                  Text(
                    "Girl Name: ",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.blueAccent.withOpacity(0.6),
                        width: 1.5,
                      ),
                    ),
                    child: Consumer<GirlIdProvider>(
                      builder: (context, girlIdProvider, child) {
                        return Text(
                          girlIdProvider.selectgirlname!,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.blueAccent,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Select Year :",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black),
                ),
                const Spacer(),
                Consumer<AssesmentRecordProvider>(
                  builder: (context, value, child) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: assesmentdata.selectedYear,
                          hint: Text(
                            'Select Year',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          items: assesmentdata.years.map((String year) {
                            return DropdownMenuItem(
                              value: year,
                              child: Text(year),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              assesmentdata.storeSelectedYear(newValue);
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blueAccent,
                          ),
                          iconSize: 30,
                          dropdownColor: Colors.white,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Quarter Result ',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "Quarter :",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Consumer<AssesmentRecordProvider>(
                            builder: (context, value, child) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: assesmentdata.selectedQuarter,
                                    hint: Text(
                                      'quartar',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    items: assesmentdata.quarter
                                        .map((String quarter) {
                                      return DropdownMenuItem(
                                        value: quarter,
                                        child: Text(quarter),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        assesmentdata
                                            .storeSelectedQuarter(newValue);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.blueAccent,
                                    ),
                                    iconSize: 30,
                                    dropdownColor: Colors.white,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "PreAssesment :",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Consumer<AssesmentRecordProvider>(
                            builder: (context, value, child) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: assesmentdata.selectedPreResult,
                                    hint: Text(
                                      'PreAssesment',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    items: assesmentdata.result
                                        .map((String result) {
                                      return DropdownMenuItem(
                                        value: result,
                                        child: Text(result),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        assesmentdata
                                            .storeSelectedPreResult(newValue);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.blueAccent,
                                    ),
                                    iconSize: 30,
                                    dropdownColor: Colors.white,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "PostAssesment :",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Consumer<AssesmentRecordProvider>(
                            builder: (context, value, child) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: assesmentdata.selectedPostResult,
                                    hint: Text(
                                      'PostAssesment',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    items: assesmentdata.result
                                        .map((String result) {
                                      return DropdownMenuItem(
                                        value: result,
                                        child: Text(result),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        assesmentdata
                                            .storeSelectedPostResult(newValue);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.blueAccent,
                                    ),
                                    iconSize: 30,
                                    dropdownColor: Colors.white,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "Result :",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Consumer<AssesmentRecordProvider>(
                            builder: (context, value, child) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                decoration: BoxDecoration(
                                  color: getBackgroundColor(
                                      assesmentdata.selectedFinalResult),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: assesmentdata.selectedFinalResult,
                                    hint: Text(
                                      'result',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    items: assesmentdata.finalresult
                                        .map((String finalresult) {
                                      return DropdownMenuItem(
                                        value: finalresult,
                                        child: Text(finalresult),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        assesmentdata
                                            .storeSelectedFinalResult(newValue);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.blueAccent,
                                    ),
                                    iconSize: 30,
                                    dropdownColor: Colors.white,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Provider.of<AssesmentRecordProvider>(context, listen: false)
                    .storeAssessmentRecord(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Add assessment record",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color getBackgroundColor(String? result) {
  switch (result) {
    case 'progress':
      return Colors.greenAccent;
    case 'regress':
      return Colors.redAccent;
    case 'stable':
      return Colors.yellowAccent;
    default:
      return Colors.white;
  }
}

void submitMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromRGBO(25, 72, 106, 1.0),
        title: Text(
          "Success!!",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, fontSize: 20, color: Colors.yellow),
        ),
        content: Text(
          " ${Provider.of<AssesmentRecordProvider>(context, listen: false).selectedQuarter} Assessment Record Saved successfully.",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300, fontSize: 15, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<AssesmentRecordProvider>(context, listen: false)
                  .clearDropdown();
              Navigator.of(context).pop();
            },
            child: Text(
              "OK",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.yellow),
            ),
          ),
        ],
      );
    },
  );
}
