import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

class FUE extends StatefulWidget {
  const FUE({Key? key}) : super(key: key);

  @override
  _FUEState createState() => _FUEState();
}

class _FUEState extends State<FUE> {
  String _tuitionFees = "";
  String _otherFees = "";

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://www.fue.edu.eg/admissions/undergraduate_applicants/tuition_fees"));
      final document = parser.parse(response.body);

      final tuitionFeesElements = document.querySelectorAll(
          ".center-table+ .center-table tr~ tr+ tr > td:nth-child(1)");
      final tuitionFees = tuitionFeesElements.map((e) => e.text).join("\n\n");
      setState(() {
        _tuitionFees = tuitionFees;
      });

      final otherFeesElements = document.querySelectorAll("td td:nth-child(1)");
      final otherFees = otherFeesElements.map((e) => e.text).join("\n\n");
      setState(() {
        _otherFees = otherFees;
      });
    } catch (e) {
      debugPrint("Failed to fetch data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            launch("https://fue.edu.eg/");
          },
          child: Text(
            "FUE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tuition Fees:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(_tuitionFees),
              SizedBox(height: 16.0),
              Text(
                "Other Fees:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(_otherFees),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  launch("https://fue.edu.eg/");
                },
                child: Text(
                  "Visit FUE Website",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
