import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:kvp/provider/girlidprovider.dart';
import 'package:kvp/screen/assesmendata.dart';
import '../provider/assesmentrecordprovider.dart';
import '../provider/searchprovider.dart';
// Import your SearchProvider

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key});

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  TextEditingController searchController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
    searchController.addListener(_onSearchChanged);
  }

  Future<void> fetchAllDataFromFirebase() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("girldetails").get();

    List<Map<String, dynamic>> collectiondata = [];

    for (QueryDocumentSnapshot document in snapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      data['id'] = document.id;
      collectiondata.add(data);
    }

    // Pass the data to SearchProvider
    Provider.of<SearchProvider>(context, listen: false)
        .setCollectionData(collectiondata);

    setState(() {
      _isLoading = false;
    });
  }

  void _onSearchChanged() {
    Provider.of<SearchProvider>(context, listen: false)
        .filterData(searchController.text);
  }

  Future<void> _fetchData() async {
    await fetchAllDataFromFirebase();
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        forceMaterialTransparency: true,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
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
        child: Column(
          children: [
            const SizedBox(height: 5),
            Text(
              textAlign: TextAlign.center,
              "Note: Please tap on the girl's name to update the assessment record.",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            // Search Field
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.blueAccent.withOpacity(0.4),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search by girl\'s name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Consumer<SearchProvider>(
                      builder: (context, searchProvider, child) {
                        if (searchProvider.filteredData.isEmpty) {
                          return Center(
                              child: Text(
                            'No matches found',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ));
                        }
                        return ListView.builder(
                          itemCount: searchProvider.filteredData.length,
                          itemBuilder: (context, index) {
                            String girlName = searchProvider.filteredData[index]
                                ['name of girl'];
                            String girlId =
                                searchProvider.filteredData[index]['id'];

                            Provider.of<AssesmentRecordProvider>(context,
                                    listen: false)
                                .checkAssessmentRecord(girlId);

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
                                      color:
                                          Colors.blueAccent.withOpacity(0.15),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: Colors.blueAccent.withOpacity(0.2),
                                    width: 1,
                                  ),
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        Colors.blue.withOpacity(0.8),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 11,
                                            backgroundColor:
                                                isadd.isAssessmentAdded[
                                                            girlId] ==
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
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
