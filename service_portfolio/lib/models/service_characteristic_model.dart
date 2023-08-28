class ServiceCharacteristicModel {
  final String title;
  final String description;
  final String imagePath;

  ServiceCharacteristicModel(
      {required this.title,
      required this.description,
      required this.imagePath});

  factory ServiceCharacteristicModel.fromJson(Map<String, dynamic> json) {
    return ServiceCharacteristicModel(
        title: json["title"],
        description: json["description"],
        imagePath: json["imagePath"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "description": this.description,
      "imagePath": this.imagePath
    };
  }
}
