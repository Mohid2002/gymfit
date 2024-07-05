import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.blue),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Hi, Rebecca',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Diet Plans',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              buildProgressCard(),
              const SizedBox(height: 16),
              buildWeightCard(),
              const SizedBox(height: 16),
              buildCaloriesCard(),
            ],
          ),
        ),
      ),
    );
  }

  Card buildProgressCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCardHeader('Weekly Progress', '9:38 AM'),
            const SizedBox(height: 16),
            const Text('Calories', style: TextStyle(fontSize: 16)),
            const Text('1,814', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildProgressIndicator(0.5, Colors.yellow, '299g', 'Fat'),
                buildProgressIndicator(0.65, Colors.blue, '650g', 'Protein'),
                buildProgressIndicator(0.85, Colors.purple, '850g', 'Carbs'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card buildWeightCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCardHeader('Weight', '9:38 AM'),
            const SizedBox(height: 16),
            const Text('72.4 Kg', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Container(
              height: 100,
              color: Colors.grey[200],
              // Replace with actual graph widget
              child: const Center(child: Text('Graph Placeholder')),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle track new weight button press
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Track new weight',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildCaloriesCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCardHeader('Calories', '9:38 AM'),
            const SizedBox(height: 16),
            const Text('1,548 Cal', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const Text('89% Goal', style: TextStyle(fontSize: 16, color: Colors.green)),
            const SizedBox(height: 16),
            Container(
              height: 100,
              color: Colors.grey[200],
              // Replace with actual graph widget
              child: const Center(child: Text('Graph Placeholder')),
            ),
          ],
        ),
      ),
    );
  }

  Row buildCardHeader(String title, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(time, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Column buildProgressIndicator(double value, Color color, String valueText, String label) {
    return Column(
      children: [
        CircularProgressIndicator(
          value: value,
          color: color,
          backgroundColor: Colors.grey[200],
        ),
        const SizedBox(height: 8),
        Text(valueText, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: FavouriteScreen(),
  ));
}
