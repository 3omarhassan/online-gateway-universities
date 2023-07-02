import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class BUCPage extends StatefulWidget {
  const BUCPage({Key? key}) : super(key: key);

  @override
  _BUCPageState createState() => _BUCPageState();
}

class _BUCPageState extends State<BUCPage> {
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
        'https://www.egyptianeducation.com/badr-university-cairo/programs'));

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

  Future<void> _launchBUCWebsite() async {
    const url = 'https://buc.edu.eg/';
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
        title: Text('BUC'),
        actions: [
          IconButton(
            icon: Icon(Icons.link),
            onPressed: _launchBUCWebsite,
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
