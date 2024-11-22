AI-Driven Plant Health Diagnostic App : Source code for a mobile app using AI to identify 38 plant diseases in crops like apples, tomatoes, and corn. Built with Flutter for both Android and more, it aims to enhance farming decisions and secure food supplies by applying cutting-edge AI in agriculture.

### LeafGuard App Demo Video

Below is video of the LeafGuard application in action, showcasing its user-friendly interface and powerful features designed to help identify plant diseases effectively.


https://github.com/user-attachments/assets/02d057b2-32c8-4f89-b32f-8a8817716d0e


### To run the application 

## Frontend ( flutter Application )

1. Open terminal and go to the application directory `cd leafguard`.
2. Then enter Command `flutter pub get` and then `flutter run`.
3. Connect your phone with debugging mode enabled to download and test the app in your mobile device .

## Backend ( Fast-API )

1. Open another terminal and go to the modelApi directory `cd modelApi`.
2. Then enter Command `pip install -r requirements.txt`.
3. Run the backend service enter the command in terminal `uvicorn predict:app --host 0.0.0.0 --port 80` and click enter to start the backend server.


## important note 

To run the application as wireless then follow these steps:

1. connect your laptop and mobile device in the same network.
2. In your laptop cmd terminal type `ipconfig` and copy the ipv4 url which looks like ( 192.xx.xx.xx ).
3. Then go the "*leafgaurd/lib/constants.dart*" file and past the ip then run the application.

NOTE : it will work only if both devices are connected in the same network and ip address will change based on the network.

### Dataset

The PlantVillage Dataset on Kaggle is an extensive collection of 54,306 images of healthy and diseased crop leaves across 38 classes, including various diseases affecting crops like Apple, Tomato, and Corn. It's designed for training machine learning models to detect and classify plant diseases effectively, helping to advance agricultural practices through AI. This dataset is essential for developers aiming to create tools that support farmers in early disease detection and management.

link: https://www.kaggle.com/datasets/abdallahalidev/plantvillage-dataset


### Project Folder Structure

LeafGuard Folder: Containes the flutter application folder

ModelApi Folder: Containes the api code using Flask

Notebook.ipynb: The Model's Notebook file
