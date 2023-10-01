import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:sms/sms.dart';

class SOSPage extends StatefulWidget {
  final user;
  const SOSPage({super.key, required this.user});
  @override
  _SOSPageState createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  @override
  void initState() {
    super.initState();
    //makeEmergencyCalls();
  }

//   Future<void> sendSms(List<String> phoneNumbers, String message) async {
//   try {
//     for (var phoneNumber in phoneNumbers) {
//       final sender = SmsSender();
//       final message = SmsMessage(phoneNumber, message);
//       await sender.sendSms(message);
//     }
//     // Continue displaying the SOS screen
//   } catch (e) {
//     // Handle errors
//   }
// }

  void makeEmergencyCalls() async {
    final String contact1Number = widget.user['ecNumber1'];
    final String contact2Number = widget.user['ecNumber2'];

    final Uri uri1 = Uri.parse('tel:8929401833');
    final Uri uri2 = Uri.parse('tel:$contact2Number');

    // Check if the device can handle the call

    if (!await launchUrl(uri1) && await launchUrl(uri2)) {
      await launchUrl(uri1); // Make the first call
      await launchUrl(uri2); // Make the second call
    } else {
      print('Error: Could not make the call.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Set the green background
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 1, // Display two tiles side by side
          padding: const EdgeInsets.all(16.0),
          children: [
            buildTile('Emergency Contact 1', widget.user['ecName1'],
                'images/male.png'),
            buildTile('Emergency Contact 2', widget.user['ecName2'],
                'images/female.png'),
          ],
        ),
      ),
    );
  }

  Widget buildTile(String contactName, String name, String imagePath) {
    return Card(
      color: const Color.fromARGB(255, 217, 255, 219),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.phone, size: 50.0),
          const SizedBox(height: 16.0),
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 16.0),
          Text(
            name,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Calling...',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

void main() {
  final data = {
    'email': 'bob@example.com',
    'name': 'Bob',
    'age': '70',
    'gender': 'male',
    'address': 'Delhi',
    'ecName1': 'Robin',
    'ecNumber1': '123-456-7890',
    'ecName2': 'Robin',
    'ecNumber2': '123-456-7890',
    'allergies': ['Peanuts', 'Shellfish'],
    'medications': ['Medicine A', 'Medicine B'],
    'medicalConditions': ['High Blood Pressure', 'Diabetes']
  };
  runApp(MaterialApp(
    home: SOSPage(
      user: data,
    ),
  ));
}
