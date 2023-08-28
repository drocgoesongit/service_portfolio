import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:service_portfolio/models/project_screen_model.dart';

import '../models/service_characteristic_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

class ProjectUploadPage extends StatefulWidget {
  @override
  _ProjectUploadPageState createState() => _ProjectUploadPageState();
}

class _ProjectUploadPageState extends State<ProjectUploadPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imagePathController = TextEditingController();
  String title = '';
  String description = '';
  String image = '';
  String characteristicTitle = '';
  String characteristicDescription = '';
  String characteristicImagePath = '';
  List<ServiceCharacteristicModel> characteristics = [];
  List<File> projectImagesFiles = [];
  List<String> projectImages = [];

  void _addCharacteristic() {
    // Create a new ServiceCharacteristicModel object with the entered values
    ServiceCharacteristicModel characteristic = ServiceCharacteristicModel(
      title: titleController.text,
      description: descriptionController.text,
      imagePath: imagePathController.text,
    );

    // Add the characteristic to the characteristics list
    setState(() {
      characteristics.add(characteristic);
      characteristicDescription = '';
      characteristicImagePath = '';
      characteristicTitle = '';
    });

    // Clear the text fields for the next input
    titleController.clear();
    descriptionController.clear();
    imagePathController.clear();
  }

  void _addImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      setState(() {
        projectImagesFiles.addAll(files);
      });
    }
  }

  void _uploadImages() async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    for (int i = 0; i < projectImages.length; i++) {
      File image = projectImagesFiles[i];
      String imageName = 'image_$i.jpg';

      firebase_storage.Reference ref =
          storage.ref().child(titleController.text).child(imageName);
      await ref.putFile(image);
      String imageUrl = await ref.getDownloadURL();
      projectImages.add(imageUrl);
      // Use the imageUrl as needed (e.g., upload to Firestore or display in UI)
    }
  }

  void uploadProjectDetails() {
    ProjectScreenModel project = ProjectScreenModel(
      title: title,
      description: description,
      image: image,
      characteristics: characteristics,
      projectImages: projectImages,
    );
    FirebaseFirestore.instance
        .collection("projects")
        .doc("id")
        .set(project.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Upload'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    image = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Image',
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Characteristics:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: titleController,
                onChanged: (value) {
                  setState(() {
                    characteristicTitle = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Charactersitic Title',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: descriptionController,
                onChanged: (value) {
                  setState(() {
                    characteristicDescription = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Charactersitic description',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: imagePathController,
                onChanged: (value) {
                  setState(() {
                    characteristicImagePath = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Charactersitic image',
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: _addCharacteristic,
                child: Text('Add Characteristic'),
              ),
              // Add code to handle characteristics input (e.g., ListView.builder)
              const SizedBox(height: 16.0),
              const Text(
                'Project Images:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: _addImages,
                child: Text('Add Images'),
              ),
              // Add code to handle project images input (e.g., ListView.builder)
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
