import 'package:flutter/material.dart';
import 'package:goldenageguide/screens/doctors_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Task {
  final String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}

class TaskListDialog extends StatefulWidget {
  final String category;
  final Function(double) onProgressUpdated; // Callback to notify parent

  const TaskListDialog({
    super.key,
    required this.category,
    required this.onProgressUpdated,
  });

  @override
  _TaskListDialogState createState() => _TaskListDialogState();
}

class _TaskListDialogState extends State<TaskListDialog> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    // Choose the appropriate list based on the category
    if (widget.category == 'Medications') {
      tasks = Medications;
    } else if (widget.category == 'Fitness') {
      tasks = Fitness;
    } else if (widget.category == 'Diet') {
      tasks = Diet;
    } else if (widget.category == 'Check Up') {
      tasks = CheckUp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      backgroundColor: Color.fromARGB(255, 248, 239, 237),
      title: Text(
        '${widget.category}',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: tasks.asMap().entries.map((entry) {
            final index = entry.key;
            final task = entry.value;
            return CheckboxListTile(
              title: Text(
                '${(index + 1)}. ${task.name} ',
                style: TextStyle(fontSize: 18),
              ),
              value: task.isCompleted,
              onChanged: (value) {
                setState(() {
                  task.isCompleted = value ?? false;
                  // Update the progress here
                  updateProgress();
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  // Calculate and update the progress
  void updateProgress() {
    int completedTasks = tasks.where((task) => task.isCompleted).length;
    double progress = tasks.isEmpty ? 0.0 : completedTasks / tasks.length;

    // Notify the parent widget (HealthTile) about the progress update
    widget.onProgressUpdated(progress);
  }
}

class HealthStatusPage extends StatefulWidget {
  const HealthStatusPage({super.key});

  @override
  _HealthStatusPageState createState() => _HealthStatusPageState();
}

class _HealthStatusPageState extends State<HealthStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0, 0, 10.0),
                  child: Text(
                    'Health Monitor',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 10.0, 0, 0.0),
                  child: Text(
                    "Let's see",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 10.0, 0, 0.0),
                  child: Text(
                    "What we have in store for you today!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 0, 16.0),
                  child: Text(
                    "Complete all your tasks!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Your Progress",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                HealthTile(
                  title: 'Medications',
                  tasksList: Medications,
                  color: const Color.fromARGB(255, 178, 221, 245),
                  c2: const Color.fromARGB(255, 24, 105, 171),
                  path: 'images/pills.png',
                ),
                HealthTile(
                  title: 'Fitness',
                  tasksList: Fitness,
                  color: const Color.fromARGB(255, 198, 248, 194),
                  c2: Colors.green,
                  path: 'images/run.png',
                ),
                HealthTile(
                  title: 'Diet',
                  tasksList: Diet,
                  color: const Color.fromARGB(255, 251, 243, 176),
                  c2: Colors.orange,
                  path: 'images/diet.png',
                ),
                HealthTile(
                  title: 'Check Up',
                  tasksList: CheckUp,
                  color: const Color.fromARGB(255, 231, 184, 246),
                  c2: Colors.purple,
                  path: 'images/status.png',
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorsListPage()),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Connect to a Doctor",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Image.asset(
                    'images/doctor.png',
                    height: 150,
                    width: 100,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HealthTile extends StatefulWidget {
  final String title;
  final List<Task> tasksList;
  final Color color;
  final Color c2;
  final String path;

  const HealthTile(
      {super.key,
      required this.title,
      required this.tasksList,
      required this.color,
      required this.c2,
      required this.path});

  @override
  _HealthTileState createState() => _HealthTileState();
}

class _HealthTileState extends State<HealthTile> {
  double progress = 0.0;

  // Function to update progress from TaskListDialog
  void handleProgressUpdate(double newProgress) {
    setState(() {
      progress = newProgress;
    });
  }

  @override
  Widget build(BuildContext context) {
    int completedTasks =
        widget.tasksList.where((task) => task.isCompleted).length;
    progress = widget.tasksList.isEmpty
        ? 0.0
        : completedTasks / widget.tasksList.length;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return TaskListDialog(
              category: widget.title,
              onProgressUpdated: handleProgressUpdate, // Pass the callback
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: widget.color, // Customize the card background color
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 6.0,
                    percent: progress,
                    center: Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    progressColor: widget.c2, // Customize the progress color
                  ),
                ),
                // Replace with your image asset
                Image.asset(
                  widget.path,
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '   $completedTasks / ${widget.tasksList.length} tasks',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HealthStatusPage(),
  ));
}

List<Task> Medications = [
  Task(name: 'Take Metformin 500mg in the morning'),
  Task(name: 'Take Lisinopril 10mg for high blood pressure'),
  Task(name: 'Inject Insulin 10 units before breakfast'),
  Task(name: 'Take Aspirin 81mg after breakfast'),
  Task(name: 'Take Vitamin D Supplement 1000 IU after lunch'),
];

List<Task> Fitness = [
  Task(name: 'Go for a Morning Walk at 7:00 AM'),
  Task(name: 'Go for an Evening Walk at 5:00 PM'),
  Task(name: 'Attend Yoga Session at 10:30 AM'),
  Task(name: 'Do Laugh Therapy Twice a Day'),
];

List<Task> Diet = [
  Task(name: 'Drink 8 Glasses of Water throughout the day'),
  Task(name: 'Eat Fruits and Vegetables for lunch and dinner'),
  Task(name: 'Have Oatmeal for breakfast'),
  Task(name: 'Limit Sugary Snacks in the afternoon'),
  Task(name: 'Have Dinner before 8:00 PM'),
];

List<Task> CheckUp = [
  Task(name: 'Check Blood Pressure in the morning'),
  Task(name: 'Monitor Blood Sugar in the morning and evening'),
  Task(name: 'Get an Eye Checkup today'),
];
