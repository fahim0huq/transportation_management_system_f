import 'package:flutter/material.dart';

import '../authority/author.dart';

class Return extends StatefulWidget {
  const Return({super.key});

  @override
  State<Return> createState() => _ReturnState();
}

class _ReturnState extends State<Return> {
  String dropdownvalue = 'BOT';

  var items = [
    'BOT',
    'Bohaddarhat mor',
    'Muradpur',
    '2No gate',
    'Sher shah',
    'ChawkBazar',
    'GEC',
    'Halisohor',
    'Baroyar Hut',
    'Agrabad',
    'Miros sorai',
    'Oxygen',
    'Hathajahri',
    'Bor Dhigir par',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight = 60.0; // Set fixed height for containers
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),//changes the colour of the drawers 3 bar icon
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Return To Home",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.admin_panel_settings,color: Colors.white,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Author()));
              },
            ),
          ],
        ),
        backgroundColor: Colors.purple.shade300,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple.shade300,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/ff.jpg'), // Profile image
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Fahim ul huq",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "ID: C2223110",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("View Profile"),
              onTap: () {
                // Navigate to View Profile screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Edit Profile"),
              onTap: () {
                // Navigate to Edit Profile screen
                Navigator.pop(context); //closes the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.bus_alert_sharp),
              title: const Text("Update Transport"),
              onTap: () {
                // Navigate to Courses screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_gas_station),
              title: const Text("Select Station"),
              onTap: () {
                // Navigate to Courses screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                // Handle logout functionality
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.11),
              ), // Add some padding
              child: const Text(
                "Didn't You get a Seat on the return Bus?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.7, // 70% of the screen width
                  height: containerHeight, // Fixed height
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.purple.shade50,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true, // Ensures dropdown expands to match width
                      value: dropdownvalue,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.purple[300],
                      ),
                      items: items.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                      dropdownColor: Colors.white,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12), // Spacer between the two containers
                Container(
                  width: screenWidth * 0.2, // 20% of the screen width
                  height: containerHeight, // Fixed height
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.purple.shade50,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.purple.shade300,
                    ),
                    onPressed: () {
                      // Add functionality to notify the author when the icon is pressed
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Notification sent to the author!')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}