// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Obtain a list of the available cameras
//   final cameras = await availableCameras();

//   // Select the first camera in the list
//   final camera = cameras.first;

//   runApp(MyApp(camera: camera));
// }

// class MyApp extends StatelessWidget {
//   final CameraDescription camera;

//   const MyApp({Key? key, required this.camera}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Target Scanner',
//       home: HomePage(camera: camera),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   final CameraDescription camera;

//   const HomePage({Key? key, required this.camera}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late CameraController _cameraController;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();

//     // Create a CameraController
//     _cameraController = CameraController(
//       widget.camera,
//       ResolutionPreset.high,
//     );

//     // Initialize the CameraController
//     _initializeControllerFuture = _cameraController.initialize();
//   }

//   @override
//   void dispose() {
//     // Dispose of the CameraController when the widget is disposed
//     _cameraController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Target Scanner')),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the CameraController has been initialized, start the preview
//             _cameraController.startImageStream(_processCameraImage);

//             // Return the camera preview
//             return CameraPreview(_cameraController);
//           } else {
//             // Otherwise, show a loading indicator
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }

//   void _processCameraImage(CameraImage cameraImage) async {
//     // Convert the camera image to a Google ML Kit input image
//     final inputImage = InputImage.fromCameraImage(
//       cameraImage,
//       imageRotation: widget.camera.sensorOrientation,
//     );

//     // Create a detector to detect targets
//     final detector = GoogleMlKit.vision.objectDetector();

//     try {
//       // Detect the targets in the input image
//       final targets = await detector.detectInImage(inputImage);

//       // Count the number of targets
//       final targetCount = targets.length;

//       // Update the UI with the target count
//       setState(() {
//         // TODO: Update the UI with the target count
//       });
//     } catch (e) {
//       // Handle any errors that occur during target detection
//       print(e);
//     }
//   }
