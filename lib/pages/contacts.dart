import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  // Dummy data for contacts
  final List<Map<String, String>> contacts = [
    {"name": "John Doe", "number": "1234567890", "image": "assets/images/person1.jpg"},
    {"name": "Jane Smith", "number": "9876543210", "image": "assets/images/person2.jpg"},
    {"name": "Bob Johnson", "number": "4567891230", "image": "assets/images/person3.jpg"},
    {"name": "Alice Brown", "number": "7891234560", "image": "assets/images/person4.jpg"},
    {"name": "Alice Brown", "number": "7891234560", "image": "assets/images/person4.jpg"},
    {"name": "John Doe", "number": "1234567890", "image": "assets/images/person1.jpg"},
    {"name": "Jane Smith", "number": "9876543210", "image": "assets/images/person2.jpg"},
    {"name": "Bob Johnson", "number": "4567891230", "image": "assets/images/person3.jpg"},
    {"name": "Alice Brown", "number": "7891234560", "image": "assets/images/person4.jpg"},
    {"name": "Alice Brown", "number": "7891234560", "image": "assets/images/person4.jpg"},
    {"name": "John Doe", "number": "1234567890", "image": "assets/images/person1.jpg"},
    {"name": "Jane Smith", "number": "9876543210", "image": "assets/images/person2.jpg"},
    {"name": "Bob Johnson", "number": "4567891230", "image": "assets/images/person3.jpg"},
    {"name": "Alice Brown", "number": "7891234560", "image": "assets/images/person4.jpg"},
    {"name": "Alice Brown", "number": "7891234560", "image": "assets/images/person4.jpg"},
    {"name": "John Doe", "number": "1234567890", "image": "assets/images/person1.jpg"},
    {"name": "Jane Smith", "number": "9876543210", "image": "assets/images/person2.jpg"},
    {"name": "Bob Johnson", "number": "4567891230", "image": "assets/images/person3.jpg"},
    {"name": "Alice Brown", "number": "7891234560", "image": "assets/images/person4.jpg"},
    {"name": "Alice Brown", "number": "7891234560", "image": "assets/images/person4.jpg"},
    {"name": "John Doe", "number": "1234567890", "image": "assets/images/person1.jpg"},
    {"name": "Jane Smith", "number": "9876543210", "image": "assets/images/person2.jpg"},
    {"name": "Bob Johnson", "number": "4567891230", "image": "assets/images/person3.jpg"},
    {"name": "Alice Brown", "number": "7891234560", "image": "assets/images/person4.jpg"},
    // Add more contacts as needed
  ];

  // Function to make a call
  void _launchCaller(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $phoneNumber')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: const Text(
          "Contacts",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(17.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 10.0, // Space between columns
          mainAxisSpacing: 10.0, // Space between rows
          childAspectRatio: 0.8, // Adjusted for image and text
        ),
        itemCount: contacts.length, // Number of items
        itemBuilder: (BuildContext context, int index) {
          final contact = contacts[index];
          return GestureDetector(
            onTap: () => _launchCaller(contact["number"]!),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(17.3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Displaying image
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(contact["image"]!),
                  ),
                  const SizedBox(height: 10),
                  // Displaying name
                  Text(
                    contact["name"]!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Displaying phone number
                  Text(
                    contact["number"]!,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}