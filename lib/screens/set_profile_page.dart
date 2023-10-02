import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goldenageguide/screens/dashboard_page.dart';
import '../user_datamodel.dart';

class ProfileSetupPage extends StatefulWidget {
  String email;
  ProfileSetupPage({super.key, required this.email});
  @override
  _ProfileSetupPageState createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emergencyContactNameController =
      TextEditingController();
  final TextEditingController _emergencyContactNumberController =
      TextEditingController();
  final TextEditingController _emergencyContactName2Controller =
      TextEditingController();
  final TextEditingController _emergencyContactNumber2Controller =
      TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();
  final TextEditingController _medicationsController = TextEditingController();
  final TextEditingController _medicalConditionsController =
      TextEditingController();
  String _selectedGender = "Male";
  String docId = '';

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Setup'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(children: <Widget>[
              Center(
                child: Image.asset(
                  'images/profile.png',
                  width: 150,
                  height: 150,
                ),
              ),
              _buildSection(
                title: 'Personal Information',
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name*',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10), // Add space
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedGender = newValue!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Gender*',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                    items: <String>[
                      'Male',
                      'Female',
                      'Non-Binary',
                      'Other',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10), // Add space
                  TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                      labelText: 'Age*',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10), // Add space
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Emergency Contact Details',
                children: [
                  TextFormField(
                    controller: _emergencyContactNameController,
                    decoration: const InputDecoration(
                      labelText: 'Emergency Contact Name*',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10), // Add space
                  TextFormField(
                    controller: _emergencyContactNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Emergency Contact Number*',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty && value.length == 10) {
                        return 'This field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10), // Add space
                  TextFormField(
                    controller: _emergencyContactName2Controller,
                    decoration: const InputDecoration(
                      labelText: 'Emergency Contact Name (2nd)*',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10), // Add space
                  TextFormField(
                    controller: _emergencyContactNumber2Controller,
                    decoration: const InputDecoration(
                      labelText: 'Emergency Contact Number (2nd)*',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty && value.length == 10) {
                        return 'This field is required.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              _buildSection(
                title: 'Medical Conditions',
                children: [
                  TextFormField(
                    controller: _allergiesController,
                    decoration: const InputDecoration(
                      labelText: 'Allergies',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _medicationsController,
                    decoration: const InputDecoration(
                      labelText: 'Medications',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _medicalConditionsController,
                    decoration: const InputDecoration(
                      labelText: 'Medical Conditions',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final user = User(
                      email: widget.email,
                      name: _nameController.text,
                      age: _ageController.text,
                      gender: _selectedGender,
                      address: _addressController.text,
                      ecName1: _emergencyContactNameController.text,
                      ecNumber1: _emergencyContactNumberController.text,
                      ecName2: _emergencyContactName2Controller.text,
                      ecNumber2: _emergencyContactNumber2Controller.text,
                      allergies: _allergiesController.text.split(','),
                      medications: _medicationsController.text.split(','),
                      medicalConditions:
                          _medicalConditionsController.text.split(','),
                    );
                    await saveUserProfile(user);

                    Map<String, dynamic> data = {
                      'id': docId,
                      'email': widget.email,
                      'name': _nameController.text,
                      'age': _ageController.text,
                      'gender': _selectedGender,
                      'address': _addressController.text,
                      'ecName1': _emergencyContactNameController.text,
                      'ecNumber1': _emergencyContactNumberController.text,
                      'ecName2': _emergencyContactName2Controller.text,
                      'ecNumber2': _emergencyContactNumber2Controller.text,
                      'allergies': _allergiesController.text.split(','),
                      'medications': _medicationsController.text.split(','),
                      'medicalConditions':
                          _medicalConditionsController.text.split(','),
                    };
                    // If Form is valid, save user's profile

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardPage(
                          user: data,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(150, 50),
                ),
                child: const Text(
                  "Save Details",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      title: Text(title),
      children: children,
    );
  }

  Future<void> saveUserProfile(User userProfile) async {
    try {
      final DocumentReference docRef =
          await FirebaseFirestore.instance.collection('userProfiles').add({
        'email': userProfile.email,
        'name': userProfile.name,
        'age': userProfile.age,
        'gender': userProfile.gender,
        'address': userProfile.address,
        'ecName1': userProfile.ecName1,
        'ecNumber1': userProfile.ecNumber1,
        'ecName2': userProfile.ecName2,
        'ecNumber2': userProfile.ecNumber2,
        'allergies': userProfile.allergies,
        'medications': userProfile.medications,
        'medicalConditions': userProfile.medicalConditions,
      });

      // Get the auto-generated Firestore document ID
      docId = docRef.id;

      // Update the 'id' field in the document with the generated ID
      await docRef.update({'id': docId});

      // Successfully saved data to Firestore
    } catch (error) {
      // Handle errors, e.g., Firestore is unreachable
      print('Error: $error');
    }
  }
}
