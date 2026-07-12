import 'dart:io';

void main() {
  const appTitle = "\n----------Student Grader v1.0----------";
  final Set<String> availableSubj = {'Dart', 'Flutter', 'Git', 'OOP'};
  var studentNames = [];
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
        stdout.write("enter the student's name:");
        var studentName = stdin.readLineSync();
        Map<String, dynamic> studentDetails = {
          'name': studentName,
          'scores': <int>[],
          'subjects': {...availableSubj},
          'bonus': null,
          'comment': null,
        };
        studentNames.add(studentDetails);
        print("$studentName added successfully");
        break;
      case '2':
        //checking student availability.
        if (studentNames.isEmpty) {
          print("No student is avialable.Please add a student first");
          break;
        }
        //show student list
        for (int i = 0; i < studentNames.length; i++) {
          print("${i+1}.{$studentNames[i]['name']}");
        }
        //student selection.
        stdout.write('enter student number:');
        var studentInput = stdin.readLineSync() ?? '';
        int? studentChoice = int.tryParse(studentInput);
        //safety checking for student selection.
        if (studentChoice == null ||
            studentChoice < 1 ||
            studentChoice > studentNames.length) {
          print("Invalid student number!");
          break;
        }
        int selectIndex = studentChoice - 1;
        //showing subject list
        print("Available Subject: $availableSubj");
        //taking student score and validation.
        stdout.write('enter student score: ');
        var scoreInput = stdin.readLineSync() ?? '';
        int score = int.tryParse(scoreInput) ?? -1;

        while (score < 0 || score > 100) {
          print("Invalid Score! Please enter a secore between 0-100");
          stdout.write('enter student score: ');
          var scoreInput = stdin.readLineSync() ?? '';
          score = int.tryParse(scoreInput) ?? -1;
        }
        studentNames[selectIndex]['scores'].add(score);
        print(
          "✅ Score $score recorded for ${studentNames[selectIndex]['name']}.",
        );
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
      default:
        print("Invalid Input! Choose (1-8)");
    }
  } while (isRunning);
}
