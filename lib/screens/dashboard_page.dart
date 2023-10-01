import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goldenageguide/screens/chatbot_screen.dart';
import 'package:goldenageguide/screens/health_page.dart';
import 'package:goldenageguide/screens/resources_page.dart';
import 'package:goldenageguide/screens/signin_page.dart';
import 'package:goldenageguide/screens/sos_page.dart';
import 'profile_page.dart';

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
  runApp(MaterialApp(home: DashboardPage(user: data)));
}

class DashboardPage extends StatefulWidget {
  Map<String, dynamic> user;
  DashboardPage({super.key, required this.user});
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<bool> completedTasks = [false, false, false, false, false];
  final List<Color> taskColors = [
    const Color.fromARGB(255, 178, 221, 245),
    const Color.fromARGB(255, 198, 248, 194),
    const Color.fromARGB(255, 231, 184, 246),
    const Color.fromARGB(255, 251, 243, 176),
    const Color.fromARGB(255, 251, 189, 220),
  ];

  List<String> tasks = [
    'Morning Walk',
    'Check Blood Pressure',
    'Call Grandchildren',
    'Take Medicines',
    'Water Plants'
  ];
  List<String> time = [
    '7:00 am - 7:30 am',
    '10:00 am',
    '3:00 pm',
    "4:00 pm",
    "6:00 pm"
  ];

  void _onTaskCompleted(int index) {
    setState(() {
      completedTasks[index] = !completedTasks[index];
    });
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DashboardPage(
                  user: widget.user,
                )),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResourcesPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatBotScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              final data = widget.user;
              print(data);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(user: data),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Card/Tile
            Container(
              decoration: const BoxDecoration(
                color: Colors.red, // You can change the background color
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align left
                children: [
                  // User Name (Left-aligned)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                    child: Text(
                      widget.user['name'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Task Reminder (Left-aligned)
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                    child: Text(
                      'How are you feeling today?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Yesterday's Report (Left-aligned)
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                    child: Text(
                      "It is time to check your",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 0, 16.0),
                    child: Text(
                      "Blood Pressure",
                      style: TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  // Check Now and Remind Me Later Buttons (Center-aligned)
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle "Check Now" button tap
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent.shade700,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: const Size(
                                150, 50), // Set the button's background color
                          ),
                          child: const Text(
                            'Check Now',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle "Remind Me Later" button tap
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: const Size(
                                150, 50), // Set the button's background color
                          ),
                          child: const Text(
                            'Remind Me Later',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              margin: const EdgeInsets.all(14.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.health_and_safety),
                        const Text(
                          "Health Report",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HealthStatusPage()),
                            );
                          },
                        ),
                      ],
                    ),
                    const Text(
                      "Check your Health Status- Signs and Reports!",
                      style: TextStyle(
                        fontSize: 16, // Increase text size
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            Card(
              margin: const EdgeInsets.all(14.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Did you go for \nyour morning walk today?",
                      style: TextStyle(
                        fontSize: 20, // Increase text size
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle "Check Now" button tap
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(200, 71, 11, 57),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Smaller button size
                            ),
                            minimumSize:
                                const Size(120, 40), // Smaller button size
                          ),
                          child: const Text(
                            'Yes I did',
                            style: TextStyle(
                              fontSize: 16, // Decrease button text size
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle "Remind Me Later" button tap
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Smaller button size
                            ),
                            minimumSize:
                                const Size(120, 40), // Smaller button size
                          ),
                          child: const Text(
                            "No I didn't",
                            style: TextStyle(
                              fontSize: 16, // Decrease button text size
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today's Tasks",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Timeline and Task Items
                  Row(
                    children: [
                      // Timeline (Vertical Line with Circles)
                      Column(
                        children: completedTasks.asMap().entries.map((entry) {
                          final index = entry.key;
                          final completed = entry.value;
                          return Column(
                            children: [
                              Container(
                                width: 16, // Circle diameter
                                height: 16, // Circle diameter
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: completed
                                      ? Colors.green
                                      : Colors.red, // Circle color
                                ),
                              ),
                              if (index < completedTasks.length - 1)
                                Container(
                                  width: 2, // Line width
                                  height: 105, // Line height
                                  color: completed
                                      ? Colors.green
                                      : Colors.grey, // Line color
                                ),
                            ],
                          );
                        }).toList(),
                      ),

                      // Task Items
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 2,
                                  margin: const EdgeInsets.only(
                                    top: 8.0,
                                    right: 16.0,
                                    bottom: 8.0,
                                    left: 16.0,
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(16.0),
                                    title: Text(
                                      tasks[index],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    subtitle: Text(
                                      time[index],
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 3, 31, 54),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    tileColor: taskColors[index],
                                    trailing: Checkbox(
                                      value: completedTasks[index],
                                      onChanged: (value) {
                                        _onTaskCompleted(index);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat Bot',
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 64.0),
        width: 80.0,
        height: 80.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SOSPage(
                        user: widget.user,
                      )),
            );
          },
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.sos,
            size: 50.0,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
