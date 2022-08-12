class MyCart{
  int? id;
  String? email;
  int? idPlant;
  int? number;
  MyCart({this.id,required this.email, required this.idPlant,required this.number});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'email': email,
      'idPlant': idPlant,
      'number': number,
    };
    return map;
  }

  MyCart.fromMap(Map<String, dynamic> map) {
    id= map["id"];
    email = map["email"];
    idPlant = map["idPlant"];
    number = map["number"];
  }

  Map<String, Object> toJson() => {
    'plant':{
      'plantID': idPlant,
      'number': number,
    }
  };
}
