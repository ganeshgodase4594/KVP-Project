import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../demopage.dart';
import '../provider/checkbox.dart';
import '../provider/suggestionprovider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Application Form For KVP Program",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(25, 72, 106, 1.0),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name Of Girl",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            textAlign: TextAlign.start,
                            controller: girlname,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.yellow,
                            ),
                            decoration: InputDecoration(
                                errorStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: "name",
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow),
                                border: InputBorder.none),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.trim().isEmpty) {
                                return 'Please enter girl name';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _formKey.currentState!.validate();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Contact No Of Girl  :",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                cursorColor: Colors.white,
                                textAlign: TextAlign.start,
                                controller: girlcontactnumber,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow,
                                ),
                                decoration: InputDecoration(
                                    errorStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Colors.red,
                                    ),
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    hintText: "contact no",
                                    hintStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Colors.yellow),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter The Contact Number";
                                  } else if (int.tryParse(value.trim()) ==
                                          null ||
                                      value.trim().length != 10) {
                                    return "Enter Your 10 Digit Mobile Num";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  _formKey.currentState!.validate();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Vasti Mobiliser Name",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            textAlign: TextAlign.start,
                            controller: vmname,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.yellow,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              hintText: "VM name",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow),
                              border: InputBorder.none,
                              errorStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Enter The VM name";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              if (value.isEmpty) {
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .vmlist
                                    .clear();
                              } else {
                                List<String> vmlocal =
                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .suggestedlist;

                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .autoComplete(vmlocal, value, "checkvm");
                              }
                              _formKey.currentState!.validate();
                            },
                          ),
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: suggestionProvider.vmlist.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 0),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title:
                                        Text(suggestionProvider.vmlist[index]),
                                    onTap: () {
                                      vmname.text =
                                          suggestionProvider.vmlist[index];
                                      suggestionProvider.vmlist.clear();
                                      suggestionProvider.notifyListeners();
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              "Trainer Name  :",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                cursorColor: Colors.white,
                                textAlign: TextAlign.start,
                                controller: trainername,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintText: "trainer name",
                                  hintStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.yellow),
                                  border: InputBorder.none,
                                  errorStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.red,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter The Trainer Name";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .trainerlist
                                        .clear();
                                  } else {
                                    List<String> trainerlocal =
                                        Provider.of<Suggestionprovider>(context,
                                                listen: false)
                                            .suggestedlist;

                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .autoComplete(trainerlocal, value,
                                            "checktrainer");
                                  }
                                  _formKey.currentState!.validate();
                                },
                              ),
                            ),
                          ],
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: suggestionProvider.trainerlist.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 0),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title: Text(
                                        suggestionProvider.trainerlist[index]),
                                    onTap: () {
                                      trainername.text =
                                          suggestionProvider.trainerlist[index];
                                      suggestionProvider.trainerlist.clear();
                                      suggestionProvider.notifyListeners();
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Text(
                          "Freelancer Name",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            textAlign: TextAlign.start,
                            controller: freelancername,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.yellow,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              hintText: "Freelancer Name",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow),
                              border: InputBorder.none,
                              errorStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Enter The Freelancer Name";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              if (value.isEmpty) {
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .freelancerlist
                                    .clear();
                              } else {
                                List<String> freelancerlocal =
                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .suggestedlist;

                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .autoComplete(freelancerlocal, value,
                                        "checkfreelance");
                              }
                              _formKey.currentState!.validate();
                            },
                          ),
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount:
                                  suggestionProvider.freelancerlist.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 0),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title: Text(suggestionProvider
                                        .freelancerlist[index]),
                                    onTap: () {
                                      freelancername.text = suggestionProvider
                                          .freelancerlist[index];
                                      suggestionProvider.freelancerlist.clear();
                                      suggestionProvider.notifyListeners();
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              "Coordinator Name  :",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                cursorColor: Colors.white,
                                textAlign: TextAlign.start,
                                controller: coordinatorname,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintText: "coordinator name",
                                  hintStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.yellow),
                                  border: InputBorder.none,
                                  errorStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.red,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter The Cooridinator Name";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .coordinatorlist
                                        .clear();
                                  } else {
                                    List<String> coordinatorlocal =
                                        Provider.of<Suggestionprovider>(context,
                                                listen: false)
                                            .suggestedlist;

                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .autoComplete(coordinatorlocal, value,
                                            "checkcoo");
                                  }
                                  _formKey.currentState!.validate();
                                },
                              ),
                            ),
                          ],
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount:
                                  suggestionProvider.coordinatorlist.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 0),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title: Text(suggestionProvider
                                        .coordinatorlist[index]),
                                    onTap: () {
                                      coordinatorname.text = suggestionProvider
                                          .coordinatorlist[index];
                                      suggestionProvider.coordinatorlist
                                          .clear();
                                      suggestionProvider.notifyListeners();
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Text(
                          "Vasti Name",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            textAlign: TextAlign.start,
                            controller: vastiname,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.yellow,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              hintText: "Vasti Name",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow),
                              border: InputBorder.none,
                              errorStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Enter The Vasti Name";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              if (value.isEmpty) {
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .vastilist
                                    .clear();
                              } else {
                                List<String> vastilocal =
                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .suggestedlist;

                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .autoComplete(
                                        vastilocal, value, "checkvasti");
                              }
                              _formKey.currentState!.validate();
                            },
                          ),
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: suggestionProvider.vastilist.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 0),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title: Text(
                                        suggestionProvider.vastilist[index]),
                                    onTap: () {
                                      vastiname.text =
                                          suggestionProvider.vastilist[index];
                                      suggestionProvider.vastilist.clear();
                                      suggestionProvider.notifyListeners();
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              "Vibhag Name  :",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                cursorColor: Colors.white,
                                textAlign: TextAlign.start,
                                controller: vibhagname,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintText: "vibhag name",
                                  hintStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.yellow),
                                  border: InputBorder.none,
                                  errorStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.red,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter The Vibhag Name";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .vibhaglist
                                        .clear();
                                  } else {
                                    List<String> vibhaglocal =
                                        Provider.of<Suggestionprovider>(context,
                                                listen: false)
                                            .suggestedlist;

                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .autoComplete(
                                            vibhaglocal, value, "checkvibhag");
                                  }
                                  _formKey.currentState!.validate();
                                },
                              ),
                            ),
                          ],
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: suggestionProvider.vibhaglist.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 0),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title: Text(
                                        suggestionProvider.vibhaglist[index]),
                                    onTap: () {
                                      vibhagname.text =
                                          suggestionProvider.vibhaglist[index];
                                      suggestionProvider.vibhaglist.clear();
                                      suggestionProvider.notifyListeners();
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Text(
                          "Sponsor Name  :",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            textAlign: TextAlign.start,
                            controller: sponsorcompany,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.yellow,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                              ),
                              hintText: "sponsor name",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow),
                              border: InputBorder.none,
                              errorStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Enter The Sponsor Name";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              if (value.isEmpty) {
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .sponsorlist
                                    .clear();
                              } else {
                                List<String> sponsorlocal =
                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .suggestedlist;

                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .autoComplete(
                                        sponsorlocal, value, "sponsor");
                              }
                              _formKey.currentState!.validate();
                            },
                          ),
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: suggestionProvider.sponsorlist.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 0),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title: Text(
                                        suggestionProvider.sponsorlist[index]),
                                    onTap: () {
                                      sponsorcompany.text =
                                          suggestionProvider.sponsorlist[index];
                                      suggestionProvider.sponsorlist.clear();
                                      suggestionProvider.notifyListeners();
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Entry (N or RE)  :",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: DropdownButtonFormField(
                                borderRadius: BorderRadius.circular(20),
                                menuMaxHeight: 115,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 10, bottom: 10),
                                  hintText: "Enter Entry NE or R",
                                  hintStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.yellow),
                                  border: InputBorder.none,
                                  errorStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.red,
                                  ),
                                ),
                                items: [
                                  DropdownMenuItem<String>(
                                    value: "NE",
                                    child: Text(
                                      "NE",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.yellow),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "R",
                                    child: Text(
                                      "R",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.yellow),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  neworrepeat.text = value!;
                                  _formKey.currentState!.validate();
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return "Select NE or R";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Level Of Education  :",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: DropdownButtonFormField(
                            borderRadius: BorderRadius.circular(20),
                            menuMaxHeight: 115,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.yellow,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              hintText: " Education Level I or II",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow),
                              border: InputBorder.none,
                              errorStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),
                            items: [
                              DropdownMenuItem<String>(
                                value: "I",
                                child: Text(
                                  "I",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.yellow),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "II",
                                child: Text(
                                  "II",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.yellow),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              levelno.text = value!;
                              _formKey.currentState!.validate();
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Select I or II";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "SSF Program  :",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          width: 350,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            maxLines: 3,
                            cursorColor: Colors.white,
                            textAlign: TextAlign.start,
                            controller: ssfprogram,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.yellow,
                            ),
                            decoration: InputDecoration(
                              hintMaxLines: 2,
                              contentPadding:
                                  const EdgeInsets.only(left: 10, top: 10),
                              hintText: "enter the ssf program name....",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow),
                              border: InputBorder.none,
                              errorStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Enter ssf program";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _formKey.currentState!.validate();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Special Achievement Of Girl  :",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          width: 350,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            maxLines: 5,
                            cursorColor: Colors.white,
                            textAlign: TextAlign.start,
                            controller: specialcomment,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.yellow,
                            ),
                            decoration: InputDecoration(
                              hintMaxLines: 4,
                              contentPadding:
                                  const EdgeInsets.only(left: 10, top: 10),
                              hintText:
                                  "enter the special achievement of the girl....",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow),
                              border: InputBorder.none,
                              errorStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Enter special achievement";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _formKey.currentState!.validate();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Girl Has Left KVP For Some Reason Then Displinary Action On Her  :",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          width: 350,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            maxLines: 5,
                            cursorColor: Colors.white,
                            textAlign: TextAlign.start,
                            controller: discuplinarycomment,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.yellow,
                            ),
                            decoration: InputDecoration(
                              hintMaxLines: 4,
                              contentPadding:
                                  const EdgeInsets.only(left: 10, top: 10),
                              hintText: "enter the action taken on her....",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Enter action taken on her";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _formKey.currentState!.validate();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Date of Girl leaving KVP after completion of all three levels  :",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            textAlign: TextAlign.start,
                            controller: dateoflivingkvp,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.yellow,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 10, top: 12),
                              suffixIcon: const Icon(
                                Icons.date_range_outlined,
                                color: Colors.yellow,
                              ),
                              hintText: "Date Of Leaving KVP",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow),
                              border: InputBorder.none,
                              errorStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter The Date";
                              }
                              return null;
                            },
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
                                  _formKey.currentState!.validate();
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(25, 72, 106, 1.0),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Program Of KVP Where Girl Has Participated",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                            child: CheckboxWithControllers()),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 800,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(25, 72, 106, 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Personal Details Of Girl",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Birth Date Of Girl  :",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          textAlign: TextAlign.start,
                          controller: dob,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.yellow,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 10, top: 12),
                            suffixIcon: const Icon(
                              Icons.date_range_outlined,
                              color: Colors.yellow,
                            ),
                            hintText: "DOB Of Girl",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow),
                            border: InputBorder.none,
                            errorStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.red,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter The DOB";
                            }
                            return null;
                          },
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
                                _formKey.currentState!.validate();
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Aadhar Number  :",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              textAlign: TextAlign.start,
                              controller: aadharnumber,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: "aadhar no",
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow),
                                border: InputBorder.none,
                                errorStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                              ),
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "Enter Valid Adhar Number";
                                } else if (int.tryParse(value.trim()) == null ||
                                    value.trim().length != 12) {
                                  return "Enter 12 Digit Aadhar Num";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _formKey.currentState!.validate();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "School Name  :",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          textAlign: TextAlign.start,
                          controller: nameofschool,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.yellow,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: "school name",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow),
                            border: InputBorder.none,
                            errorStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.red,
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Enter School Name";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "school timing  :",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              readOnly: true,
                              cursorColor: Colors.white,
                              textAlign: TextAlign.start,
                              controller: schooltiming,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.access_time,
                                  color: Colors.yellow,
                                ),
                                contentPadding:
                                    const EdgeInsets.only(left: 10, top: 13),
                                hintText: "school time",
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow),
                                border: InputBorder.none,
                                errorStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                              ),
                              onTap: () {
                                showTimeRangePickerr();
                              },
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "Enter Valid School Time";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _formKey.currentState!.validate();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Standard In School  :",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          textAlign: TextAlign.start,
                          controller: stdinschool,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.yellow,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: "std",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow),
                            border: InputBorder.none,
                            errorStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.red,
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Enter The School STD";
                            } else if (int.tryParse(value.trim()) == null ||
                                value.trim().length > 12) {
                              return "Enter Correct School STD";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Family Member :",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              textAlign: TextAlign.start,
                              controller: nooffamilymembers,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: "no of family member",
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow),
                                border: InputBorder.none,
                                errorStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                              ),
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "Enter The Family Member No";
                                } else if (int.tryParse(value.trim()) == null ||
                                    value.trim().length > 12) {
                                  return "Enter Correct Family No(Digit)";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _formKey.currentState!.validate();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Girl No  :",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          textAlign: TextAlign.start,
                          controller: noofgirlsfamily,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.yellow,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: "total no of girl in family",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow),
                            border: InputBorder.none,
                            errorStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.red,
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Enter The Girl No";
                            } else if (int.tryParse(value.trim()) == null ||
                                value.trim().length > 12) {
                              return "Enter Correct Girl No";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Mother Contact :",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              textAlign: TextAlign.start,
                              controller: mothercontact,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: "mother contact number",
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow),
                                border: InputBorder.none,
                                errorStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                              ),
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "Enter Mother Contact Number";
                                } else if (int.tryParse(value.trim()) == null ||
                                    value.trim().length != 10) {
                                  return "Enter Mother 10 Digit Mobile Num";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _formKey.currentState!.validate();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Father Contact  :",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          textAlign: TextAlign.start,
                          controller: fathercontact,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.yellow,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: "father contact number",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow),
                            border: InputBorder.none,
                            errorStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.red,
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Enter The Father Number";
                            } else if (int.tryParse(value.trim()) == null ||
                                value.trim().length != 10) {
                              return "Enter Father 10 Digit Mobile Num";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _formKey.currentState!.validate();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "All Girl Registerd   :",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: DropdownButtonFormField(
                              borderRadius: BorderRadius.circular(20),
                              menuMaxHeight: 115,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                hintText: "all girl registered kvp ",
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow),
                                border: InputBorder.none,
                                errorStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                              ),
                              items: [
                                DropdownMenuItem<String>(
                                  value: "Yes",
                                  child: Text(
                                    "Yes",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Colors.yellow),
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: "No",
                                  child: Text(
                                    "No",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Colors.yellow),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                allgirlsregistred.text = value!;
                                _formKey.currentState!.validate();
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "Seletct Yes or No";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(25, 72, 106, 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Parent Partcipitation",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Parent Meet 1   :",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: DropdownButtonFormField(
                          borderRadius: BorderRadius.circular(20),
                          menuMaxHeight: 115,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.yellow,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            hintText: "parent meet1 ",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow),
                            border: InputBorder.none,
                            errorStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.red,
                            ),
                          ),
                          items: [
                            DropdownMenuItem<String>(
                              value: "Yes",
                              child: Text(
                                "Yes",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "No",
                              child: Text(
                                "No",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            parentmeet1.text = value!;
                            _formKey.currentState!.validate();
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Seletct Yes or No";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Parent Meet 2  :",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: DropdownButtonFormField(
                              borderRadius: BorderRadius.circular(20),
                              menuMaxHeight: 115,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow,
                              ),
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                hintText: "paremt meet2 ",
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow),
                                border: InputBorder.none,
                                errorStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                              ),
                              items: [
                                DropdownMenuItem<String>(
                                  value: "Yes",
                                  child: Text(
                                    "Yes",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Colors.yellow),
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: "No",
                                  child: Text(
                                    "No",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Colors.yellow),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                parentmeet2.text = value!;
                                _formKey.currentState!.validate();
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "Seletct Yes or No";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Parent Meet 3   :",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: DropdownButtonFormField(
                          borderRadius: BorderRadius.circular(20),
                          menuMaxHeight: 115,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.yellow,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            hintText: "parent meet3 ",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.yellow),
                            border: InputBorder.none,
                            errorStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.red,
                            ),
                          ),
                          items: [
                            DropdownMenuItem<String>(
                              value: "Yes",
                              child: Text(
                                "Yes",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "No",
                              child: Text(
                                "No",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            parentmeet3.text = value!;
                            _formKey.currentState!.validate();
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Seletct Yes or No";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState?.validate() == true) {
                      storeDataToFirebase();
                      controllerClear();
                      submitMessage(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text("Please Complete The All Text Field")),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(25, 72, 106, 1.0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.yellow),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void controllerClear() {
    girlname.clear();
    girlcontactnumber.clear();
    vmname.clear();
    trainername.clear();
    freelancername.clear();
    coordinatorname.clear();
    vastiname.clear();
    vibhagname.clear();
    sponsorcompany.clear();
    neworrepeat.clear();
    levelno.clear();
    specialcomment.clear();
    discuplinarycomment.clear();
    dateoflivingkvp.clear();
    bhonda.clear();
    summercamp.clear();
    mangalagaur.clear();
    wintercamp.clear();
    haladikunku.clear();
    exposurevisit.clear();
    companyvisit.clear();
    kishoricarekit.clear();
    dob.clear();
    ssfprogram.clear();
    aadharnumber.clear();
    nameofschool.clear();
    schooltiming.clear();
    stdinschool.clear();
    nooffamilymembers.clear();
    noofgirlsfamily.clear();
    mothercontact.clear();
    fathercontact.clear();
    allgirlsregistred.clear();
    parentmeet1.clear();
    parentmeet2.clear();
    parentmeet3.clear();
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

  void submitMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(25, 72, 106, 1.0),
          title: Text(
            "Success!!",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.yellow),
          ),
          content: Text(
            "Data is submitted successfully.",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300, fontSize: 15, color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
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

  void showTimeRangePickerr() async {
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
