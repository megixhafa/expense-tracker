class Amount {
  int id;
  String name;
  String date;
  String amount;

  Amount({
    required this.id,
    required this.date,
    required this.name,
    required this.amount
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    return map;
  }

 // Amount.fromMap(Map<String, dynamic> map){

 // }
}


//class
//Date = DateFormat("dd-MM-yyyy").format(DateTime.parse(res["Date"].toString()));