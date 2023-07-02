import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myproject/college/asnan.dart';
import 'package:myproject/college/it.dart';
import 'package:myproject/college/saidala.dart';
import 'package:myproject/model/item.dart';
import 'package:myproject/pages/Welcome.dart';
import 'package:myproject/pages/Login.dart';
import 'package:myproject/pages/Signup.dart';
import 'package:myproject/pages/college.dart';
import 'package:myproject/uni/FU.dart';
import 'package:myproject/uni/ecu.dart';
import 'package:myproject/uni/guc.dart';
import 'package:myproject/uni/nu.dart';
import 'package:myproject/uni/must.dart';
import 'package:myproject/pages/test.dart';
import 'package:myproject/pages/uni.dart';
import 'package:myproject/pages/info.dart';
import 'package:myproject/pages/college.dart';
import 'package:myproject/pages/details.dart';
import 'package:myproject/uni/must.dart';
import 'package:myproject/uni/miu.dart';
import 'package:myproject/pages/ttt.dart';
import 'package:myproject/uni/msa.dart';
import 'package:myproject/uni/acu.dart';
import 'package:myproject/uni/buc.dart';
import 'package:myproject/uni/bue.dart';
import 'package:myproject/uni/du.dart';
import 'package:myproject/uni/mti.dart';
import 'package:myproject/uni/o6u.dart';
import 'package:myproject/uni/pua.dart';
import 'package:myproject/uni/eru.dart';

import 'package:myproject/college/it.dart';
import 'package:myproject/college/saidala.dart';
import 'package:myproject/college/olom.dart';
import 'package:myproject/college/business.dart';
import 'package:myproject/college/bio.dart';
import 'package:myproject/college/medicine.dart';
import 'package:myproject/college/loghat.dart';
import 'package:myproject/college/hndasa.dart';
import 'package:myproject/college/asnan.dart';
import 'package:myproject/college/pt.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'auth.dart';
import 'theme.dart';
import 'package:html/parser.dart' as parser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDark = prefs.getBool("isDark") ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDark ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Welcome(),
        "/login": (context) => Login(),
        "/Signup": (context) => Signup(),
        "/uni": (context) => Uni(),
        "/info": (context) => Info(),
        "/college": (context) => College(),
        // ignore: prefer_const_constructors
        "/must": (context) => MyHomePage(),
        "/auth": (context) => Auth(),
        "/test": (context) => SettingsPage(),
        "/ttt": (context) => MyApp(),
        "/msa": (context) => MSAPage(),
        "/nu": (context) => NUPage(),
        "/miu": (context) => Miu(),
        "/acu": (context) => ACUPage(),
        "/buc": (context) => BUCPage(),
        "/bue": (context) => BUEPage(),
        "/du": (context) => DUPage(),
        "/mti": (context) => MTIPage(),
        "/eru": (context) => ERU(),

        "/o6u": (context) => O6UPage(),
        "/pua": (context) => PUAPage(),
        "/it": (context) => ITPage(),
        "/saidala": (context) => PharmacyPage(),
        "/olom": (context) => SciencePage(),
        "/business": (context) => BusinessPage(),
        "/bio": (context) => BioPage(),
        "/medicine": (context) => MedicinePage(),
        "/loghat": (context) => AlsonPage(),
        "/hndasa": (context) => EngineeringPage(),
        "/asnan": (context) => DentistPage(),
        "/ecu": (context) => EcuPage(),
        // "/FU": (context) => FUE(),
        "/guc": (context) => GUC(),

        "/pt": (context) => PhysiotherapyPage(),

        // "/details": (context) => Details(item: items2, det: null,),
      },
    );
  }
}
