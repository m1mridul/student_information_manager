// void main(){
//   greet(age :20,name: 'm');
// }
// void greet({required int age,required String name}){
//   print("hello $name your age is $age");
  
// }
void main(){
  greet(name: "Mridul",messagecount: 20);

}
void greet({int? messagecount ,String? name}){
  print("Hello $name your message count is $messagecount");
}