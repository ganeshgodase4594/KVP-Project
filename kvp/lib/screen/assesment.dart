import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvp/provider/girlidprovider.dart';
import 'package:kvp/provider/vastifilterprovider.dart';
import 'package:provider/provider.dart';

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
              fontWeight: FontWeight.w300,
              fontSize: 9,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Consumer<VastiProvider>(
                    builder: (context, value, child) {
                      return ListView.builder(
                          itemCount: value.collectiondata.length,
                          itemBuilder: (context, index) {
                            String girlName =
                                value.collectiondata[index]['name of girl'];

                            String girlId = value.collectiondata[index]['id'];
                            print("girlName is : $girlName");
                            return GestureDetector(
                              onTap: () {
                                Provider.of<GirlIdProvider>(context,
                                        listen: false)
                                    .storegirlid(girlId);

                                Provider.of<GirlIdProvider>(context,
                                        listen: false)
                                    .storeGirlName(girlName);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const AssesmentResult();
                                }));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                padding: const EdgeInsets.all(5),
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
                                child: ListTile(
                                  title: Text(
                                    girlName,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  ),
          )
        ]),
      ),
    );
  }
}
