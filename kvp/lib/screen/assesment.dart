import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvp/provider/girlidprovider.dart';
import 'package:kvp/screen/assesmendata.dart';
import 'package:provider/provider.dart';

import '../provider/assesmentrecordprovider.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key});

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  List<Map<String, dynamic>> collectiondata = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> fetchAllDataFromFirebase() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("girldetails").get();

    for (QueryDocumentSnapshot document in snapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      data['id'] = document.id;
      collectiondata.add(data);

      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchData() async {
    fetchAllDataFromFirebase();
  }

  @override
  void dispose() {
    collectiondata.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(Icons.arrow_back,
              color: Colors.black), // Custom icon and color
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          "Assessment Record Girl List",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            textAlign: TextAlign.center,
            "Note: Please tap on the girl's name to update the assessment record.",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: collectiondata.length,
                    itemBuilder: (context, index) {
                      String girlName = collectiondata[index]['name of girl'];

                      String girlId = collectiondata[index]['id'];

                      Provider.of<AssesmentRecordProvider>(context,
                              listen: false)
                          .checkAssessmentRecord(girlId);

                      return GestureDetector(
                          onTap: () {
                            /*
                            When We Tap on specific girl then it's ..we store the girlId and girlName in a GirlIdProvider....
                            */
                            Provider.of<GirlIdProvider>(context, listen: false)
                                .storegirlid(girlId);

                            Provider.of<GirlIdProvider>(context, listen: false)
                                .storeGirlName(girlName);
                            /*
                                When we click the specific girl then new page is open which store all assessment data for selected girl......
                                */
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const AssesmentResult();
                            }));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.lightBlueAccent.withOpacity(0.3)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                BoxShadow(
                                  color: Colors.blueAccent.withOpacity(0.15),
                                ),
                              ],
                              border: Border.all(
                                color: Colors.blueAccent.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue.withOpacity(0.8),
                                child: Text(
                                  girlName[0],
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Text(
                                girlName,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              subtitle: Consumer<AssesmentRecordProvider>(
                                builder: (context, isadd, child) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 11,
                                        backgroundColor:
                                            isadd.isAssessmentAdded[girlId] ==
                                                    true
                                                ? Colors.green
                                                : Colors.red,
                                        child: Icon(
                                          isadd.isAssessmentAdded[girlId] ==
                                                  true
                                              ? Icons.check_circle
                                              : Icons.info,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          isadd.isAssessmentAdded[girlId] ==
                                                  true
                                              ? 'Assessment record added'
                                              : 'Assessment record not added',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: isadd.isAssessmentAdded[
                                                        girlId] ==
                                                    true
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 66, 59, 59),
                                  size: 18),
                            ),
                          ));
                    }),
          )
        ]),
      ),
    );
  }
}
