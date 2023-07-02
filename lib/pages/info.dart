import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

bool showmore = true;

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(33),
                child: Text(
                  "Welcome to Online Gateway University",
                  style: TextStyle(fontSize: 33, fontFamily: "myfont"),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '''This application aims to help students to get a fully report about available universities in Egypt on their phones by simple clicks ,this application searching in our data base to compare user requirements to our result.\nThis application also provides most important details about each university and collage .\n
                  ''',
                  style: TextStyle(fontSize: 19),
                  maxLines: showmore ? 3 : null,
                  overflow: TextOverflow.fade,
                ),
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
          appBar: AppBar(
            actions: [
              IconButton(
                  icon: const Icon(Icons.info),
                  onPressed: (() {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("About"),
                              content: Text(
                                  'for help and  support call us...\n 01144552378'),
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
              "About ",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
