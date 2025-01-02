import 'package:flutter/material.dart';
import 'package:tms_iiuc/authority/routeform.dart';

class AuthorOptions extends StatefulWidget {
  const AuthorOptions({super.key});

  @override
  State<AuthorOptions> createState() => _AuthorOptionsState();
}

class _AuthorOptionsState extends State<AuthorOptions> {
  final List<Map<String, String>> options = [
    {"option": "Manage Routes"},
    {"option": "View Reports"},
    {"option": "Add Schedules"},
    {"option": "Edit Settings"},
    {"option": "Add Schedules"},
    {"option": "Edit Settings"},
    {"option": "Add Schedules"},
    {"option": "Edit Settings"},
    {"option": "Add Schedules"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: const Text(
          "Author Options",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            shrinkWrap: true, // Ensure the GridView adjusts to its content
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Adjusted for better layout
              crossAxisSpacing: 15.0, // Space between columns
              mainAxisSpacing: 15.0, // Space between rows
              childAspectRatio: 1.0, // Balanced for proper centering
            ),
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              final option = options[index];
              return GestureDetector(
                onTap: () {
                  if (option["option"] == "Manage Routes") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Routeform()),
                    );
                  }
                  // Add more navigation logic if needed
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.purple.shade700,
                        size: 40.0,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        option["option"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}