class customer {
  String name;
  double balance;
  bool hasNID;
  bool hasPassport;
  customer({required this.name, required this.balance, required this.hasNID})
    : hasPassport = false;
  customer.foreigner({required this.name, required this.balance})
    : hasNID = false,
      hasPassport = true;


  void deposit(double amount){
    print("Depositing $amount");
  }
}

void main(){
  var deshi = customer(name: "m", balance: 1000000, hasNID: true);
  deshi.deposit(100000);
  var foreigner = customer.foreigner(name: "n", balance: 100);
  foreigner.deposit(100);
}
