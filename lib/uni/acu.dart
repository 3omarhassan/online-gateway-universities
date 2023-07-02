import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class ACUPage extends StatefulWidget {
  const ACUPage({Key? key}) : super(key: key);

  @override
  _ACUPageState createState() => _ACUPageState();
}

class _ACUPageState extends State<ACUPage> {
  List<String> programNames = [];
  List<String> newsDates = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://www.universitiesegypt.com/ahram-canadian-university/programs'));

    if (response.statusCode == 200) {
      final document = html.parse(response.body);

      final programNameElements =
          document.querySelectorAll('.innerListOfUniversities div h2');
      programNames =
          programNameElements.map((element) => element.text).toList();

      final newsDateElements = document.querySelectorAll('.newsListDate span');
      newsDates = newsDateElements.map((element) => element.text).toList();

      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> _launchACUWebsite() async {
    const url = 'https://acu.edu.eg/';
    if (!await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ACU'),
        actions: [
          IconButton(
            icon: Icon(Icons.link),
            onPressed: _launchACUWebsite,
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: programNames.length,
              itemBuilder: (context, index) {
                final programName = programNames[index];
                final newsDate = newsDates[index];

                return ListTile(
                  title: Text(programName),
                  subtitle: Text(newsDate),
                );
              },
            ),
    );
  }
}
