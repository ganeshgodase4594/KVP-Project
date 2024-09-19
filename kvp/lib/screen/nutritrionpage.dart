import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kvp/provider/vastifilterprovider.dart';
import 'package:provider/provider.dart';

class NutritrionPage extends StatefulWidget {
  const NutritrionPage({super.key});

  @override
  State<NutritrionPage> createState() => _NutritrionPageState();
}

class _NutritrionPageState extends State<NutritrionPage> {
  @override
  void initState() {
    super.initState();
    // Fetch the data when the widget is first created
    Provider.of<VastiProvider>(context, listen: false).fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    final fetchdatapage = Provider.of<VastiProvider>(context, listen: false);
    // Provider.of<VastiProvider>(context, listen: false).fetchAllData();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Nutritrion Distribution ",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Consumer<VastiProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                    itemCount: value.collectiondata.length,
                    itemBuilder: (context, index) {
                      String girlName =
                          value.collectiondata[index]['name of girl'];
                      print("girlName is : $girlName");
                      return ListTile(
                        title: Text(
                          girlName,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.black),
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
