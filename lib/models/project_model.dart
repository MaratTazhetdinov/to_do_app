class Project {
  int? projectID;
  final String projectTitle;
  final int projectColor;
  int? projectCount;

  Project(
      {this.projectID,
      required this.projectTitle,
      required this.projectColor,
      this.projectCount});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
        projectID: json['projectID'],
        projectTitle: json['projectTitle'],
        projectColor: json['projectColor'],
        projectCount: json['projectCount'] ?? 0);
  }

  Map<String, dynamic> toJson() =>
      {'projectTitle': projectTitle, 'projectColor': projectColor};
}
