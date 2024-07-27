import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:pocket_money/src/presentation/screens/form/form_page1.dart';
import 'package:pocket_money/src/presentation/screens/form/form_page2.dart';
import 'package:pocket_money/src/presentation/screens/form/form_page3.dart';

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({super.key});

  @override
  State<MultiStepForm> createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  File? _profileImage;
  String? _locationDetails;

  final List<String> _titles = [
    'Basic Details',
    'Location Details',
    'Location Details',
    'Education Details',
    'Skills',
    'Preffered Language',
    'Preffered Job Type',
    'Preffered Job Role',
  ];

  final ImagePicker _picker = ImagePicker();

  void _nextPage() {
    if (_currentPage < 7) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    if (kIsWeb) {
      // Use a placeholder for web testing
      setState(() {
        _locationDetails =
            'Placeholder, Placeholder, Placeholder';
        _nextPage(); // Navigate to the next page after setting placeholder
      });
    } else {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _locationDetails =
              '${place.subAdministrativeArea},${place.locality},${place.administrativeArea}';
          _nextPage(); // Navigate to the next page after getting the location details
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(_titles[_currentPage]),
        leading: _currentPage > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _previousPage,
              )
            : null,
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentPage + 1) / 8,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: List.generate(8, (index) {
                switch (index) {
                  case 0:
                    return Page1(
                      profileImage: _profileImage,
                      onImagePicked: _pickImage,
                    );
                  case 1:
                    return Page2(
                      onGetLocation: _getCurrentLocation,
                    );
                  case 2:
                    return Page3(
                      locationDetails: _locationDetails,
                    );
                  // Placeholder widgets for the remaining steps
                  default:
                    return PlaceholderStep(step: index + 1);
                }
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _currentPage < 7
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300],
                      fixedSize:
                          Size(MediaQuery.of(context).size.width / 1.1, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed:
                        _currentPage == 1 ? _getCurrentLocation : _nextPage,
                    child: Text(
                      _currentPage == 1 ? 'Pick Current Location' : 'Next',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300],
                      fixedSize:
                          Size(MediaQuery.of(context).size.width / 1.1, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Handle form submission
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
class PlaceholderStep extends StatelessWidget {
  final int step;

  const PlaceholderStep({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Step $step: Placeholder Content'),
    );
  }
}
