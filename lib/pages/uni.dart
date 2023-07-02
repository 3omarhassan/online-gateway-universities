import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myproject/pages/details.dart';
import 'package:myproject/uni/msa.dart';
import 'package:myproject/uni/nu.dart';
import 'package:myproject/uni/miu.dart';
import 'package:myproject/uni/must.dart';
import 'package:myproject/uni/acu.dart';
import 'package:myproject/uni/buc.dart';
import 'package:myproject/uni/bue.dart';
import 'package:myproject/uni/du.dart';
import 'package:myproject/uni/mti.dart';
import 'package:myproject/uni/o6u.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../model/item.dart';

class Uni extends StatefulWidget {
  Uni({super.key});

  @override
  State<Uni> createState() => _UniState();
}

class _UniState extends State<Uni> {
  bool isSearching = false;
  final user = FirebaseAuth.instance.currentUser!;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text("my university");
  List filteredItems = items;

  void _onSearchTextChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = items;
      } else {
        filteredItems = items
            .where((item) =>
                item.uniname!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 22),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 30),
              itemCount: filteredItems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, filteredItems[index].path);
                  },
                  child: GridTile(
                    child: Stack(children: [
                      Positioned(
                        right: 0,
                        left: 0,
                        top: -3,
                        bottom: -3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(55),
                          child: Image.asset(filteredItems[index].imgpath),
                        ),
                      ),
                    ]),
                  ),
                );
              }),
        ),
        drawer: Drawer(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    UserAccountsDrawerHeader(
                        accountName: Text("   "),
                        accountEmail: Text(
                          user.email!,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )),
                    ListTile(
                      title: Text(
                        "University",
                      ),
                      leading: Icon(Icons.account_balance),
                      onTap: () {
                        Navigator.pushNamed(context, "/uni");
                      },
                    ),
                    ListTile(
                      title: Text("College"),
                      leading: Icon(Icons.school),
                      onTap: () {
                        Navigator.pushNamed(context, "/college");
                      },
                    ),
                    ListTile(
                      title: Text("Settings"),
                      leading: Icon(Icons.settings),
                      onTap: () {
                        Navigator.pushNamed(context, "/test");
                      },
                    ),
                    ListTile(
                      title: Text("Info"),
                      leading: Icon(Icons.info),
                      onTap: () {
                        Navigator.pushNamed(context, "/info");
                      },
                    ),
                    ListTile(
                      title: Text("Logout"),
                      leading: Icon(Icons.login),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Developed By Omar Hassan ",
                    style: TextStyle(fontFamily: "myfont", fontSize: 16),
                  ),
                )
              ]),
        ),
        appBar: AppBar(
          actions: [
            isSearching
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60.0,
                        vertical: 10,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for a University',
                          border: InputBorder.none,
                        ),
                        onChanged: _onSearchTextChanged,
                      ),
                    ),
                  )
                : IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                  ),
          ],
          title: Text(
            "Universities",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
