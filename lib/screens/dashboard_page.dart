import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goldenageguide/screens/chatbot_screen.dart';
import 'package:goldenageguide/screens/health_page.dart';
import 'package:goldenageguide/screens/resources_page.dart';
import 'package:goldenageguide/screens/signin_page.dart';
import 'package:goldenageguide/screens/sos_page.dart';
import 'profile_page.dart';

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
//   runApp(MaterialApp(home: DashboardPage(user: data)));
// }

class DashboardPage extends StatefulWidget {
  Color clr = Colors.grey;
  Color clr2 = Colors.grey;
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
    'Listen Music',
    'Meditate',
    'Call Grandchildren',
    'Spend Time with Spouse',
    'Water Plants'
  ];

  List<String> sub = [
    'Relaxing music is always a good idea',
    'Savour moments of Peace',
    'Tell them how much you love them',
    'Laugh, Singh and Dance Together',
    'Pamper your plants'
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
            Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                    child: Text(
                      "Thought of the day is: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 16.0),
                    child: Text(
                      "Find joy in the little things; they often lead to the biggest smiles",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.clr = Colors.green;
                          });
                        },
                        customBorder: CircleBorder(),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.clr,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.thumb_up,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.clr2 = const Color.fromARGB(255, 245, 20, 3);
                          });
                        },
                        customBorder: const CircleBorder(),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.clr2,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.thumb_down,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
              color: const Color.fromARGB(255, 202, 244, 240),
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
                        Image.asset("images/meter.png"),
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Check your Health Status- Signs and Reports!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
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
                    "Activities for You",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Timeline and Task Items
                  Row(
                    children: [
                      Column(
                        children: completedTasks.asMap().entries.map((entry) {
                          final index = entry.key;
                          final completed = entry.value;
                          return Column(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: completed ? Colors.green : Colors.red,
                                ),
                              ),
                              if (index < completedTasks.length - 1)
                                Container(
                                  width: 2,
                                  height: 105,
                                  color: completed ? Colors.green : Colors.grey,
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
                                    right: 12.0,
                                    bottom: 8.0,
                                    left: 12.0,
                                  ),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    contentPadding: const EdgeInsets.all(16.0),
                                    title: Text(
                                      tasks[index],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    subtitle: Text(
                                      sub[index],
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 3, 31, 54),
                                          fontWeight: FontWeight.w400,
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
