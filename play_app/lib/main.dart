import 'package:flutter/material.dart';

void main() {
  runApp(const Play4EarnnApp());
}

class Play4EarnnApp extends StatelessWidget {
  const Play4EarnnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _coins = 1250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play4Earnn Dashboard'),
        actions: [
          Chip(
            avatar: const Icon(Icons.monetization_on, color: Colors.amber),
            label: Text('$_coins'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            color: Colors.deepPurple,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Welcome Back! Earn more today.', style: TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.play_arrow, color: Colors.green),
            title: const Text('Watch Video'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => setState(() => _coins += 100),
          ),
          ListTile(
            leading: const Icon(Icons.refresh, color: Colors.blue),
            title: const Text('Daily Check-in'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => setState(() => _coins += 50),
          ),
        ],
      ),
    );
  }
}
