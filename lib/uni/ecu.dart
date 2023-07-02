import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class EcuPage extends StatefulWidget {
  @override
  _EcuPageState createState() => _EcuPageState();
}

class _EcuPageState extends State<EcuPage> {
  List<String> _fees = [];
  List<String> _programs = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    final response =
        await http.get(Uri.parse('https://ecu.edu.eg/?s=fees&lang=en'));
    if (response.statusCode == 200) {
      final document = parse(response.body);
      final elements = document.querySelectorAll('table tr');
      for (final element in elements) {
        final program = element.querySelector('td:nth-child(3)');
        final fee = element.querySelector('td:nth-child(4)');
        if (program != null && fee != null) {
          _programs.add(program.text);
          _fees.add(fee.text);
        }
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ECU'),
      ),
      body: _fees.isNotEmpty && _programs.isNotEmpty
          ? ListView.builder(
              itemCount: _fees.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_programs[index]),
                  subtitle: Text(_fees[index]),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
