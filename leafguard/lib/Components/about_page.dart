import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Make the page scrollable
        child: Center(
          child: Padding( // Add padding around the entire container
            padding: const EdgeInsets.only(top: 30.0, bottom: 30.0), // Add space at top and bottom
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9, // Make it responsive
              padding: const EdgeInsets.all(26.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes the position of the shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Plant Disease Detection",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "This application leverages Artificial Intelligence (AI) using Artificial Neural Networks (ANN) and Tensorflow to detect various plant diseases using image analysis. The system is trained to identify diseases by analyzing images of plant leaves and provides a detailed description of the disease along with prevention and treatment measures.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "How it works:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "1. Upload an image of the plant leaf.\n"
                    "2. The image will be sent to the Python server.\n"
                    "3. The AI model detects the disease using ANN.\n"
                    "4. Get a description of the disease along with its prevention and treatment.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Prevention & Treatment:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "For each detected disease, the app provides suggestions on how to prevent the disease from spreading and offers recommendations for appropriate treatments.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.green[100], // Slight background color to make it more attractive
    );
  }
}
