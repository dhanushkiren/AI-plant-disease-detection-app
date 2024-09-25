import 'package:flutter/material.dart';

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Credits"),
        centerTitle: true, // Centering the title
      ),
      body: SingleChildScrollView( // Makes the page scrollable
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9, // Make it responsive
            margin: const EdgeInsets.symmetric(vertical: 20), // Add top and bottom padding
            padding: const EdgeInsets.all(26.0), // Content padding
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // Changes position of the shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "AI-based Plant Disease Detection",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  "This is a project from the Artificial Intelligence and Logical Thinking Laboratory named 'AI-based Plant Disease Detection using Mobile Application'. The mobile application and backend server were created and integrated by the author Dhanush Kiren, the ANN model was trained by Ganeshkumar, and the dataset was collected by Vishalkumar.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.justify, // Text justification
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.green[100], // Slight background color for attractiveness
    );
  }
}
