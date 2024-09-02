import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kvp/provider/checkbox.dart';
import 'package:provider/provider.dart';
import 'fetchdata.dart';
import 'provider/suggestionprovider.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => DemopageState();
}

class DemopageState extends State<DemoPage> {
  TextEditingController girlname = TextEditingController();
  TextEditingController girlcontactnumber = TextEditingController();
  TextEditingController vastiname = TextEditingController();
  TextEditingController vibhagname = TextEditingController();
  TextEditingController levelno = TextEditingController();
  TextEditingController neworrepeat = TextEditingController();
  TextEditingController vmname = TextEditingController();
  TextEditingController trainername = TextEditingController();
  TextEditingController freelancername = TextEditingController();
  TextEditingController coordinatorname = TextEditingController();
  TextEditingController sponsorcompany = TextEditingController();
  TextEditingController avgyearattendence = TextEditingController();
  TextEditingController avgpertest = TextEditingController();
  TextEditingController specialcomment = TextEditingController();
  TextEditingController discuplinarycomment = TextEditingController();
  TextEditingController dateoflivingkvp = TextEditingController();
  TextEditingController bhonda = TextEditingController();
  TextEditingController summercamp = TextEditingController();
  TextEditingController mangalagaur = TextEditingController();
  TextEditingController wintercamp = TextEditingController();
  TextEditingController haladikunku = TextEditingController();
  TextEditingController exposurevisit = TextEditingController();
  TextEditingController companyvisit = TextEditingController();
  TextEditingController ssfprogram = TextEditingController();
  TextEditingController kishoricarekit = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController aadharnumber = TextEditingController();
  TextEditingController nameofschool = TextEditingController();
  TextEditingController schooltiming = TextEditingController();
  TextEditingController stdinschool = TextEditingController();
  TextEditingController nooffamilymembers = TextEditingController();
  TextEditingController noofgirlsfamily = TextEditingController();
  TextEditingController allgirlsregistred = TextEditingController();
  TextEditingController mothercontact = TextEditingController();
  TextEditingController fathercontact = TextEditingController();
  TextEditingController parentmeet1 = TextEditingController();
  TextEditingController parentmeet2 = TextEditingController();
  TextEditingController parentmeet3 = TextEditingController();

  List<String> vasti = [];

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Provider.of<Suggestionprovider>(context, listen: false).loadSuggestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Enter the name of girl",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: girlname,
                decoration: InputDecoration(
                    hintText: "Name of the girl",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the contact number of girl",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: girlcontactnumber,
                decoration: InputDecoration(
                    hintText: "Contact number of girl",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter the Vasti Name",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: vastiname,
                decoration: const InputDecoration(
                    hintText: "Vasti Name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                onChanged: (value) {
                  if (value.isEmpty) {
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .vastilist
                        .clear();
                  } else {
                    List<String> vastilocal =
                        Provider.of<Suggestionprovider>(context, listen: false)
                            .suggestedlist;

                    Provider.of<Suggestionprovider>(context, listen: false)
                        .autoComplete(vastilocal, value, "checkvasti");
                  }
                },
              ),

              Flexible(
                child: Consumer<Suggestionprovider>(
                  builder: (BuildContext context, suggestionProvider,
                      Widget? child) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: suggestionProvider.vastilist.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(suggestionProvider.vastilist[index]),
                          onTap: () {
                            vastiname.text =
                                suggestionProvider.vastilist[index];

                            suggestionProvider.vastilist.clear();
                            suggestionProvider.notifyListeners();
                          },
                        );
                      },
                    );
                  },
                ),
              ),

              const Text(
                "Enter the Vibhag Name",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: vibhagname,
                decoration: const InputDecoration(
                    hintText: "Vibhag Name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                onChanged: (value) {
                  if (value.isEmpty) {
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .vibhaglist
                        .clear();
                  } else {
                    List<String> vibhaglocal =
                        Provider.of<Suggestionprovider>(context, listen: false)
                            .suggestedlist;
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .autoComplete(vibhaglocal, value, "checkvibhag");
                  }
                },
              ),

              Provider.of<Suggestionprovider>(context, listen: false)
                      .vibhaglist
                      .isNotEmpty
                  ? Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: Provider.of<Suggestionprovider>(context,
                                listen: false)
                            .vibhaglist
                            .length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(Provider.of<Suggestionprovider>(context,
                                    listen: false)
                                .vibhaglist[index]),
                            onTap: () {
                              vibhagname.text = Provider.of<Suggestionprovider>(
                                      context,
                                      listen: false)
                                  .vibhaglist[index];
                              Provider.of<Suggestionprovider>(context,
                                      listen: false)
                                  .vibhaglist
                                  .clear();
                            },
                          );
                        },
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the level of education",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: "select I or II (Level Of Education)",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  items: [
                    DropdownMenuItem(value: "I", child: Text("I")),
                    DropdownMenuItem(value: "II", child: Text("II"))
                  ],
                  onChanged: (value) {
                    levelno.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the Entry",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: "Select NE or R",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  items: [
                    DropdownMenuItem(value: "NE", child: Text("NE")),
                    DropdownMenuItem(value: "R", child: Text("R"))
                  ],
                  onChanged: (value) {
                    neworrepeat.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the Vasti Mobiliser Name",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: vmname,
                decoration: InputDecoration(
                    hintText: "VM Name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                onChanged: (value) {
                  if (value.isEmpty) {
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .vmlist
                        .clear();
                  } else {
                    List<String> vmlocal =
                        Provider.of<Suggestionprovider>(context, listen: false)
                            .suggestedlist;
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .autoComplete(vmlocal, value, "checkvm");
                  }
                },
              ),

              Provider.of<Suggestionprovider>(context, listen: false)
                      .vmlist
                      .isNotEmpty
                  ? Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: Provider.of<Suggestionprovider>(context,
                                listen: false)
                            .vmlist
                            .length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(Provider.of<Suggestionprovider>(context,
                                    listen: false)
                                .vmlist[index]),
                            onTap: () {
                              vmname.text = Provider.of<Suggestionprovider>(
                                      context,
                                      listen: false)
                                  .vmlist[index];
                              Provider.of<Suggestionprovider>(context,
                                      listen: false)
                                  .vmlist
                                  .clear();
                            },
                          );
                        },
                      ),
                    )
                  : Container(),

              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the Trainer Name",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: trainername,
                decoration: InputDecoration(
                    hintText: "Trainer Name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                onChanged: (value) {
                  if (value.isEmpty) {
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .trainerlist
                        .clear();
                  } else {
                    List<String> trainerlocal =
                        Provider.of<Suggestionprovider>(context, listen: false)
                            .suggestedlist;
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .autoComplete(trainerlocal, value, "checktrainer");
                  }
                },
              ),

              Provider.of<Suggestionprovider>(context, listen: false)
                      .trainerlist
                      .isNotEmpty
                  ? Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: Provider.of<Suggestionprovider>(context,
                                listen: false)
                            .trainerlist
                            .length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(Provider.of<Suggestionprovider>(context,
                                    listen: false)
                                .trainerlist[index]),
                            onTap: () {
                              trainername.text =
                                  Provider.of<Suggestionprovider>(context,
                                          listen: false)
                                      .trainerlist[index];
                              Provider.of<Suggestionprovider>(context,
                                      listen: false)
                                  .trainerlist
                                  .clear();
                            },
                          );
                        },
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the freelancer name",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: freelancername,
                decoration: InputDecoration(
                    hintText: "Freelancername Name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                onChanged: (value) {
                  if (value.isEmpty) {
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .freelancerlist
                        .clear();
                  } else {
                    List<String> freelocal =
                        Provider.of<Suggestionprovider>(context, listen: false)
                            .suggestedlist;
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .autoComplete(freelocal, value, "checkfreelance");
                  }
                },
              ),

              Provider.of<Suggestionprovider>(context, listen: false)
                      .freelancerlist
                      .isNotEmpty
                  ? Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: Provider.of<Suggestionprovider>(context,
                                listen: false)
                            .freelancerlist
                            .length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(Provider.of<Suggestionprovider>(context,
                                    listen: false)
                                .freelancerlist[index]),
                            onTap: () {
                              freelancername.text =
                                  Provider.of<Suggestionprovider>(context,
                                          listen: false)
                                      .freelancerlist[index];
                              Provider.of<Suggestionprovider>(context,
                                      listen: false)
                                  .freelancerlist
                                  .clear();
                            },
                          );
                        },
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the Coordinator name",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: coordinatorname,
                decoration: InputDecoration(
                    hintText: "coordinator Name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                onChanged: (value) {
                  if (value.isEmpty) {
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .coordinatorlist
                        .clear();
                  } else {
                    List<String> coo =
                        Provider.of<Suggestionprovider>(context, listen: false)
                            .suggestedlist;
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .autoComplete(coo, value, "checkcoo");
                  }
                },
              ),

              Provider.of<Suggestionprovider>(context, listen: false)
                      .coordinatorlist
                      .isNotEmpty
                  ? Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: Provider.of<Suggestionprovider>(context,
                                listen: false)
                            .coordinatorlist
                            .length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(Provider.of<Suggestionprovider>(context,
                                    listen: false)
                                .coordinatorlist[index]),
                            onTap: () {
                              coordinatorname.text =
                                  Provider.of<Suggestionprovider>(context,
                                          listen: false)
                                      .coordinatorlist[index];
                              Provider.of<Suggestionprovider>(context,
                                      listen: false)
                                  .coordinatorlist
                                  .clear();
                            },
                          );
                        },
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the Sponsor Company Name",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: sponsorcompany,
                decoration: InputDecoration(
                    hintText: "Sponsor Name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                onChanged: (value) {
                  if (value.isEmpty) {
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .sponsorlist
                        .clear();
                  } else {
                    List<String> vibhaglocal =
                        Provider.of<Suggestionprovider>(context, listen: false)
                            .suggestedlist;
                    Provider.of<Suggestionprovider>(context, listen: false)
                        .autoComplete(vibhaglocal, value, "checkvibhag");
                  }
                },
              ),

              Provider.of<Suggestionprovider>(context, listen: false)
                      .sponsorlist
                      .isNotEmpty
                  ? Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: Provider.of<Suggestionprovider>(context,
                                listen: false)
                            .sponsorlist
                            .length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(Provider.of<Suggestionprovider>(context,
                                    listen: false)
                                .sponsorlist[index]),
                            onTap: () {
                              sponsorcompany.text =
                                  Provider.of<Suggestionprovider>(context,
                                          listen: false)
                                      .sponsorlist[index];
                              Provider.of<Suggestionprovider>(context,
                                      listen: false)
                                  .sponsorlist
                                  .clear();
                            },
                          );
                        },
                      ),
                    )
                  : Container(),
              const SizedBox(
                height: 10,
              ),
              // Text(
              //   "Enter the Average yearly attendence of the girl",
              //   style: TextStyle(
              //       color: Colors.blue,
              //       fontSize: 15,
              //       fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // TextField(
              //   controller: avgyearattendence,
              //   decoration: InputDecoration(
              //       hintText: "Average Yearly Attendance of the girl",
              //       hintStyle:
              //           TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   "Enter the Average Performance in tests",
              //   style: TextStyle(
              //       color: Colors.blue,
              //       fontSize: 15,
              //       fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // TextField(
              //   controller: avgpertest,
              //   decoration: InputDecoration(
              //       hintText: "Average performance in tests",
              //       hintStyle:
              //           TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              Text(
                "Special Comment (Special achievement of the girl)",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: specialcomment,
                decoration: InputDecoration(
                    hintText: "special comment",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Special Commnet (like the girl has left kvp for some reason)",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: discuplinarycomment,
                decoration: InputDecoration(
                    hintText: "Special comment (discplinary action)",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Date of girl leaving kvp after completion of all three levels",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: dateoflivingkvp,
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.date_range_outlined,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                    ),
                    hintText: "Date of girl leaving kvp",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);

                    setState(() {
                      dateoflivingkvp.text = formattedDate;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Programs of kvp where the girl has participated",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w800,
                    fontSize: 15),
              )),

              Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: CheckboxWithControllers()),

              Text(
                "Any special SSF",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: ssfprogram,
                decoration: InputDecoration(
                    hintText: "SSF Program Name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),

              const SizedBox(
                height: 10,
              ),
              Text(
                "Birth Date of the Girl",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: dob,
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.date_range_outlined,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                    ),
                    hintText: "DOB",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);

                    setState(() {
                      dob.text = formattedDate;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Adhar Number of girl",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: aadharnumber,
                decoration: InputDecoration(
                    hintText: "Aadhar Number",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Name of school",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: nameofschool,
                decoration: InputDecoration(
                    hintText: "School name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "School Timing",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: schooltiming,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.access_time),
                    hintText: "school timing",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                readOnly: true,
                onTap: () {
                  showTimeRangePicker();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Standanrd in school (at time of entry in kvp)",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: stdinschool,
                decoration: InputDecoration(
                    hintText: "std in school",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Number of members in family",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: nooffamilymembers,
                decoration: InputDecoration(
                    hintText: "no of family member",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Number of girls in family",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: noofgirlsfamily,
                decoration: InputDecoration(
                    hintText: "no of girls in family",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Are all girls registred with KVP ?",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: "Enter yes or no",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  items: [
                    DropdownMenuItem(value: "Yes", child: Text("Yes")),
                    DropdownMenuItem(value: "No", child: Text("No")),
                  ],
                  onChanged: (value) {
                    allgirlsregistred.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Mothers Contact Number",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: mothercontact,
                decoration: InputDecoration(
                    hintText: "Mothers contact number",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Fathers contact Number",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: fathercontact,
                decoration: InputDecoration(
                    hintText: "Fathers contact number",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Parent Participation (Y/N)",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w800,
                    fontSize: 15),
              )),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Parents Meeting 1",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: "select yes or no",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  items: [
                    DropdownMenuItem(value: "Yes", child: Text("Yes")),
                    DropdownMenuItem(value: "No", child: Text("No"))
                  ],
                  onChanged: (value) {
                    parentmeet1.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Parent Meeting 2",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: "select yes or no",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  items: [
                    DropdownMenuItem(value: "Yes", child: Text("Yes")),
                    DropdownMenuItem(value: "No", child: Text("No"))
                  ],
                  onChanged: (value) {
                    parentmeet2.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Parent Meeting 3",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      hintText: "select yes or no",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  items: [
                    DropdownMenuItem(value: "Yes", child: Text("Yes")),
                    DropdownMenuItem(value: "No", child: Text("No"))
                  ],
                  onChanged: (value) {
                    parentmeet3.text = value!;
                  }),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  print("submitted successfully");
                  storeDataToFirebase();
                },
                child: Center(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dialogpopup(BuildContext context) {
    return AlertDialog(
      title: const Text('Do you want to fetch the data?'),
      actions: [
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const FetchDataPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  void storeDataToFirebase() {
    print("in storedatatofirebase");
    Map<String, dynamic> activity =
        Provider.of<CheckboxProvider>(context, listen: false).checkboxState;
    Map<String, dynamic> data = ({
      "Coordinator Name": coordinatorname.text,
      "NE or R": neworrepeat.text,
      "aadhar no": int.tryParse(aadharnumber.text),
      "all girl register": allgirlsregistred.text.toLowerCase() == 'yes',
      "avg attendence": double.tryParse(avgyearattendence.text),
      "avg performance": double.tryParse(avgpertest.text),
      "bhondla": activity['Bhonda'],
      "company visit": activity['Exposure Visit'],
      "contact no of girl": int.tryParse(girlcontactnumber.text),
      "date of girl leaving": dateoflivingkvp.text,
      "dob girl": dob.text,
      "exposure visit": activity['Exposure Visit'],
      "father contact": int.tryParse(fathercontact.text),
      "freelancer name": freelancername.text,
      "haladikunku": activity['Haladikunku'],
      "kishori care kit": activity['Kishori Care Kit'],
      "level": levelno.text,
      "mangalagaur": activity['Mangalagaur'],
      "mother contact": int.tryParse(mothercontact.text),
      "name of girl": girlname.text,
      "no of girl": int.tryParse(noofgirlsfamily.text),
      "no of member": int.tryParse(nooffamilymembers.text),
      "parent meet 1": parentmeet1.text.toLowerCase() == 'yes',
      "parent meet 2": parentmeet2.text.toLowerCase() == 'yes',
      "parent meet 3": parentmeet3.text.toLowerCase() == 'yes',
      "school name": nameofschool.text,
      "school time": schooltiming.text,
      "special comment": specialcomment.text,
      "special discp comment": discuplinarycomment.text,
      "sponsor company": sponsorcompany.text,
      "ssf program": ssfprogram.text,
      "std school": int.tryParse(stdinschool.text),
      "summer camp": activity['Summer Camp'],
      "trainer name": trainername.text,
      "vasti mobilliser name": vmname.text,
      "vasti name": vastiname.text,
      "vibhag name": vibhagname.text,
      "winter camp": activity['Winter Camp'],
    });
    FirebaseFirestore.instance
        .collection("girldetails")
        .add(data)
        .then((value) {
      dialogpopup(context);

      Provider.of<Suggestionprovider>(context, listen: false)
          .saveSuggestion(vastiname.text);
      Provider.of<Suggestionprovider>(context, listen: false)
          .saveSuggestion(vibhagname.text);

      Provider.of<Suggestionprovider>(context, listen: false)
          .saveSuggestion(trainername.text);

      Provider.of<Suggestionprovider>(context, listen: false)
          .saveSuggestion(freelancername.text);

      Provider.of<Suggestionprovider>(context, listen: false)
          .saveSuggestion(coordinatorname.text);

      Provider.of<Suggestionprovider>(context, listen: false)
          .saveSuggestion(vmname.text);

      Provider.of<Suggestionprovider>(context, listen: false)
          .saveSuggestion(sponsorcompany.text);

      print("Data submitted successfully");
    }).catchError((error) {
      print("Failed to add data: $error");
    });
  }

  void showTimeRangePicker() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Time Range'),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('From'),
                  trailing: Text(startTime.format(context)),
                  onTap: () => _selectTime(context, true),
                ),
                ListTile(
                  title: const Text('To'),
                  trailing: Text(endTime.format(context)),
                  onTap: () => _selectTime(context, false),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime : endTime,
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          startTime = pickedTime;
        } else {
          endTime = pickedTime;
        }
        _updateTimeRange();
      });
    }
  }

  void _updateTimeRange() {
    final start = startTime.format(context);
    final end = endTime.format(context);
    schooltiming.text = '$start to $end';
  }
}

class CheckboxWithControllers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final checkboxProvider = Provider.of<CheckboxProvider>(context);

    return ListView.builder(
      itemCount: checkboxProvider.checkboxState.keys.length,
      itemBuilder: (context, index) {
        final key = checkboxProvider.checkboxState.keys.elementAt(index);
        final value = checkboxProvider.checkboxState[key] ?? false;
        print("Value is a : $value");

        return CheckboxListTile(
          side: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
          checkColor: Colors.white,
          activeColor: Colors.yellow,
          title: Text(
            key,
            style: GoogleFonts.poppins(
                color: Colors.yellow,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          value: value,
          onChanged: (bool? newValue) {
            print("newValue is a : $newValue");
            if (newValue != null) {
              checkboxProvider.updateCheckbox(key, newValue);
            }
          },
        );
      },
    );
  }
}
