import 'dart:io';

void main() {
  const appTitle = "\n----------Student Grader v1.0----------";
  final Set<String> availableSubj = {'Dart', 'Flutter', 'Git', 'OOP'};
  var studentNames = <String>[];
  var isRunning = true;
  do {
    print('''${appTitle}
    1. Add Student
    2. Record Score
    3. Add Bonus Points
    4. Add comment
    5. View All Student
    6. View report Card
    7. Class Summary
    8. Exit''');
    print('Choose your Option(1-8): ');
    var choose = stdin.readLineSync();

    switch (choose) {
      case '1':
        print("Enter the Student Name & Id: ");
        break;
      case '2':
        print("Enter Student Score: ");
        break;
      case '3':
        print("Enter bonus Point: ");
        break;
      case '4':
        print("Add Comment: ");
        break;
      case '5':
        print("View All Student");
        break;
      case '6':
        print("View report Card");
        break;
      case '7':
        print("Class Summary");
        break;
      case '8':
        print("Thank You");
        isRunning = false;
        break;
    }
  } while (isRunning);
}
