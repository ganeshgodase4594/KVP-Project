import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage({super.key});

  @override
  State<FetchDataPage> createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  bool _showData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _showData = !_showData;
                });
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    "Fetch Data",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _showData
                ? buildStreamBuilder()
                : const Center(child: Text("Tap 'Fetch Data' to display data")),
          ),
        ],
      ),
    );
  }

  Widget buildStreamBuilder() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("girldetails").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No data available"));
        } else {
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              return Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data.entries.map<Widget>((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        "${entry.key}: ${entry.value}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
