import 'dart:io';

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
}