class ProjectModel {
  final String name;
  final String description;
  final String imagePath;
  final List<String> images;
  final List<String> technologiesImagesList;

  ProjectModel(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.images,
      required this.technologiesImagesList});
}
