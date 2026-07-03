import 'dart:io';

abstract class Person {
  String name;
  int age;

  Person(this.name, this.age);

  String getDetails();
}

class Student extends Person {
  String _id;
  String _dept;

  Student(this._id, String name, int age, this._dept) : super(name, age);

  String get id => _id;

  @override
  String getDetails() {
    return "ID: $_id | Name: $name | Age: $age | Dept: $_dept";
  }
}

class StudentManager {
  List<Student> students = [];

  void start() => showMenu();

  void showMenu() {
    print("\n===== Student Information Manager =====");
    print("1. Add Student");
    print("2. View Students");
    print("3. Search Student");
    print("4. Delete Student");
    print("5. Exit");
    stdout.write("\nChoose an option: ");
    
    String? choice = stdin.readLineSync();

    switch (choice?.trim()) {
      case '1': addStudent(); break;
      case '2': viewStudents(); break;
      case '3': searchStudent(); break;
      case '4': deleteStudent(); break;
      case '5': 
        print("Exiting... Stay safe and get well soon!");
        exit(0);
      default:
        print("Invalid choice. Try again.");
        showMenu();
    }
  }

  void addStudent() {
    stdout.write("Enter ID: ");
    String id = stdin.readLineSync() ?? "";
    
    stdout.write("Enter Name: ");
    String name = stdin.readLineSync() ?? "";
    
    stdout.write("Enter Age: ");
    int age = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
    
    stdout.write("Enter Department: ");
    String dept = stdin.readLineSync() ?? "";

    students.add(Student(id, name, age, dept));
    print("Student added successfully!");
    showMenu();
  }

  void viewStudents() {
    if (students.isEmpty) {
      print("No students found.");
    } else {
      print("\n--- Student List ---");
      students.forEach((student) {
        print(student.getDetails());
      });
    }
    showMenu();
  }

  void searchStudent() {
    stdout.write("Enter Student ID to search: ");
    String id = stdin.readLineSync() ?? "";
    
    try {
      Student student = students.firstWhere((s) => s.id == id);
      print("\nStudent Found:\n${student.getDetails()}");
    } catch (e) {
      print("Student not found.");
    }
    showMenu();
  }

  void deleteStudent() {
    stdout.write("Enter Student ID to delete: ");
    String id = stdin.readLineSync() ?? "";
    
    int initialLength = students.length;
    students.removeWhere((s) => s.id == id);

    if (students.length < initialLength) {
      print("Student deleted successfully.");
    } else {
      print("Student ID not found.");
    }
    showMenu();
  }
}

void main() {
  StudentManager app = StudentManager();
  app.start();
}