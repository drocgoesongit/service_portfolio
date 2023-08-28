import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:service_portfolio/models/project_model.dart';
import 'package:service_portfolio/models/project_screen_model.dart';

class DownloadBackend {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ProjectScreenModel> getProjectScreenModel(
      String projectId, BuildContext context) async {
    try {
      showDialog(
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        context: context,
      );

      DocumentSnapshot snapshot =
          await _firestore.collection("projects").doc(projectId).get();
      Navigator.pop(context);

      if (snapshot.exists) {
        ProjectScreenModel projectModel = ProjectScreenModel.fromJson(
            snapshot.data() as Map<String, dynamic>);
        return ProjectScreenModel(
          title: projectModel.title,
          description: projectModel.description,
          image: projectModel.image,
          characteristics: projectModel.characteristics,
          projectImages: projectModel.projectImages,
        );
      } else {
        return ProjectScreenModel(
          title: "Error",
          description: "Error",
          image: "Error",
          characteristics: [],
          projectImages: [],
        );
      }
    } catch (e) {
      Navigator.pop(context);
      print("Error in download_backend.dart: $e");
      return ProjectScreenModel(
        title: "Error",
        description: "Error",
        image: "Error",
        characteristics: [],
        projectImages: [],
      );
    }
  }
}
