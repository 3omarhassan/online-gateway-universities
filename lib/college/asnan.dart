import 'package:flutter/material.dart';

class University {
  final String name;
  final List<Major> majors;

  University({required this.name, required this.majors});
}

class Major {
  final String name;
  final int minimumGrade;
  final int creditHours;

  Major(
      {required this.name,
      required this.minimumGrade,
      required this.creditHours});
}

final universities = [
  University(
    name: 'Misr University for Science and Technology',
    majors: [
      Major(name: 'Dentistry', minimumGrade: 80, creditHours: 200),
    ],
  ),
  University(
    name: 'October 6 University',
    majors: [
      Major(name: 'Dentistry', minimumGrade: 80, creditHours: 200),
    ],
  ),
  University(
    name: 'Nile University',
    majors: [
      Major(name: 'Dentistry', minimumGrade: 80, creditHours: 200),
    ],
  ),
  University(
    name: 'Delta University',
    majors: [
      Major(name: 'Dentistry', minimumGrade: 80, creditHours: 200),
    ],
  ),
  University(
    name: 'The American University in Cairo',
    majors: [
      Major(name: 'Dentistry', minimumGrade: 80, creditHours: 200),
    ],
  ),
  University(
    name: 'British University in Egypt',
    majors: [
      Major(name: 'Dentistry', minimumGrade: 80, creditHours: 200),
    ],
  ),
  University(
    name: 'German University in Cairo',
    majors: [
      Major(name: 'Dentistry', minimumGrade: 80, creditHours: 200),
    ],
  ),
  University(
    name: 'Misr Technology University',
    majors: [
      Major(name: 'Dentistry', minimumGrade: 80, creditHours: 200),
    ],
  ),
  University(
    name: 'Pharos University in Alexandria',
    majors: [
      Major(name: 'Dentistry', minimumGrade: 80, creditHours: 200),
    ],
  ),
  University(
    name: 'Modern Sciences and Arts University',
    majors: [
      Major(name: 'Dentistry', minimumGrade: 80, creditHours: 200),
    ],
  ),
  University(
    name: 'Future University',
    majors: [
      Major(name: 'Dentistry', minimumGrade: 80, creditHours: 200),
    ],
  ),
];

class DentistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dentist Faculty'),
      ),
      body: ListView.builder(
        itemCount: universities.length,
        itemBuilder: (context, index) {
          final university = universities[index];
          return ExpansionTile(
            title: Text(university.name),
            children: university.majors.map((major) {
              return ListTile(
                title: Text(
                  '${major.name} - ${major.creditHours} Credit Hours - Minimum Grade: ${major.minimumGrade}%',
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
