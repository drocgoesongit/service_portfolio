import 'package:service_portfolio/models/project_model.dart';
import 'package:service_portfolio/models/service_characteristic_model.dart';

class ServiceInformationModel {
  final String name;
  final String description;
  final String imagePath;
  final List<ProjectModel> projects;
  final List<ServiceCharacteristicModel> characteristics;

  ServiceInformationModel(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.projects,
      required this.characteristics});
}
