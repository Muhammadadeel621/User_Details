import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userformappassignment/greeting.dart';
import 'package:userformappassignment/provider/user_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Greeting App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your details to see a personalized greeting.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            // Name Input Field
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.person, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 16),
            // Age Input Field
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                labelText: 'Enter your age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon:
                    const Icon(Icons.calendar_today, color: Colors.teal),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final name = nameController.text;
                  final age = int.tryParse(ageController.text) ?? 0;
                  context.read<UserProvider>().updateUser(name, age);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Display Greeting Information
            Consumer<UserProvider>(
              builder: (context, value, child) {
                final greeting = Greeting.getGreeting(value.age);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (value.name.isNotEmpty) ...[
                      const Text(
                        'Your Details',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Name: ${value.name}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Age: ${value.age}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Greeting: $greeting',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
