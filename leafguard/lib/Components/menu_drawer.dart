import 'package:flutter/material.dart';
import '../main.dart';
import '../predict.dart';
import 'about_page.dart';
import 'credits_page.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6, // 60% of screen width
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container( // Wrap DrawerHeader in a Container to control height
                height: 100, // Set desired height here
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'Artificial Intelligence and Logical Thinking',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PredictPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Credits'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreditsPage()),
                  );
                },
              ),
              const Spacer(), // Pushes the text to the bottom
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Created by Dhanush @2024',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12, // Small font size
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
