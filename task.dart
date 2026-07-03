/* int add(int a,int b) => a+b;
void main(){
  print(add(2, 3));
} */
/* void main() {
  List<String> names = ['Mridul', 'tanvir', 'mehedi', 'Mridul'];
  print(names);
  names.addAll(['pial', 'ashik']);
  names.insert(2, 'sifat');
  print(names);
  while (names.contains('Mridul')) {
    names.remove("Mridul");
  }
  print(names);
} */
void main() {
  Map<String, dynamic> users = {
    'name': 'Mridul',
    'age': 23,
    'status': 'single',
    'contact':{'home': '01774886482','office':'01710593025'}
  };
  //print("${users.keys} : ${users.values}");
  print(users['contact']['home']);
}
