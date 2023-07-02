import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String imgpath;
  String uniname;
  String location;
  String path;

  Item(
      {required this.imgpath,
      this.location = "University",
      this.uniname = "universities",
      this.path = '/'});
}

List items = [
  Item(
      imgpath: "assets/images/Must.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname:
          "must ,6 october city, misr university for science and technology, جامعه مصر للعلوم و التكنولوجيا",
      path: "/must"),
  Item(
      imgpath: "assets/images/NU.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname: "nile university, 6 october city ,nu, جامعه النيل ",
      path: "/nu"),
  Item(
      imgpath: "assets/images/msa.png",
      location: "Wahaat ST.6-october,Cairo,EGY",
      uniname: "msa, modern and sciences and arts university, 6 october city ",
      path: "/msa"),
  Item(
      imgpath: "assets/images/O6u.png",
      location: "hosary,6-october,Cairo,EGY",
      uniname: "o6u  , 6 october university, جامعه 6 اكتوبر",
      path: "/o6u"),
  Item(
      imgpath: "assets/images/guc.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname: "guc , new cairo,german university in cairo, الجامعه الالمانيه",
      path: "/guc"),
  Item(
      imgpath: "assets/images/BUE.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname: "bue ,el sherouk city, british university in egypt, الجامعه البريطانيه",
      path: "/bue"),
  Item(
      imgpath: "assets/images/DU.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname: "delta university, dakahlia, du, جامعه الدلتا",
      path: "/du"),
  Item(
      imgpath: "assets/images/ACU.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname: "acu, ahram canadian university, 6 october city, جامعه الاهرام الكنديه",
      path: "/acu"),
  Item(
      imgpath: "assets/images/BUC.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname: "buc , badr university, badr city , جامعه بدر",
      path: "/buc"),
  Item(
      imgpath: "assets/images/MTI.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname:
          "mti , modern university , الجامعه الحديثه للتكنولوجيا و المعلومات",
      path: "/mti"),
  Item(
      imgpath: "assets/images/PUA.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname: "pua , pharos university, alexandria, جامعه فاروس",
      path: "/pua"),
  Item(
      imgpath: "assets/images/eru.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname: "egyptian russian university, badr city , eru , الجامعه المصريه الروسيه",
      path: "/eru"),
  Item(
      imgpath: "assets/images/MIU.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname: "miu, misr international university, el mokatam , جامعه مصر الدوليه",
      path: "/miu"),
  Item(
      imgpath: "assets/images/ecu.png",
      location: "zaid,6-october,Cairo,EGY",
      uniname: "egyptian chinese university , new cairo,  ecu, الجامعه المصريه الصينيه",
      path: "/ecu"),
];

class Item2 {
  String imgpath;
  String colname;
  String path;
  Item2({required this.imgpath, required this.colname, required this.path});
}

List items2 = [
  Item2(
      imgpath: "assets/images/teb.png",
      colname: "medicine , كليه الطب  , طب بشري",
      path: "/medicine"),
  Item2(
      imgpath: "assets/images/saidala.png",
      colname: "pharmacy , كليه صيدله , الصيدله",
      path: "/saidala"),
  Item2(
      imgpath: "assets/images/pt.png",
      colname: "Physiotherapy , physical therapy , كليه علاج طبيعي",
      path: "/pt"),
  Item2(
      imgpath: "assets/images/olom.png",
      colname: "science , علوم , كليه العلوم",
      path: "/olom"),
  Item2(
      imgpath: "assets/images/bio.png",
      colname: "bio technology, كليه التكنولوجيا الحيويه",
      path: "/bio"),
  Item2(
      imgpath: "assets/images/asnan.png",
      colname: "dentisty , dentist , اسنان , كليه الاسنان",
      path: "/asnan"),
  Item2(
      imgpath: "assets/images/IT.png",
      colname:
          "information technology , computer scince, حاسبات و معلومات , ذكاء اصطناعي , تكنولوجيا المعلومات ",
      path: "/it"),
  Item2(
      imgpath: "assets/images/hndasa.png",
      colname: "engineering , هندسه , كليه الهندسه",
      path: "/hndasa"),
  Item2(
      imgpath: "assets/images/buesness.png",
      colname: "buissness  , كليه التجاره , تجاره",
      path: "/business"),
  Item2(
      imgpath: "assets/images/loghat.png",
      colname: "language , translation, alson, لغات و ترجمه كليه",
      path: "/loghat"),
];
