import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myproject/model/item.dart';

class Details extends StatefulWidget {
  Item det;

  Details({required this.det});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool showmore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Image.asset(widget.det.imgpath),
            ),
            SizedBox(
              height: 11,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Details: ",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              widget.det.location,
              style: TextStyle(fontSize: 19),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    showmore = !showmore;
                  });
                },
                child: Text(
                  showmore ? "Show more" : "Show less",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: (() {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Debug...."),
                          content: Text('sorry ...we are working in it :)'),
                          actions: [
                            TextButton(
                              child: Text('Agree'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ));
              })),
        ],
        // ignore: prefer_const_constructors
        title: Text(
          "Details",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
