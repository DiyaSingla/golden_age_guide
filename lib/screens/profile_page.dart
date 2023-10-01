import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../user_datamodel.dart';

// void main() {
//   final data = {
//     'email': 'bob@example.com',
//     'name': 'Bob',
//     'age': '70',
//     'gender': 'male',
//     'address': 'Delhi',
//     'ecName1': 'Robin',
//     'ecNumber1': '123-456-7890',
//     'ecName2': 'Robin',
//     'ecNumber2': '123-456-7890',
//     'allergies': ['Peanuts', 'Shellfish'],
//     'medications': ['Medicine A', 'Medicine B'],
//     'medicalConditions': ['High Blood Pressure', 'Diabetes']
//   };
//   runApp(MaterialApp(
//     home: ProfilePage(user: data),
//   ));
//}

class ProfilePage extends StatefulWidget {
  Map<String, dynamic> user;
  ProfilePage({super.key, required this.user});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditMode = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ecName1Controller = TextEditingController();
  TextEditingController ecNumber1Controller = TextEditingController();
  TextEditingController ecName2Controller = TextEditingController();
  TextEditingController ecNumber2Controller = TextEditingController();
  TextEditingController allergiesController = TextEditingController();
  TextEditingController medsController = TextEditingController();
  TextEditingController medCondController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //print(widget.user);

    nameController.text = widget.user['name']?.toString() ?? '';
    ageController.text = widget.user['age']?.toString() ?? '';
    genderController.text = widget.user['gender']?.toString() ?? '';
    addressController.text = widget.user['address']?.toString() ?? '';
    ecName1Controller.text = widget.user['ecName1']?.toString() ?? '';
    ecNumber1Controller.text = widget.user['ecNumber1']?.toString() ?? '';
    ecName2Controller.text = widget.user['ecName2']?.toString() ?? '';
    ecNumber2Controller.text = widget.user['ecNumber2']?.toString() ?? '';
    allergiesController.text =
        (widget.user['allergies'] as List<dynamic>?)?.join(', ') ?? '';
    medsController.text =
        (widget.user['medications'] as List<dynamic>?)?.join(', ') ?? '';
    medCondController.text =
        (widget.user['medicalConditions'] as List<dynamic>?)?.join(', ') ?? '';
  }

  void toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageURL = (genderController.text == 'Male')
        ? 'images/male.png'
        : 'images/female.png';
    //final imageURL = 'images/female.png';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Align content in the center
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                      child: Text(
                        'My Profile',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage(imageURL), // Add your image here
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 0, 0),
                      child: Text(
                        nameController.text,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 16.0),
                      child: Text(
                        "${ageController.text} | ${addressController.text}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildSection(
                title: 'Personal Info',
                bgcolor: const Color.fromARGB(255, 251, 243, 176),
                children: isEditMode
                    ? [
                        _buildEditableInfoRow(
                            'Name', nameController.text, nameController),
                        _buildEditableInfoRow(
                            'Age', ageController.text, ageController),
                        _buildEditableInfoRow(
                            'Gender', genderController.text, genderController),
                        _buildEditableInfoRow('Address', addressController.text,
                            addressController),
                      ]
                    : [
                        _buildInfoRow('Name', nameController.text),
                        _buildInfoRow('Age', ageController.text),
                        _buildInfoRow('Gender', genderController.text),
                        _buildInfoRow('Address', addressController.text),
                      ],
              ),
              _buildSection(
                title: 'Emergency Contacts',
                bgcolor: const Color.fromARGB(255, 198, 248, 194),
                children: isEditMode
                    ? [
                        _buildEditableInfoRow(
                          'Name',
                          ecName1Controller.text,
                          ecName1Controller,
                        ),
                        _buildEditableInfoRow(
                          'Phone Number',
                          ecNumber1Controller.text,
                          ecNumber1Controller,
                        ),
                        _buildEditableInfoRow(
                          'Name',
                          ecName2Controller.text,
                          ecName2Controller,
                        ),
                        _buildEditableInfoRow(
                          'Phone Number',
                          ecNumber2Controller.text,
                          ecNumber2Controller,
                        )
                      ]
                    : [
                        _buildInfoRow('Name', ecName1Controller.text),
                        _buildInfoRow('Phone Number', ecNumber1Controller.text),
                        _buildInfoRow('Name', ecName2Controller.text),
                        _buildInfoRow('Phone Number', ecNumber2Controller.text),
                      ],
              ),
              _buildSection(
                title: 'Allergies',
                bgcolor: const Color.fromARGB(255, 178, 221, 245),
                imagePath: 'images/allergy.png',
                children: isEditMode
                    ? [_buildTextField(allergiesController)]
                    : (allergiesController.text.split(', '))
                        .map<Widget>((allergies) {
                        return _buildInfoRow(" ", allergies);
                      }).toList(),
              ),
              _buildSection(
                title: 'Medications',
                bgcolor: const Color.fromARGB(255, 231, 184, 246),
                imagePath: 'images/meds.png',
                children: isEditMode
                    ? [_buildTextField(medsController)]
                    : (medsController.text.split(', '))
                        .map<Widget>((medication) {
                        return _buildInfoRow(' ', medication);
                      }).toList(),
              ),
              _buildSection(
                title: 'Medical Conditions',
                bgcolor: const Color.fromARGB(255, 251, 189, 220),
                imagePath: 'images/sick.png',
                children: isEditMode
                    ? [_buildTextField(medCondController)]
                    : widget.user['medicalConditions'].map<Widget>((condition) {
                        return _buildInfoRow(' ', condition);
                      }).toList(),
              ),
              isEditMode
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final user = User(
                              email: widget.user['email'],
                              name: nameController.text,
                              age: ageController.text,
                              gender: genderController.text,
                              address: addressController.text,
                              ecName1: ecName1Controller.text,
                              ecNumber1: ecNumber1Controller.text,
                              ecName2: ecName2Controller.text,
                              ecNumber2: ecNumber2Controller.text,
                              allergies: allergiesController.text.split(','),
                              medications: medsController.text.split(','),
                              medicalConditions:
                                  medCondController.text.split(','),
                            );
                            saveUserProfile(user);
                            toggleEditMode();
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
                        ElevatedButton(
                          onPressed: toggleEditMode,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: const Size(150, 50),
                          ),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: toggleEditMode,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: const Size(150, 50),
                          ),
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ));
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
    required bgcolor,
    String imagePath = '',
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgcolor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: (imagePath != '')
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: children,
                    ),
                  ],
                ),
                Image.asset(
                  imagePath,
                  height: 100,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: children,
                ),
              ],
            ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    if (label == ' ') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText:
            'Enter ${controller == allergiesController ? 'allergies' : controller == medsController ? 'medications' : 'medical conditions'}',
      ),
    );
  }

  Widget _buildEditableInfoRow(
      String label, String value, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '$label :  ',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(),
          ),
        ),
      ],
    );
  }

  void saveUserProfile(User userProfile) {
    const path = 'userProfiles/3v5aLssggEEfnSiPFSK3';
    FirebaseFirestore.instance.doc(path).update({
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
    }).then((value) {
      // Successfully saved data to Firestore
    }).catchError((error) {
      // Handle errors, e.g., Firestore is unreachable
    });
  }
}
