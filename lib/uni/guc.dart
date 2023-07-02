import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

class GUC extends StatefulWidget {
  const GUC({Key? key}) : super(key: key);

  @override
  _GUCState createState() => _GUCState();
}

class _GUCState extends State<GUC> {
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
          "https://www.guc.edu.eg/en/admission/undergraduate/tuition_fees/"));
      final document = parser.parse(response.body);

      final tuitionFeesElements = document.querySelectorAll("td p");
      final tuitionFees = tuitionFeesElements.map((e) => e.text).join("\n\n");
      setState(() {
        _tuitionFees = tuitionFees;
      });

      final otherFeesElements =
          document.querySelectorAll("#MainContentPlaceHolder_div div td");
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
            launch("https://guc.edu.eg/");
          },
          child: Text(
            "GUC",
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
            ],
          ),
        ),
      ),
    );
  }
}
