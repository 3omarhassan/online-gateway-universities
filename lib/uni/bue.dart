import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';

class BUEPage extends StatefulWidget {
  @override
  _BUEPageState createState() => _BUEPageState();
}

class _BUEPageState extends State<BUEPage> {
  List<String> titles = [];
  List<String> dates = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(
        'https://www.universitiesegypt.com/british-university-egypt-bue/programs'));

    if (response.statusCode == 200) {
      final document = parser.parse(response.body);
      final elements = document.querySelectorAll('h2');

      for (final element in elements) {
        titles.add(element.text.trim());
        final dateElement = element.nextElementSibling.querySelector('span');
        if (dateElement != null && dateElement.localName == 'span') {
          dates.add(dateElement.text.trim());
        } else {
          dates.add('');
        }
      }

      setState(() {});
    }
  }

  Future<void> _launchBUEWebsite() async {
    const url = 'https://www.bue.edu.eg/';
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
        title: Text('BUE'),
        actions: [
          IconButton(
            icon: Icon(Icons.link),
            onPressed: _launchBUEWebsite,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          final title = titles[index];
          final date = dates[index];
          return ListTile(
            title: Text(title),
            subtitle: date.isNotEmpty ? Text(date) : null,
          );
        },
      ),
    );
  }
}
