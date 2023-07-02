import 'package:flutter/material.dart';

class AlsonPage extends StatelessWidget {
  final List<Map<String, dynamic>> _universities = [
    {
      'name': 'Misr University for Science and Technology (MUST)',
      'location': '6th of October City',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': 'MSA University',
      'location': '6th of October City',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': 'Nile University (NU)',
      'location': 'Sheikh Zayed City',
      'minGrade': 60,
      'credits': 138,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': '6th of October University (O6U)',
      'location': '6th of October City',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': 'The British University in Egypt (BUE)',
      'location': 'El Sherouk City',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': 'Delta University for Science and Technology',
      'location': 'Mansoura',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': 'The American University in Cairo (AUC)',
      'location': 'Tahrir Square',
      'minGrade': 60,
      'credits': 128,
      'majors': [
        'Translation and Interpreting',
        'English and Comparative Literature',
        'Arabic Language and Literature',
        'French and Francophone Studies',
        'German Studies',
        'Italian Studies',
        'Spanish and Latin American Studies',
        'Chinese Studies',
        'Japanese Studies',
      ],
    },
    {
      'name': 'Assiut University',
      'location': 'Assiut',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': 'Badr University in Cairo (BUC)',
      'location': 'Cairo',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': 'German University in Cairo (GUC)',
      'location': 'New Cairo',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': 'Modern University for Technology and Information (MTI)',
      'location': 'Cairo',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': 'Pharos University in Alexandria (PUA)',
      'location': 'Alexandria',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': 'Mustaqbal University',
      'location': 'New Cairo',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
    {
      'name': 'Misr International University (MIU)',
      'location': 'Cairo',
      'minGrade': 60,
      'credits': 132,
      'majors': [
        'Translation and Interpreting',
        'English Language and Literature',
        'French Language and Literature',
        'German Language and Literature',
        'Italian Language and Literature',
        'Spanish Language and Literature',
        'Chinese Language and Literature',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Language and Translation Faculty in Egyptian Universities'),
      ),
      body: ListView.builder(
        itemCount: _universities.length,
        itemBuilder: (context, index) {
          final university = _universities[index];

          return Card(
            child: ListTile(
              title: Text(university['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Location: ${university['location']}'),
                  Text('Minimum Grade: ${university['minGrade']}'),
                  Text('Credit Hours: ${university['credits']}'),
                  Text('Majors:'),
                  ...university['majors']
                      .map((major) => Text('- $major'))
                      .toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
