import 'package:flutter/material.dart';

class PhysiotherapyPage extends StatelessWidget {
  final List<Map<String, dynamic>> physiotherapyFaculties = [
    {
      'university': 'Misr University for Science and Technology (MUST)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'October 6 University (O6U)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'The British University in Egypt (BUE)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'Delta University for Science and Technology',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'The German University in Cairo (GUC)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'Modern University for Technology and Information (MTI)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'Pharos University in Alexandria (PUA)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'The American University in Cairo (AUC)',
      'name': 'Department of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '132',
      'majors': ['Physical Therapy']
    },
    {
      'university': 'Assiut University (ACU)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'Beni-Suef University (BUC)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'Misr International University (MIU)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'Nile University (NU)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'October University for Modern Sciences and Arts (MSA)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
    {
      'university': 'Future University in Egypt (FUE)',
      'name': 'Faculty of Physical Therapy',
      'minimumGrade': '78%',
      'creditHours': '160',
      'majors': ['Physical Therapy', 'Occupational Therapy']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physiotherapy Faculties'),
      ),
      body: ListView.builder(
        itemCount: physiotherapyFaculties.length,
        itemBuilder: (BuildContext context, int index) {
          final faculty = physiotherapyFaculties[index];
          return Card(
            child: ListTile(
              title: Text('${faculty['university']} - ${faculty['name']}'),
              subtitle: Text(
                  'Minimum Grade: ${faculty['minimumGrade']}\nCredit Hours: ${faculty['creditHours']}\nMajors: ${faculty['majors'].join(', ')}'),
            ),
          );
        },
      ),
    );
  }
}
