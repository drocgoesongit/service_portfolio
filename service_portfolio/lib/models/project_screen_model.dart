import 'package:service_portfolio/models/service_characteristic_model.dart';

class ProjectScreenModel {
  final String title;
  final String description;
  final String image;
  final List<ServiceCharacteristicModel> characteristics;
  final List<String> projectImages;

  ProjectScreenModel(
      {required this.title,
      required this.description,
      required this.image,
      required this.characteristics,
      required this.projectImages});

  factory ProjectScreenModel.fromJson(Map<String, dynamic> json) {
    List<ServiceCharacteristicModel> characteristics = [];
    List<String> projectImages = [];
    json["characteristics"].forEach((element) {
      characteristics.add(ServiceCharacteristicModel.fromJson(element));
    });
    json["projectImages"].forEach((element) {
      projectImages.add(element);
    });
    return ProjectScreenModel(
        title: json["title"],
        description: json["description"],
        image: json["image"],
        characteristics: characteristics,
        projectImages: projectImages);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> characteristics = [];
    List<String> projectImages = [];
    this.characteristics.forEach((element) {
      characteristics.add(element.toJson());
    });
    this.projectImages.forEach((element) {
      projectImages.add(element);
    });
    return {
      "title": this.title,
      "description": this.description,
      "image": this.image,
      "characteristics": characteristics,
      "projectImages": projectImages
    };
  }
}
