import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class ImageUploadUi extends StatefulWidget {
  const ImageUploadUi({super.key});

  @override
  State<ImageUploadUi> createState() => _ImageUploadUiState();
}

class _ImageUploadUiState extends State<ImageUploadUi> {
  String name = "";
  Uint8List? image;
  String url = "";
  String status = "";

  Future<void> uploadNameWithImage() async {
    Reference ref =
        FirebaseStorage.instance.ref().child('product_images/$name');
    final metadata = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask = ref.putData(image!, metadata);
    TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await storageSnapshot.ref.getDownloadURL();
    log("got image url: $downloadUrl");

    setState(() {
      url = downloadUrl;
      status = "got download url";
    });

    FirebaseFirestore.instance
        .collection("productImages")
        .doc(name)
        .set({"name": name, "image": downloadUrl}, SetOptions(merge: true));

    setState(() {
      status = "uploaded";
    });
  }

  void _uploadImage() async {
    Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();

    if (bytesFromPicker!.isNotEmpty) {
      setState(() {
        image = bytesFromPicker;
        print("image: $image");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("upload status:"),
              const SizedBox(height: 20),
              Text("status: $status"),
              const SizedBox(height: 20),
              Text("name: $name"),
              const SizedBox(height: 20),
              Text("url: $url"),
              const SizedBox(height: 50),
              const Text("Add image:"),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                      onPressed: () {
                        _uploadImage();
                        setState(() {
                          status = "started";
                        });
                      },
                      child: const Text("Get photo")),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Image name",
                  hintText: "Enter image name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print(name);
                  uploadNameWithImage();
                },
                child: const Text("Upload"),
              ),
            ]),
      ),
    );
    ;
  }
}
