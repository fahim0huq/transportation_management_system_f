import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Database/db_helper.dart';
import 'author_options.dart';
import 'package:tms_iiuc/model/route.dart' as road;


class Routeform extends StatefulWidget {
  const Routeform({super.key});

  @override
  State<Routeform> createState() => _RouteformState();
}

class _RouteformState extends State<Routeform> {
  late DatabaseHelper dbHelper;
  var  routeeditingController = TextEditingController();

  Future<void> AddRoutes() async {
    final newroute = road.Route(
      route : routeeditingController.text,

    );

    int check = await dbHelper.insertData(newroute); // Insert the Info object directly
    print("Check=$check");

    if (check > 0) {
      Get.snackbar("Success", "Route Added", snackPosition: SnackPosition.BOTTOM);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthorOptions()),
              (route) => false); // Navigate to Homepage and remove previous screens
    } else {
      Get.snackbar("Error", "Failed to add route", snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title: const Text(
          "Add Routes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Route Details:",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: routeeditingController,
              maxLines: 4, // Allows for a larger text field
              decoration: InputDecoration(
                hintText: "Enter route (e.g., 'bor Dhigir par -> Aman Bazar -> ...')",
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple.shade300),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade300,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // Handle the save action
                  final route = routeeditingController.text;
                  if (route.isNotEmpty) {
                    AddRoutes();
                    print("Route saved: $route");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a route!")),
                    );
                  }
                },
                child: const Text(
                  "Save Route",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}