import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../widget/checkbox.dart';
import '../provider/checkbox.dart';
import '../provider/suggestionprovider.dart';
import '../provider/timeprovider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  /*
 
 Differnrt controller for the save textfield data

  */

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

  /*

  Used local key for validation..

  */

  final _nameKey = GlobalKey<FormFieldState<String>>();
  final _conatctkey = GlobalKey<FormFieldState<String>>();
  final _vmkey = GlobalKey<FormFieldState<String>>();
  final _vastikey = GlobalKey<FormFieldState<String>>();
  final _vibhagkey = GlobalKey<FormFieldState<String>>();
  final _trainerkey = GlobalKey<FormFieldState<String>>();
  final _freelancerkey = GlobalKey<FormFieldState<String>>();
  final _coordinatorkey = GlobalKey<FormFieldState<String>>();
  final _sponsorkey = GlobalKey<FormFieldState<String>>();
  final _norekey = GlobalKey<FormFieldState<String>>();
  final _level = GlobalKey<FormFieldState<String>>();
  final _ssfkey = GlobalKey<FormFieldState<String>>();
  final _dolkey = GlobalKey<FormFieldState<String>>();
  final _dobkey = GlobalKey<FormFieldState<String>>();
  final _aadharkey = GlobalKey<FormFieldState<String>>();
  final _schoolnamekey = GlobalKey<FormFieldState<String>>();
  final _schooltimekey = GlobalKey<FormFieldState<String>>();
  final _stdkey = GlobalKey<FormFieldState<String>>();
  final _nooffamilykey = GlobalKey<FormFieldState<String>>();
  final _totalnogirlkey = GlobalKey<FormFieldState<String>>();
  final _mothercontactkey = GlobalKey<FormFieldState<String>>();
  final _fathercontacrkey = GlobalKey<FormFieldState<String>>();
  final _allgirlregisterkey = GlobalKey<FormFieldState<String>>();
  final _parentmeet1key = GlobalKey<FormFieldState<String>>();
  final _parentmeet2key = GlobalKey<FormFieldState<String>>();
  final _parentmeet3key = GlobalKey<FormFieldState<String>>();

  /*

  Used FocusNode for the suggestion list purpose..

  */

  final FocusNode _vmFocusNode = FocusNode();
  final FocusNode _trainerFocusNode = FocusNode();
  final FocusNode _freelancerFocusNode = FocusNode();
  final FocusNode _cooFocusNode = FocusNode();
  final FocusNode _vastiFocusNode = FocusNode();
  final FocusNode _vibhgFocusNode = FocusNode();
  final FocusNode _sponsorFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    /*

      Clears matched items and updates state when the focus is lost ...same for all remaning items


    */

    _vmFocusNode.addListener(() {
      if (!_vmFocusNode.hasFocus) {
        Provider.of<Suggestionprovider>(context, listen: false)
            .matchedItems
            .clear();
        Provider.of<Suggestionprovider>(context, listen: false).vmbuild = false;
        Provider.of<Suggestionprovider>(context, listen: false)
            .notifyListeners();
      }
    });

    _trainerFocusNode.addListener(() {
      if (!_trainerFocusNode.hasFocus) {
        Provider.of<Suggestionprovider>(context, listen: false)
            .matchedItems
            .clear();
        Provider.of<Suggestionprovider>(context, listen: false).trainerbuyild =
            false;
        Provider.of<Suggestionprovider>(context, listen: false)
            .notifyListeners();
      }
    });

    _freelancerFocusNode.addListener(() {
      if (!_freelancerFocusNode.hasFocus) {
        Provider.of<Suggestionprovider>(context, listen: false)
            .matchedItems
            .clear();
        Provider.of<Suggestionprovider>(context, listen: false)
            .freelancerbuild = false;
        Provider.of<Suggestionprovider>(context, listen: false)
            .notifyListeners();
      }
    });

    _cooFocusNode.addListener(() {
      if (!_cooFocusNode.hasFocus) {
        Provider.of<Suggestionprovider>(context, listen: false)
            .matchedItems
            .clear();
        Provider.of<Suggestionprovider>(context, listen: false).coobuild =
            false;
        Provider.of<Suggestionprovider>(context, listen: false)
            .notifyListeners();
      }
    });

    _vastiFocusNode.addListener(() {
      if (!_vastiFocusNode.hasFocus) {
        Provider.of<Suggestionprovider>(context, listen: false)
            .matchedItems
            .clear();
        Provider.of<Suggestionprovider>(context, listen: false).vastibuild =
            false;
        Provider.of<Suggestionprovider>(context, listen: false)
            .notifyListeners();
      }
    });

    _vibhgFocusNode.addListener(() {
      if (!_vibhgFocusNode.hasFocus) {
        Provider.of<Suggestionprovider>(context, listen: false)
            .matchedItems
            .clear();
        Provider.of<Suggestionprovider>(context, listen: false).vibhagbuild =
            false;
        Provider.of<Suggestionprovider>(context, listen: false)
            .notifyListeners();
      }
    });

    _sponsorFocusNode.addListener(() {
      if (!_sponsorFocusNode.hasFocus) {
        Provider.of<Suggestionprovider>(context, listen: false)
            .matchedItems
            .clear();
        Provider.of<Suggestionprovider>(context, listen: false).sponsorbuild =
            false;
        Provider.of<Suggestionprovider>(context, listen: false)
            .notifyListeners();
      }
    });

    Provider.of<Suggestionprovider>(context, listen: false).loadSuggestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
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
                        Row(
                          children: [
                            Text(
                              "Name Of Girl ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            keyboardType: TextInputType.text,
                            key: _nameKey,
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
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintText: "Enter Full Name",
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
                              _nameKey.currentState!.validate();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Contact No. Of Girl : ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  "* ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  key: _conatctkey,
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
                                      hintText: "Enter Phone Number",
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
                                    _conatctkey.currentState!.validate();
                                  },
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
                            Text(
                              "Vasti Name ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            keyboardType: TextInputType.text,
                            key: _vastikey,
                            focusNode: _vastiFocusNode,
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
                              hintText: "Enter Name",
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
                                    .matchedItems;
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .vastibuild = false;
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .notifyListeners();
                              } else {
                                List<String> vastilocal =
                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .vastilist;

                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .vastibuild = true;

                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .autoComplete(
                                        vastilocal, value, "checkvasti");
                              }
                              _vastikey.currentState!.validate();
                            },
                          ),
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            if (suggestionProvider.vastibuild == true) {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount:
                                    suggestionProvider.matchedItems.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 0),
                                itemBuilder: (context, index) {
                                  return Container(
                                    width:
                                        (MediaQuery.of(context).size.width) / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blueAccent,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      title: Text(suggestionProvider
                                          .matchedItems[index]),
                                      onTap: () {
                                        vastiname.text = suggestionProvider
                                            .matchedItems[index];
                                        suggestionProvider.matchedItems.clear();
                                        suggestionProvider.notifyListeners();
                                      },
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Vibhag Name : ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  "* ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  key: _vibhagkey,
                                  focusNode: _vibhgFocusNode,
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
                                    hintText: "Enter Name",
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
                                          .matchedItems;
                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .vibhagbuild = false;
                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .notifyListeners();
                                    } else {
                                      List<String> vibhaglocal =
                                          Provider.of<Suggestionprovider>(
                                                  context,
                                                  listen: false)
                                              .vibhaglist;

                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .vibhagbuild = true;

                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .autoComplete(vibhaglocal, value,
                                              "checkvibhag");
                                    }
                                    _vibhagkey.currentState!.validate();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            if (suggestionProvider.vibhagbuild == true) {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount:
                                    suggestionProvider.matchedItems.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 0),
                                itemBuilder: (context, index) {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.blueAccent,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ]),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      title: Text(suggestionProvider
                                          .matchedItems[index]),
                                      onTap: () {
                                        vibhagname.text = suggestionProvider
                                            .matchedItems[index];
                                        suggestionProvider.matchedItems.clear();
                                        suggestionProvider.notifyListeners();
                                      },
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Vasti Mobiliser Name ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            keyboardType: TextInputType.text,
                            key: _vmkey,
                            focusNode: _vmFocusNode,
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
                              hintText: "Enter Name",
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
                              _vmkey.currentState!.validate();
                              if (value.isEmpty) {
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .matchedItems;
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .vmbuild = false;
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .notifyListeners();
                              } else {
                                List<String> vmlocal =
                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .vmlist;
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .vmbuild = false;

                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .autoComplete(vmlocal, value, "checkvm");
                              }
                            },
                          ),
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            if (suggestionProvider.vmbuild == true) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    suggestionProvider.matchedItems.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blueAccent,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      title: Text(suggestionProvider
                                          .matchedItems[index]),
                                      onTap: () {
                                        vmname.text = suggestionProvider
                                            .matchedItems[index];
                                        suggestionProvider.matchedItems.clear();
                                        suggestionProvider.notifyListeners();
                                      },
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Trainer Name : ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  "* ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  key: _trainerkey,
                                  focusNode: _trainerFocusNode,
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
                                    hintText: "Enter Name",
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
                                    _trainerkey.currentState!.validate();

                                    if (value.isEmpty) {
                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .matchedItems;
                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .trainerbuyild = false;
                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .notifyListeners();
                                    } else {
                                      List<String> trainerlocal =
                                          Provider.of<Suggestionprovider>(
                                                  context,
                                                  listen: false)
                                              .trainerlist;

                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .trainerbuyild = true;

                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .autoComplete(trainerlocal, value,
                                              "checktrainer");
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            if (suggestionProvider.trainerbuyild == true) {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount:
                                    suggestionProvider.matchedItems.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 0),
                                itemBuilder: (context, index) {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.blueAccent,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ]),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      title: Text(suggestionProvider
                                          .matchedItems[index]),
                                      onTap: () {
                                        trainername.text = suggestionProvider
                                            .matchedItems[index];
                                        suggestionProvider.matchedItems.clear();
                                        suggestionProvider.notifyListeners();
                                      },
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              "Freelancer Name ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            keyboardType: TextInputType.text,
                            key: _freelancerkey,
                            focusNode: _freelancerFocusNode,
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
                              hintText: "Enter Name",
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
                              _freelancerkey.currentState!.validate();

                              if (value.isEmpty) {
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .matchedItems;
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .freelancerbuild = false;
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .notifyListeners();
                              } else {
                                List<String> freelancerlocal =
                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .freelancerlist;

                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .freelancerbuild = true;

                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .autoComplete(freelancerlocal, value,
                                        "checkfreelance");
                              }
                            },
                          ),
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            if (suggestionProvider.freelancerbuild == true) {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount:
                                    suggestionProvider.matchedItems.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 0),
                                itemBuilder: (context, index) {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.blueAccent,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ]),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      title: Text(suggestionProvider
                                          .matchedItems[index]),
                                      onTap: () {
                                        freelancername.text = suggestionProvider
                                            .matchedItems[index];
                                        suggestionProvider.matchedItems.clear();
                                        suggestionProvider.notifyListeners();
                                      },
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Coordinator Name : ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  "* ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            // const Spacer(),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: 180,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  key: _coordinatorkey,
                                  focusNode: _cooFocusNode,
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
                                    hintText: "Enter Name",
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
                                          .matchedItems;
                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .coobuild = false;
                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .notifyListeners();
                                    } else {
                                      List<String> coordinatorlocal =
                                          Provider.of<Suggestionprovider>(
                                                  context,
                                                  listen: false)
                                              .coordinatorlist;

                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .coobuild = true;

                                      Provider.of<Suggestionprovider>(context,
                                              listen: false)
                                          .autoComplete(coordinatorlocal, value,
                                              "checkcoo");
                                    }
                                    _coordinatorkey.currentState!.validate();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            if (suggestionProvider.coobuild) {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount:
                                    suggestionProvider.matchedItems.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 0),
                                itemBuilder: (context, index) {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.blueAccent,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ]),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      title: Text(suggestionProvider
                                          .matchedItems[index]),
                                      onTap: () {
                                        coordinatorname.text =
                                            suggestionProvider
                                                .matchedItems[index];
                                        suggestionProvider.matchedItems.clear();
                                        suggestionProvider.notifyListeners();
                                      },
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Sponsor Name : ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            keyboardType: TextInputType.text,
                            key: _sponsorkey,
                            focusNode: _sponsorFocusNode,
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
                              hintText: "Enter Name",
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
                                    .matchedItems;
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .sponsorbuild = false;
                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .notifyListeners();
                              } else {
                                List<String> sponsorlocal =
                                    Provider.of<Suggestionprovider>(context,
                                            listen: false)
                                        .sponsorlist;

                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .sponsorbuild = true;

                                Provider.of<Suggestionprovider>(context,
                                        listen: false)
                                    .autoComplete(
                                        sponsorlocal, value, "sponsor");
                              }
                              _sponsorkey.currentState!.validate();
                            },
                          ),
                        ),
                        Consumer<Suggestionprovider>(
                          builder: (BuildContext context, suggestionProvider,
                              Widget? child) {
                            if (suggestionProvider.sponsorbuild) {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount:
                                    suggestionProvider.matchedItems.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 0),
                                itemBuilder: (context, index) {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.blueAccent,
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ]),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      title: Text(suggestionProvider
                                          .matchedItems[index]),
                                      onTap: () {
                                        sponsorcompany.text = suggestionProvider
                                            .matchedItems[index];
                                        suggestionProvider.matchedItems.clear();
                                        suggestionProvider.notifyListeners();
                                      },
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Entry (N or RE) : ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  "* ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: 180,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: DropdownButtonFormField(
                                  key: _norekey,
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
                                    hintText: "N / RE",
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
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: "R",
                                      child: Text(
                                        "R",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    neworrepeat.text = value!;
                                    _norekey.currentState!.validate();
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return "Select NE or R";
                                    }
                                    return null;
                                  },
                                  selectedItemBuilder: (BuildContext context) {
                                    return ['NE', 'R'].map((String value) {
                                      return Text(
                                        value,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.yellow,
                                        ),
                                      );
                                    }).toList();
                                  },
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
                            Text(
                              "Level Of Education : ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            key: _level,
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
                              hintText: " Level I / II",
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
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "II",
                                child: Text(
                                  "II",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              levelno.text = value!;
                              _level.currentState!.validate();
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Select I or II";
                              }
                              return null;
                            },
                            selectedItemBuilder: (BuildContext context) {
                              return ['I', 'II'].map((String value) {
                                return Text(
                                  value,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow,
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "SSF Program : ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            key: _ssfkey,
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
                              hintText: " Enter Program Name",
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
                              _ssfkey.currentState!.validate();
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
                          width: MediaQuery.of(context).size.width,
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
                              hintText: "Enter Special Achievement",
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
                          width: MediaQuery.of(context).size.width,
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
                              hintText: " Enter Details",
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.yellow),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Date of Girl leaving KVP after completion of all three levels :",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                              WidgetSpan(
                                child: Text(
                                  "*",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                            key: _dolkey,
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
                              hintText: "Leaving Date",
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
                                  _dolkey.currentState!.validate();
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

                /*

                Used checkbox for girl's participtation on different activities which is arranged by sevasahyog....
                following container are used for design the all activities

                */

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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Program Of KVP Where Girl Has Participated ",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "*",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            "note : If a girl has not participated in any program, please leave the checkbox empty.",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child:
                                const CheckboxWithControllers()), // this widget written in checkbox.dart file
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /*

                Following container written the personal details of girl's

                */

                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10),
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
                        Row(
                          children: [
                            Text(
                              "Birth Date Of Girl : ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            key: _dobkey,
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
                              hintText: "DOB",
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
                                  _dobkey.currentState!.validate();
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "Aadhar Number  :",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  "* ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  key: _aadharkey,
                                  cursorColor: Colors.white,
                                  textAlign: TextAlign.start,
                                  controller: aadharnumber,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    hintText: "Enter Number",
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
                                    } else if (int.tryParse(value.trim()) ==
                                            null ||
                                        value.trim().length != 12) {
                                      return "Enter 12 Digit Aadhar Num";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _aadharkey.currentState!.validate();
                                  },
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
                            Text(
                              "School Name : ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            keyboardType: TextInputType.text,
                            key: _schoolnamekey,
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
                              hintText: "School Name",
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
                              _schoolnamekey.currentState!.validate();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "School Timing : ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  "* ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  key: _schooltimekey,
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
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, top: 13),
                                    hintText: "Enter time",
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
                                    // this function written the select time widget....

                                    _showTimeRangePicker(context);
                                  },
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Enter Valid School Time";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _schooltimekey.currentState!.validate();
                                  },
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
                            Text(
                              "Standard In School : ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            keyboardType: TextInputType.number,
                            key: _stdkey,
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
                              hintText: "Std",
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
                              _stdkey.currentState!.validate();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Family Member : ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  "* ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  key: _nooffamilykey,
                                  cursorColor: Colors.white,
                                  textAlign: TextAlign.start,
                                  controller: nooffamilymembers,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    hintText: "Enter Number",
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
                                    } else if (int.tryParse(value.trim()) ==
                                            null ||
                                        value.trim().length > 12) {
                                      return "Enter Correct Family No(Digit)";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _nooffamilykey.currentState!.validate();
                                  },
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
                            Text(
                              "Number of Girls in Family : ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            keyboardType: TextInputType.number,
                            key: _totalnogirlkey,
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
                              hintText: "Enter Number",
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
                              _totalnogirlkey.currentState!.validate();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Mother Contact : ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  "* ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  key: _mothercontactkey,
                                  cursorColor: Colors.white,
                                  textAlign: TextAlign.start,
                                  controller: mothercontact,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    hintText: "Enter Contact Number",
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
                                    } else if (int.tryParse(value.trim()) ==
                                            null ||
                                        value.trim().length != 10) {
                                      return "Enter Mother 10 Digit Mobile Num";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _mothercontactkey.currentState!.validate();
                                  },
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
                            Text(
                              "Father Contact : ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            keyboardType: TextInputType.phone,
                            key: _fathercontacrkey,
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
                              hintText: "Enter Contact Number",
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
                              _fathercontacrkey.currentState!.validate();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "All Girls Registerd : ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  "* ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: DropdownButtonFormField(
                                  key: _allgirlregisterkey,
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
                                    hintText: "Y/N",
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
                                            color: Colors.black),
                                      ),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: "No",
                                      child: Text(
                                        "No",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    allgirlsregistred.text = value!;
                                    _allgirlregisterkey.currentState!
                                        .validate();
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return "Seletct Yes or No";
                                    }
                                    return null;
                                  },
                                  selectedItemBuilder: (BuildContext context) {
                                    return ['Yes', 'No'].map((String value) {
                                      return Text(
                                        value,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.yellow,
                                        ),
                                      );
                                    }).toList();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                /*
                Following Container contain the Parent Participitation Data...
                */
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10),
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
                        Row(
                          children: [
                            Text(
                              "Parent Meet 1 : ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            key: _parentmeet1key,
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
                              hintText: "Y/N",
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
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "No",
                                child: Text(
                                  "No",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              parentmeet1.text = value!;
                              _parentmeet1key.currentState!.validate();
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Seletct Yes or No";
                              }
                              return null;
                            },
                            selectedItemBuilder: (BuildContext context) {
                              return ['Yes', 'No'].map((String value) {
                                return Text(
                                  value,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow,
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Parent Meet 2 : ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  "* ",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: DropdownButtonFormField(
                                  key: _parentmeet2key,
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
                                    hintText: "Y/N",
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
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: "No",
                                      child: Text(
                                        "No",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    parentmeet2.text = value!;
                                    _parentmeet2key.currentState!.validate();
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return "Seletct Yes or No";
                                    }
                                    return null;
                                  },
                                  selectedItemBuilder: (BuildContext context) {
                                    return ['Yes', 'No'].map((String value) {
                                      return Text(
                                        value,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.yellow,
                                        ),
                                      );
                                    }).toList();
                                  },
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
                            Text(
                              "Parent Meet 3 : ",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            Text(
                              "*",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                            key: _parentmeet3key,
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
                              hintText: "Y/N",
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
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "No",
                                child: Text(
                                  "No",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              parentmeet3.text = value!;
                              _parentmeet3key.currentState!.validate();
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Seletct Yes or No";
                              }
                              return null;
                            },
                            selectedItemBuilder: (BuildContext context) {
                              return ['Yes', 'No'].map((String value) {
                                return Text(
                                  value,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Colors.yellow,
                                  ),
                                );
                              }).toList();
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
                GestureDetector(
                  onTap: () async {
                    final keys = [
                      _nameKey,
                      _conatctkey,
                      _vmkey,
                      _vastikey,
                      _vibhagkey,
                      _trainerkey,
                      _freelancerkey,
                      _coordinatorkey,
                      _sponsorkey,
                      _norekey,
                      _level,
                      _ssfkey,
                      _dobkey,
                      _dolkey,
                      _aadharkey,
                      _schoolnamekey,
                      _schooltimekey,
                      _stdkey,
                      _nooffamilykey,
                      _totalnogirlkey,
                      _mothercontactkey,
                      _fathercontacrkey,
                      _allgirlregisterkey,
                      _parentmeet1key,
                      _parentmeet2key,
                      _parentmeet3key
                    ];
                    bool isValid = true;
                    for (final key in keys) {
                      if (key.currentState!.validate() == false) {
                        isValid = false;
                      }
                    }

                    if (isValid) {
                      storeDataToFirebase();
                      submitMessage(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please Complete All Text Fields"),
                        ),
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

  /*
  This Function is used clear the all textfield...
  */

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

  /*
  following storeDataToFirebase Function Add The User Data To FireStore....
  */

  void storeDataToFirebase() {
    log("in storedatatofirebase");
    Map<String, dynamic> activity =
        Provider.of<CheckboxProvider>(context, listen: false).checkboxState;
    List<Map<String, dynamic>> data = [
      {
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
      },
    ];

    for (var data1 in data) {
      FirebaseFirestore.instance
          .collection("girldetails")
          .add(data1)
          .then((value) {
        Provider.of<Suggestionprovider>(context, listen: false)
            .saveSuggestion(vastiname.text, "vasti");
        Provider.of<Suggestionprovider>(context, listen: false)
            .saveSuggestion(vibhagname.text, "vibhag");

        Provider.of<Suggestionprovider>(context, listen: false)
            .saveSuggestion(trainername.text, "trainer");

        Provider.of<Suggestionprovider>(context, listen: false)
            .saveSuggestion(freelancername.text, "freelancer");

        Provider.of<Suggestionprovider>(context, listen: false)
            .saveSuggestion(coordinatorname.text, "coordinator");

        Provider.of<Suggestionprovider>(context, listen: false)
            .saveSuggestion(vmname.text, "vm");

        Provider.of<Suggestionprovider>(context, listen: false)
            .saveSuggestion(sponsorcompany.text, "sponsor");

        Provider.of<Suggestionprovider>(context, listen: false)
            .loadSuggestion();

        log("Data submitted successfully");
      }).catchError((error) {
        log("Failed to add data: $error");
      });
    }
  }

  // submitMessage function written the alert dialog when we click the submit button....

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
                controllerClear();
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

  void _showTimeRangePicker(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Time Range'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    'From',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: Consumer<TimeProvider>(
                    builder: (context, timeProvider, child) {
                      return Text(
                        timeProvider.startTime.format(context),
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      );
                    },
                  ),
                  onTap: () => _selectTime(context, true),
                ),
                ListTile(
                  title: Text(
                    'To',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: Consumer<TimeProvider>(
                    builder: (context, timeProvider, child) {
                      return Text(
                        timeProvider.endTime.format(context),
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      );
                    },
                  ),
                  onTap: () => _selectTime(context, false),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: GoogleFonts.poppins(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeProvider timeProvider =
        Provider.of<TimeProvider>(context, listen: false);
    /*
        Here we used the showTimePicker function
        */
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? timeProvider.startTime : timeProvider.endTime,
    );

    if (pickedTime != null) {
      if (isStartTime) {
        timeProvider.setStartTime(pickedTime);
      } else {
        timeProvider.setEndTime(pickedTime);
      }
    }
    String start = timeProvider.getStartTime().format(context);
    String end = timeProvider.getEndTime().format(context);
    schooltiming.text = "$start to $end";
    _schooltimekey.currentState!.validate();
    setState(() {});
  }
}
