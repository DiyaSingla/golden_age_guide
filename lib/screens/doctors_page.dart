import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class Doctor {
  final String name;
  final String phone;
  final String ratings;
  final String location;

  Doctor({
    required this.name,
    required this.phone,
    required this.ratings,
    required this.location,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorsListPage(),
    );
  }
}

class DoctorsListPage extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. A.K. Mathur',
      phone: '+1 (123) 456-7890',
      ratings: '4/5',
      location: 'ABC Hospital',
    ),
    Doctor(
      name: 'Dr. Rajesh Gupta',
      phone: '+91 (456) 789-1230',
      ratings: '4.5/5',
      location: 'XYZ Clinic',
    ),
    Doctor(
      name: 'Dr. Priya Sharma',
      phone: '+91 (789) 123-4567',
      ratings: '4.8/5',
      location: 'PQR Hospital',
    ),
    Doctor(
      name: 'Dr. Ankit Patel',
      phone: '+91 (567) 890-1234',
      ratings: '4.2/5',
      location: 'LMN Clinic',
    ),
    Doctor(
      name: 'Dr. Nisha Verma',
      phone: '+91 (234) 567-8901',
      ratings: '4.6/5',
      location: 'EFG Hospital',
    ),
    Doctor(
      name: 'Dr. Sanjay Singh',
      phone: '+91 (987) 654-3210',
      ratings: '4.3/5',
      location: 'JKL Clinic',
    ),
    Doctor(
      name: 'Dr. Manisha Joshi',
      phone: '+91 (321) 654-9870',
      ratings: '4.7/5',
      location: 'RST Hospital',
    ),
    Doctor(
      name: 'Dr. Rahul Mehta',
      phone: '+91 (876) 543-2109',
      ratings: '4.4/5',
      location: 'UVW Clinic',
    ),
    Doctor(
      name: 'Dr. Pooja Singh',
      phone: '+91 (543) 210-9876',
      ratings: '4.9/5',
      location: 'HIJ Hospital',
    ),
    Doctor(
      name: 'Dr. Suresh Kumar',
      phone: '+91 (109) 876-5432',
      ratings: '4.1/5',
      location: 'GHI Clinic',
    ),
  ];

  DoctorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctors'),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final organization = doctors[index];

            return CaseCard(
                name: organization.name,
                Ratings: organization.ratings,
                phone: organization.phone,
                location: organization.location);
          },
        ),
      ),
    );
  }
}

class CaseCard extends StatelessWidget {
  final String name;
  final String Ratings;
  final String phone;
  final String location;

  const CaseCard(
      {super.key,
      required this.name,
      required this.Ratings,
      required this.phone,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse('tel:$phone');

        // Check if the device can handle the call

        if (!await launchUrl(uri)) {
          await launchUrl(uri); // Make the first call
        } else {
          print('Error: Could not make the call.');
        }
      },
      child: Card(
        color: Colors.white,
        elevation: 1,
        //shadowColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(
            color: Colors.red,
          ),
        ),
        child: ListTile(
          hoverColor: const Color.fromARGB(255, 231, 223, 255),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                'Name: $name',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Phone no.: $phone',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Location: $location',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Ratings: $Ratings',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          trailing: const Icon(Icons.phone), // Add the forward arrow icon
        ),
      ),
    );
  }
}
