void main() {
  List<String> students1 = ["Mridul", "Sifat", "Tanvir", "Mehedi", "Pial"];
  bool isNewStudent = true;
  List<String> students2 = ["karim", if (isNewStudent) "Rahim"];
  List<String> allStudents = [...students1, ...students2];
  print("Students:");
  print(allStudents);
  print("\nCourses:");
  Set<String> courses = {"Flutter", "Dart", "Git"};
  print(courses);
  Map<String, dynamic> studentAge = {
    "MridUl": 23,
    "Sifat": 19,
    "Tanvir": 24,
    "Mehedi": 26,
    "Pial": 26,
    "Karim": 56,
    if (isNewStudent) "Rahim": 70,
  };
  print("\nStudent Ages:");
  for (var age in studentAge.entries) {
    String paddedName = age.key.padRight(12);
    print("$paddedName: ${age.value}");
  }
}
