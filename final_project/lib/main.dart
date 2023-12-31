// Import necessary packages
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:final_project/weightloggingpage.dart';

void main() {
  runApp(const MyApp());
}

// MainApp Class
// Includes title, AD0N1S Fitness which has 0 and 1 as a nod to binary.
// The ThemeData uses a primarySwatch instead of primaryColor to be more
// specific to the MaterialApp use.
// Defined a home screen
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AD0N1S Fitness',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

// Homescreen state stuff
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
  final List<Map<String, String>> links = [
    {'text': 'Website 1', 'url': 'https://www.example1.com'},
    {'text': 'Website 2', 'url': 'https://www.example2.com'},
    {'text': 'Website 3', 'url': 'https://www.example3.com'},
  ];
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages for Nutrition and Fitness
  final List<Widget> _pages = [
    const NutritionPage(),
    const FitnessPage(),
    const WeightLoggingPage(),
  ];

  // App Bar Stuff
  // Controls page navigation, titles, and icons.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AD0N1S Fitness'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Nutrition',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Fitness',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight),
            label: 'Weight Tracker',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

// Start Nutrition Page Stuff
class NutritionInformationTab extends StatelessWidget {
  const NutritionInformationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Nutrition Information Tab Content'),
    );
  }
}

class NutritionLogTab extends StatelessWidget {
  const NutritionLogTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Nutrition Log Tab Content'),
    );
  }
}

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  _NutritionPageState createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Information'),
            Tab(text: 'Log'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // Nutrition Information Tab
          NutritionInformationTab(),

          // Nutrition Log Tab
          NutritionLogTab(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

// Start Fitness Page Stuff
class FitnessInformationTab extends StatelessWidget {
  const FitnessInformationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Fitness Information Tab Content'),
    );
  }
}

class FitnessWorkoutsTab extends StatelessWidget {
  const FitnessWorkoutsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Fitness Workouts Tab Content'),
    );
  }
}

class FitnessPage extends StatefulWidget {
  const FitnessPage({super.key});

  @override
  _FitnessPageState createState() => _FitnessPageState();
}

class _FitnessPageState extends State<FitnessPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Information'),
            Tab(text: 'Workouts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // Fitness Information Tab
          FitnessInformationTab(),

          // Fitness Workouts Tab
          FitnessWorkoutsTab(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
