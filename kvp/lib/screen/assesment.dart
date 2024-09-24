import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvp/provider/girlidprovider.dart';
import 'package:kvp/provider/vastifilterprovider.dart';
import 'package:provider/provider.dart';

import '../provider/assesmentrecordprovider.dart';
import 'assesmendata.dart';

class NutritrionPage extends StatefulWidget {
  const NutritrionPage({super.key});

  @override
  State<NutritrionPage> createState() => _NutritrionPageState();
}

class _NutritrionPageState extends State<NutritrionPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await Provider.of<VastiProvider>(context, listen: false).fetchAllData();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<VastiProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Girl List ",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
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
                    itemCount:
                        Provider.of<VastiProvider>(context, listen: false)
                            .collectiondata
                            .length,
                    itemBuilder: (context, index) {
                      String girlName =
                          Provider.of<VastiProvider>(context, listen: false)
                              .collectiondata[index]['name of girl'];

                      String girlId =
                          Provider.of<VastiProvider>(context, listen: false)
                              .collectiondata[index]['id'];

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
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.15),
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
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color: Colors.grey[400], size: 18),
                            ),
                          ));
                    }),
          )
        ]),
      ),
    );
  }
}
