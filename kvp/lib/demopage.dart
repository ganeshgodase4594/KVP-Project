import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemopageState();
}

class _DemopageState extends State<DemoPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
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
              Text(
                "Enter the Vasti Name",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: vastiname,
                decoration: InputDecoration(
                    hintText: "Vasti Name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the Vibhag Name",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: vibhagname,
                decoration: InputDecoration(
                    hintText: "Vibhag Name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
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
              TextField(
                controller: levelno,
                decoration: InputDecoration(
                    hintText: "Level (I or II)",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
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
              TextField(
                controller: neworrepeat,
                decoration: InputDecoration(
                    hintText: "New entry(NE) or Repeat registration(R)",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
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
              ),
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
              ),
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
                    hintText: "freelancer name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
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
                    hintText: "Coordinator Name",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
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
                    hintText: "Sponser Company nane",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the Average yearly attendence of the girl",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: avgyearattendence,
                decoration: InputDecoration(
                    hintText: "Average Yearly Attendance of the girl",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the Average Performance in tests",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: avgpertest,
                decoration: InputDecoration(
                    hintText: "Average performance in tests",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ),
              const SizedBox(
                height: 10,
              ),
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
                    hintText: "Date of girl leaving kvp",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
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
              const SizedBox(
                height: 10,
              ),
              Text(
                "Bhondla",
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
                    bhonda.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Summer Camp",
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
                    summercamp.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Mangalagaur",
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
                    mangalagaur.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Winter Camp",
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
                    wintercamp.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Haladikunku",
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
                    haladikunku.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Exposure Visit",
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
                    exposurevisit.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Company Visit",
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
                    companyvisit.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
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
              Text(
                "Kishori Care Kit",
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
                    kishoricarekit.text = value!;
                  }),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Personal Details of Girls",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w800,
                    fontSize: 15),
              )),
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
                    hintText: "DOB",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
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
                    hintText: "school timing",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
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
                  storeDataToFirebase;
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

  void storeDataToFirebase() {}
}
