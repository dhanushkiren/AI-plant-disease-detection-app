import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Api/modelApi.dart';
import 'Models/prediction.dart';
import 'constants.dart';
import 'prediction_details_page.dart';
import 'Components/menu_drawer.dart';  // Import the new MenuDrawer widget

class PredictPage extends StatefulWidget {
  const PredictPage({Key? key}) : super(key: key);

  @override
  _PredictPageState createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  List<Prediction>? _predictions;
  bool _isLoading = false;

void getPrediction(File image) async {
  var apiService = modelApi(baseUrl: api);
  setState(() {
    _isLoading = true; // Show loader when the API call starts
    _predictions = null; // Reset predictions before fetching new ones
  });

  try {
    var response = await apiService.predict(image.path);
    print('API Response: $response');
    if (response.isEmpty) {
      throw Exception('Empty response from API');
    }
    var predictions = Predictions.fromJson(response);
    setState(() {
      _predictions = [
        predictions.prediction1,
        predictions.prediction2,
        predictions.prediction3,
      ];
      _isLoading = false; // Hide loader once the API call completes
    });

    // Double check that the image exists before deleting
    if (await image.exists()) {
      await image.delete();
      print("Image deleted successfully: ${image.path}");
    } else {
      print("Image does not exist at path: ${image.path}");
    }
    
  } catch (e) {
    print('Error fetching prediction: $e');
    // Show error message using Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching prediction: $e')));
    setState(() {
      _predictions = [];
      _isLoading = false; // Hide loader if there's an error
    });
  }
}


  // Function to pick image from gallery
  pickImageGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
        _predictions = null;
      });
      getPrediction(_imageFile!);
    }
  }

  // Function to capture image from camera
  pickImageCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
        _predictions = null;
      });
      getPrediction(_imageFile!);
    }
  }

  // Function to clear the selected image and reset predictions
  void clearImage() {
    setState(() {
      _imageFile = null;
      _predictions = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set the AppBar background color to white
        title: const Text(
          "Plant Disease Detection",
          style: TextStyle(color: Colors.black), // Set title text color to black
        ),
        iconTheme: IconThemeData(color: Colors.black), // Set the icon color to black
      ),
      drawer: MenuDrawer(), // Use the MenuDrawer here
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // Changes position of shadow
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/upload.jpg'),
                        fit: BoxFit.cover, // Cover ensures the image respects the container's edges
                        colorFilter: _imageFile == null
                            ? ColorFilter.mode(
                                Colors.grey.withOpacity(0.6),
                                BlendMode.dstATop,
                              )
                            : null,
                      ),
                    ),
                    child: _imageFile != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _imageFile!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                  if (_imageFile != null)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.red),
                        onPressed: clearImage, // Clear image when clicked
                      ),
                    ),
                  if (_isLoading)
                    Positioned.fill(
                      child: Container(
                        color: Colors.green.withOpacity(0.4),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              if (_predictions != null)
                for (var pred in _predictions!)
                  Card(
                    child: ListTile(
                      title: Text(pred.className),
                      subtitle: Text(
                          '${(double.parse(pred.confidence.replaceFirst('%', ''))).toStringAsFixed(2)}% confidence'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PredictionDetailsPage(prediction: pred),
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: pickImageGallery,
                child: const Text("Pick from gallery"),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  onPressed: pickImageCamera,
                  child: const Text("Open camera")),
            ],
          ),
        ),
      ),
    );
  }
}
