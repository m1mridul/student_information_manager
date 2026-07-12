/* import 'dart:io';

void main() {
  // --- DATA STORAGE (গ্লোবাল কালেকশন সমূহ) ---
  List<String> attendanceList = [];               // উপস্থিত স্টুডেন্টদের নামের লিস্ট
  Set<String> subjects = {"Dart", "Flutter"};     // ইউনিক সাবজেক্টের সেট (No Duplicate)
  Map<String, double> studentGrades = {};        // স্টুডেন্টের নাম (Key) : গ্রেড (Value)

  // --- MAIN PROGRAM LOOP (ইনফিনিট লুপ যাতে প্রোগ্রাম বন্ধ না হয়) ---
  while (true) {
    print('\n========================================');
    print('       STUDENT MANAGEMENT SYSTEM        ');
    print('========================================');
    print('1. Mark Attendance ');
    print('2. Add/Update Grade');
    print('3. View Full Report');
    print('4. Exit');
    stdout.write('Choose an option (1-4): ');
    
    // ইউজারের চয়েস ইনপুট নেওয়া
    String? choice = stdin.readLineSync();

    // --- OPTION 1: ATTENDANCE ---
    if (choice == '1') {
      print('\nEnter student name for attendance:');
      String? name = stdin.readLineSync();
      
      if (name != null && name.isNotEmpty) {
        // [Keyword: contains] অলরেডি প্রেজেন্ট থাকলে দ্বিতীয়বার অ্যাড হবে না
        if (attendanceList.contains(name)) {
          print('👉 $name is already marked as Present!');
        } else {
          attendanceList.add(name); // লিস্টে নাম যোগ
          print('✅ $name marked as Present.');
        }
      } else {
        print('❌ Invalid Name!');
      }

    // --- OPTION 2: GRADE INPUT ---
    } else if (choice == '2') {
      print('\nEnter student name:');
      String? name = stdin.readLineSync();
      
      print('Enter grade/marks:');
      String? gradeInput = stdin.readLineSync();
      
      if (name != null && name.isNotEmpty && gradeInput != null) {
        // [Keyword: tryParse] স্ট্রিং ইনপুটকে double-এ কনভার্ট করার সেফ উপায়
        double? grade = double.tryParse(gradeInput); 
        
        if (grade != null) {
          studentGrades[name] = grade; // ম্যাপে ডেটা অ্যাসাইন/আপডেট
          print('⭐ Grade $grade added for $name.');
        } else {
          print('❌ Please enter a valid number for grade!');
        }
      } else {
        print('❌ Name or Grade cannot be empty!');
      }

    // --- OPTION 3: GENERATE REPORT ---
    } else if (choice == '3') {
      // যদি ম্যাপ এবং লিস্ট দুটোই খালি থাকে
      if (studentGrades.isEmpty && attendanceList.isEmpty) {
        print('\n⚠️ No data available yet! Please add attendance or grades first.');
        continue; // লুপের শুরুতে ফেরত যাবে
      }

      print('\n====================== STUDENT REPORT ======================');
      print('Available Subjects: $subjects'); // সেটের ডাটা প্রিন্ট
      print('------------------------------------------------------------');
      // [Keyword: padRight] কলামগুলো সোজা লাইনে রাখার ট্রিক
      print('Student Name'.padRight(15) + ' | Attendance status '.padRight(20) + ' | Grade');
      print('------------------------------------------------------------');
      
      // [Keyword: Set.from] লিস্ট ও ম্যাপের সব ইউনিক নাম একসাথে করার জন্য temporary সেট
      Set<String> allUniqueStudents = Set.from(studentGrades.keys)..addAll(attendanceList);

      // সব স্টুডেন্টের ওপর লুপ চালিয়ে ডাটা ম্যাচিং
      for (var name in allUniqueStudents) {
        // লিস্টে নাম থাকলে Present, না থাকলে Absent
        String status = attendanceList.contains(name) ? '🔴 Present' : '⚪ Absent';
        
        // ম্যাপে গ্রেড থাকলে সেটা দেখাবে, না থাকলে N/A দেখাবে
        String gradeStr = studentGrades.containsKey(name) ? studentGrades[name].toString() : 'N/A';
        
        // ফাইনাল প্রিন্ট উইথ অ্যালাইনমেন্ট
        print(name.padRight(15) + ' | ' + status.padRight(20) + ' | $gradeStr');
      }
      print('============================================================');

    // --- OPTION 4: EXIT ---
    } else if (choice == '4') {
      print('\n👋 Exiting program. Thank you for using!');
      break; // [Keyword: break] লুপ ভেঙে প্রোগ্রাম বন্ধ করবে
      
    } else {
      print('❌ Invalid choice! Please enter a number between 1 and 4.');
    }
  }
} */
import 'dart:io';

const String appTitle = "Student Grader v1.0";
final Set<String> availableSubjects = {"Math", "English", "Science"};

void main() {
  var students = <Map<String, dynamic>>[];
  var running = true;

  do {
    print("\n===== $appTitle =====");
    print(
      "1. Add Student\n2. Record Score\n3. Add Bonus Points\n4. Add Comment\n5. View All Students\n6. View Report Card\n7. Class Summary\n8. Exit",
    );
    stdout.write("Choose an option: ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1': // Add Student
        stdout.write("Enter student name: ");
        var name = stdin.readLineSync() ?? "Unknown";
        students.add({
          "name": name,
          "scores": <int>[],
          "subjects": {...availableSubjects}, // Spread operator
          "bonus": null,
          "comment": null,
        });
        print("Student $name added.");
        break;

      case '2': // Record Score
        if (students.isEmpty) {
          print("No students found.");
          break;
        }

        // 1. Select Student
        for (int i = 0; i < students.length; i++)
          print("${i}. ${students[i]['name']}");
        stdout.write("Select student index: ");
        int studentIdx = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

        if (studentIdx < 0 || studentIdx >= students.length) {
          print("Invalid student index.");
          break;
        }

        // 2. Select Subject
        var subjectsList = students[studentIdx]['subjects'].toList();
        print("Available subjects: ");
        for (int i = 0; i < subjectsList.length; i++) {
          print("${i}. ${subjectsList[i]}");
        }
        stdout.write("Select subject index: ");
        int subIdx = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

        if (subIdx < 0 || subIdx >= subjectsList.length) {
          print("Invalid subject index.");
          break;
        }

        // 3. Get Score
        int? score;
        while (score == null || score < 0 || score > 100) {
          stdout.write("Enter score for ${subjectsList[subIdx]} (0-100): ");
          score = int.tryParse(stdin.readLineSync() ?? "");
        }

        // Add to scores list
        (students[studentIdx]['scores'] as List<int>).add(score);
        print("Score recorded for ${subjectsList[subIdx]}.");
        break;

      case '3': // Add Bonus
        stdout.write("Enter student index: ");
        int idx = int.tryParse(stdin.readLineSync() ?? "")!;
        //  stdout.write("Enter bonus (1-10): ");
        //  int bonusValue = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
        int? bonusValue;
        while (bonusValue == null || bonusValue < 1 || bonusValue > 10) {
          stdout.write("Enter bonus (1-10): ");
          bonusValue = int.tryParse(stdin.readLineSync() ?? "");
        }

        var student = students[idx];
        if (student["bonus"] == null) {
          student["bonus"] ??= bonusValue; // ??= assignment
        } else {
          print("Bonus already set: ${student["bonus"]}");
        }
        break;

      case '4': // Add Comment
        stdout.write("Enter student index: ");
        int idx = int.tryParse(stdin.readLineSync() ?? "")!;
        stdout.write("Enter comment: ");
        students[idx]["comment"] = stdin.readLineSync();
        break;

      case '5': // View All
        for (var s in students) {
          var tags = [
            s["name"],
            "${(s["scores"] as List).length} scores",
            if (s["bonus"] != null) "⭐ Bonus", // Collection if
          ];
          print(tags.join(" | "));
        }
        break;

      case '6': // View Report Card
        stdout.write("Enter index: ");
        int idx = int.tryParse(stdin.readLineSync() ?? "")!;
        var s = students[idx];
        var scores = s["scores"] as List<int>;

        // Calculate average
        double avg = scores.isEmpty
            ? 0
            : scores.reduce((a, b) => a + b) / scores.length;

        // Add bonus safely (?? 0 treats null as 0), then clamp between 0 and 100
        double finalAvg = (avg + (s["bonus"] ?? 0)).clamp(0, 100);

        // Calculate grade
        String grade = finalAvg >= 90
            ? "A"
            : finalAvg >= 80
            ? "B"
            : finalAvg >= 70
            ? "C"
            : finalAvg >= 60
            ? "D"
            : "F";

        // Safely access comment
        String comment =
            (s["comment"] as String?)?.toUpperCase() ?? "No comment provided";

        print("""
╔═════════════════════════════════════════════╗
║              REPORT CARD                    ║
╠═════════════════════════════════════════════╝
║ Name: ${s["name"]}                                 ║
║ Scores: $scores                        ║
║ Bonus: +${s["bonus"] ?? 0}                                   ║
║ Average: ${finalAvg.toStringAsFixed(1)}                               ║
║ Grade: $grade                                    ║
║ Comment: $comment                          ║
╚═════════════════════════════════════════════╝""");
        break;

      case '7': // Class Summary
        var summaryLines = [
          for (var s in students)
            "${s["name"]}: ${(s["scores"] as List).length} scores", // Collection for
        ];
        print(summaryLines);
        break;

      case '8':
        running = false;
        break;
    }
  } while (running);
}
