void main(){
  /*String studentName = "Rahim";
  int marks =75;
  if(marks>= 80 && marks<=100){
    print("A");
  }
  else if(marks>=70 && marks<80){
    print("B");
  }
  else if(marks>=60 && marks<70){
    print("C");
  }
  else{
    print("F");
  }*/

// 1st Question
 String studentName = "Mridul";
 int score = 75;
//2nd Question
print("Output of Question 1");
if (score >= 80 && score<=100) {
  print("Grade: A");
}
else if (score >= 70) {
  print("Grade: B");
}
else if (score >= 60) {
  print("Grade: C");
}
else {
  print("Grade: F");
}
print("\nOutput of Question 3");
print("Student Report\n"); 
  print("Name: $studentName");
  print("Marks: $score");

  switch (score) {
    case >= 80:
      print("Grade: A");
      print("\nExcellent");
    case >= 70:
      print("Grade: B");
      print("\nGood Job");
    case >= 60:
      print("Grade: C");
      print("\nSatisfactory");
    default:
      print("Grade: F");
      print("\nNeeds improvement");
  }
}