import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mylearning/UserComponents/UserCameraPage/resultScanning.dart';
import 'package:mylearning/UserComponents/UserHomeBottomTaps/userMainBottomTaps.dart';
import 'package:mylearning/UserComponents/UserNotificationsPage/userNotificationsPage.dart';
import 'package:camera_android/camera_android.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';


class MyCameraScreen extends StatefulWidget {
  const MyCameraScreen({super.key});

  @override
  State<MyCameraScreen> createState() => _MyCameraScreenState();
}

class _MyCameraScreenState extends State<MyCameraScreen> {
  bool textScanning = false;

  XFile? imageFile;

  String scannedText = "";
  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }
    textScanning = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pushAndRemoveUntil(
                    context,
                    //!Home Taps
                    MaterialPageRoute(builder: (_) => UserMyBottomTabs()),
                    (Route<dynamic> route) => false);
              });
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Camera Page',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black, size: 30),
              onPressed: () {
                setState(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      //!Home Taps
                      MaterialPageRoute(builder: (_) => MyNotifications()),
                      (Route<dynamic> route) => false);
                });
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              // margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (textScanning) const CircularProgressIndicator(),
                  if (!textScanning && imageFile == null)
                    Container(
                      width: double.infinity,
                      height: 450,
                      color: Color.fromARGB(255, 228, 227, 227),
                    ),
                  if (imageFile != null) Image.file(File(imageFile!.path)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.grey,
                            shadowColor: Colors.grey[400],
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.image_outlined,
                                    size: 30, color: Colors.blue),
                                Text(
                                  "From Gallery",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:20.0),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.grey,
                            shadowColor: Colors.grey[400],
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            getImage(ImageSource.camera);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.camera_alt,
                                    size: 30, color: Colors.blue),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.blue),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      scannedText,
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

/*
class MyCameraScreen extends StatefulWidget {
  const MyCameraScreen({super.key});

  @override
  State<MyCameraScreen> createState() => _MyCameraScreenState();
}

class _MyCameraScreenState extends State<MyCameraScreen>
    with WidgetsBindingObserver {
  bool _isPermissionGenerated = false;

  late Future<void> _future;
  CameraController? _cameraConroller;

  final _textRecognition = TextRecognizer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _future = _requestCameraPermission();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    _stopCamera();
    _textRecognition.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appstate) {
    if (_cameraConroller == null || _cameraConroller!.value.isInitialized) {
      return;
    }

    if (appstate == AppLifecycleState.inactive) {
      _stopCamera();
    } else if (appstate == AppLifecycleState.resumed &&
        _cameraConroller != null &&
        _cameraConroller!.value.isInitialized) {
      _startCamera();
    }
  }

  Future<void> _requestCameraPermission() async {
    final cameraStatus = await Permission.camera.request();
    // _isPermissionGenerated = cameraStatus = PermissionStatus.granted;
  }

  void _initiCameraController(List<CameraDescription> cameras) {
    if (_cameraConroller != null) {
      return;
    }
    CameraDescription? camera;
    for (var i = 0; i < cameras.length; i++) {
      final CameraDescription current = cameras[i];
      if (current.lensDirection == CameraLensDirection.back) {
        camera = current;
        break;
      }
    }
    if (camera != null) {
      _cameraSelected(camera);
    }
  }

  void _startCamera() {
    if (_cameraConroller != null) {
      _cameraSelected(_cameraConroller!.description);
    }
  }

  void _stopCamera() {
    if (_cameraConroller != null) {
      _cameraConroller?.dispose();
    }
  }

  Future<void> _cameraSelected(CameraDescription camera) async {
    _cameraConroller = CameraController(
      camera,
      ResolutionPreset.max,
      enableAudio: false,
    );

    await _cameraConroller?.initialize();

    if (!mounted) {
      return;
    }

    setState(() {});
  }

  Future<void> _scannImage() async {
    if (_cameraConroller == null) return;

    final navigator = Navigator.of(context);

    try {
      final _pictureFile = await _cameraConroller!.takePicture();

      final file = File(_pictureFile.path);

      final inputImage = InputImage.fromFile(file);

      final _recognixedText = await _textRecognition.processImage(inputImage);

      await navigator.push(
        MaterialPageRoute(builder: (context)=>ResultScann())
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("The Error occured with scanning text")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        return Stack(
          children: [
            if (_isPermissionGenerated)
              FutureBuilder<List<CameraDescription>>(
                future: availableCameras(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _initiCameraController(snapshot.data!);

                    return Center(
                      child: CameraPreview(_cameraConroller!),
                    );
                  } else {
                    return const LinearProgressIndicator();
                  }
                },
              ),
            Scaffold(
              backgroundColor:
                  _isPermissionGenerated ? Colors.transparent : null,
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          //!Home Taps
                          MaterialPageRoute(builder: (_) => UserMyBottomTabs()),
                          (Route<dynamic> route) => false);
                    });
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text(
                  'Camera Page',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications,
                        color: Colors.black, size: 30),
                    onPressed: () {
                      setState(() {
                        Navigator.pushAndRemoveUntil(
                            context,
                            //!Home Taps
                            MaterialPageRoute(
                                builder: (_) => MyNotifications()),
                            (Route<dynamic> route) => false);
                      });
                    },
                  ),
                ],
              ),
             
              body: _isPermissionGenerated
                  ? Column(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: const Center(
                              child: ElevatedButton(
                                  onPressed: null, child: Text("Scen Text"))),
                        ),
                      ],
                    )
                  : Center(
                      child: Container(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: Text(
                          "Camera permissiom denied",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
*/


