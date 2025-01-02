import 'package:flutter/material.dart';
import '../authority/author.dart';
import 'contacts.dart';

class Others extends StatefulWidget {
  const Others({super.key});

  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),//changes the colour of the drawers 3 bar icon
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Other Services",
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple.shade300,
                minimumSize: const Size(250, 55),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                elevation: 5,
              ),
              onPressed: () {
                // Show the image in a dialog when the button is pressed
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Contacts()));
              },
              child: const Text(
                "Important Contacts",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple.shade300,
                minimumSize: const Size(250, 55),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                elevation: 5,
              ),
              onPressed: () {
                // Show the image in a dialog when the button is pressed
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Image.asset("assets/images/wedtosat.jpg"),
                    );
                  },
                );
              },
              child: const Text(
                "Schedule For Wed to Sat",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple.shade300,
                minimumSize: const Size(250, 55),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                elevation: 5,
              ),
              onPressed: () {
                // Show the image in a dialog when the button is pressed
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Image.asset("assets/images/fri.jpg"),
                    );
                  },
                );
              },
              child: const Text(
                "Schedule For Friday",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}