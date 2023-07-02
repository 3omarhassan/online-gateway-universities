import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

class Miu extends StatefulWidget {
  const Miu({Key? key}) : super(key: key);

  @override
  _MiuState createState() => _MiuState();
}

class _MiuState extends State<Miu> {
  List<List<String>> _data = [];

  @override
  void initState() {
    super.initState();
    _scrapeData();
  }

  Future<void> _scrapeData() async {
    final response = await http.get(Uri.parse('https://theigclub.com/miu/'));
    final document = parser.parse(response.body);
    final postContIn = document.querySelector('.post-cont-in');

    if (postContIn != null) {
      final tables = postContIn.querySelectorAll('table');
      final tableData = <List<List<String>>>[];

      for (final table in tables) {
        final rows = table.querySelectorAll('tr');
        final rowData = <List<String>>[];

        for (final row in rows) {
          final cells = row.querySelectorAll('td');
          final cellData = cells.map((cell) => cell.text.trim()).toList();
          rowData.add(cellData);
        }

        tableData.add(rowData);
      }

      _data = tableData[0];
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MIU'),
        actions: [
          IconButton(
            icon: const Icon(Icons.link),
            onPressed: () async {
              const url = 'https://www.miuegypt.edu.eg/';
              if (!await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        ],
      ),
      body: _data.isNotEmpty
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: _data[0]
                    .map((cell) => DataColumn(label: Text(cell)))
                    .toList(),
                rows: _data
                    .skip(1)
                    .map((row) => DataRow(
                        cells:
                            row.map((cell) => DataCell(Text(cell))).toList()))
                    .toList(),
              ),
            )
          : const Center(child: Text('Welcome to MIU!')),
    );
  }
}
