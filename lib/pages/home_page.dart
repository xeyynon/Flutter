import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "XeYN";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/login_image.png",
              errorBuilder: (context, error, stackTrace) {
                return const Text("Failed to load image");
              },
            ),
            const SizedBox(height: 20),
            Text("Welcome to $days days of flutter by $name"),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
