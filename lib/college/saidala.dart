import 'package:flutter/material.dart';

class PharmacyPage extends StatelessWidget {
  final List<Map<String, dynamic>> _universities = [
    {
      'name': 'Misr University for Science and Technology (MUST)',
      'location': '6th of October City',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'MSA University',
      'location': '6th of October City',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'The British University in Egypt (BUE)',
      'location': 'El Sherouk City',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'Nile University (NU)',
      'location': 'Sheikh Zayed City',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': '6th of October University (O6U)',
      'location': '6th of October City',
      'minGrade': 75,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'The American University in Cairo (AUC)',
      'location': 'Tahrir Square',
      'minGrade': 75,
      'credits': 130,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'Delta University for Science and Technology',
      'location': 'Mansoura',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'Assiut University',
      'location': 'Assiut',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'Badr University in Cairo (BUC)',
      'location': 'Cairo',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'German University in Cairo (GUC)',
      'location': 'New Cairo',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'Modern University for Technology and Information (MTI)',
      'location': 'Cairo',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'Pharos University in Alexandria (PUA)',
      'location': 'Alexandria',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'Misr International University (MIU)',
      'location': 'Cairo',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
    {
      'name': 'Mustaqbal University',
      'location': 'New Cairo',
      'minGrade': 70,
      'credits': 180,
      'majors': [
        'Pharmacy',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy College in Universities in Egypt'),
      ),
      body: ListView.builder(
        itemCount: _universities.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _universities[index]['name'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Location: ${_universities[index]['location']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Minimum required grade: ${_universities[index]['minGrade']}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Credits required for graduation: ${_universities[index]['credits']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Majors offered:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _universities[index]['majors'].map<Widget>(
                        (major) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              major,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
