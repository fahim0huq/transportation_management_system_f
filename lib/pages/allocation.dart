import 'package:flutter/material.dart';

import '../authority/author.dart';

class Allocation extends StatefulWidget {
  const Allocation({super.key});

  @override
  State<Allocation> createState() => _AllocationState();
}

class _AllocationState extends State<Allocation> {
  final List<String> locations = [
    'BaroyarHat',
    'Hatazhari College',
    'Didar Market',
    'Mailer Matha',
    'Navy Gate',
    'BOT',
    'Shah Amanot Bridge',
    'Chotteswari',
    'Lucky Plaza',
    'Kotowali',
    'Kaptai Rastar Matha',
    'GEC Circle',
    'Oxygen Moor',
    'Koibollo Dham',
    'Cuet',
    'Hatazhari College',
    'Bor Dhigir Par',
    'Sitakundo',
    'Mayor Goli',
    'Boro Pul',
  ];

  final List<String> busNumbers = [
    'Bus 1',
    'Bus 2',
    'Bus 3',
    'Bus 4',
    'Bus 5',
    'Bus 6',
    'Bus 7',
    'Bus 8',
    'Bus 9',
    'Bus 10',
    'Bus 11',
    'Bus 12',
    'Bus 13',
    'Bus 14',
    'Bus 15',
    'Bus 16',
    'Bus 17',
    'Bus 18',
    'Bus 19',
    'Bus 20',
  ];
  final List<String> DriverNumbers=[
    '01558654586',
    '01879635284',
    '01745896326',
    '01558963518',
    '01558654586',
    '01879635284',
    '01745896326',
    '01558963518',
    '01558654586',
    '01879635284',
    '01745896326',
    '01558963518',
    '01558654586',
    '01879635284',
    '01745896326',
    '01558963518',
    '01558654586',
    '01879635284',
    '01745896326',
    '01558963518',
    '01558654586',
    '01879635284',
    '01745896326',
    '01558963518',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),//changes the colour of the drawers 3 bar icon
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Today's Bus Allocation",
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
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            "Allocated Buses",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Date: 27 December 2024",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple.shade300,
                      child: Text(
                        busNumbers[index],
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    title: Text(locations[index]),
                    subtitle: Text('Allocated bus: ${busNumbers[index]}'),
                    trailing: IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Driver phone copied!')),
                        );
                      },
                      icon: const Icon(Icons.phone),
                    ),
                    onTap: () {
                      print('Selected: ${locations[index]} with ${busNumbers[index]}');
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
