class TaskModel {
  late final String title;
  late final String description;
  final String timeofCreation;
  late final bool status;

  TaskModel({
    required this.title, 
    required this.description,
    required this.timeofCreation, 
   this.status = false});
}