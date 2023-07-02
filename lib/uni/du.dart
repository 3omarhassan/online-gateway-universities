import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class DUPage extends StatefulWidget {
  const DUPage({Key? key}) : super(key: key);

  @override
  _DUPageState createState() => _DUPageState();
}

class _DUPageState extends State<DUPage> {
  List<String> titles = [];
  List<String> fees = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://new.deltauniv.edu.eg/EN/fees/index'));

    if (response.statusCode == 200) {
      final document = html.parse(response.body);

      final titleElements = document.querySelectorAll('.tit');
      titles = titleElements.map((element) => element.text).toList();

      final feeElements = document.querySelectorAll('.fees');
      fees = feeElements.map((element) => element.text).toList();

      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> _launchDUWebsite() async {
    const url = 'https://new.deltauniv.edu.eg/en/home/index';
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
        title: Text('DU'),
        actions: [
          IconButton(
            icon: Icon(Icons.link),
            onPressed: _launchDUWebsite,
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                final title = titles[index];
                final fee = fees[index];

                return ListTile(
                  title: Text(title),
                  subtitle: Text(fee),
                );
              },
            ),
    );
  }
}
