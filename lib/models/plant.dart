class Plant {
  int id;
  String name;
  String title;
  String des;
  String image;
  String label;
  num price;
  Info info;
  Plant ({required this.id, required this.name,
    required this.title,required this.des,
    required this.image,required this.label,
    required this.price,required this.info});
}
class Info{
  // small, medium, big,
  String size;
  int hum;
  String light;
  // 12-24 C
  String temp;
  Info({required this.size,required this.hum,required this.light,required this.temp});
}
