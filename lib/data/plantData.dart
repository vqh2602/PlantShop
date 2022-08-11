import 'package:getx_firebase/models/plant.dart';

List<Plant> lstPlant = [
  Plant(id: 0, name: 'Cây Vạn Lộc',
      title: 'Cây Vạn Lộc là cây dễ trồng và chăm sóc có vẻ ngoài sang trọng, bắt mắt với màu sắc ấn tượng',
      des: 'Cây Vạn Lộc là cây dễ trồng và chăm sóc có vẻ ngoài sang trọng, bắt mắt với màu sắc ấn tượng, vừa có thể trồng trong nhà, lại có thể đặt ở phòng làm việc giúp mang lại may mắn, phú quý cho gia chủ do đó cây vạn lộc được rất nhiều người tìm kiếm.',
      image: 'assets/images/1a.png', label: 'Outdoors',price: 50.34,
      info: Info(size: 'Small',hum: 34,light: 'Diffuse',temp: '12-34 C')),
  Plant(id: 1, name: 'Cây Lưỡi Hổ',
      title: 'Cây lưỡi hổ là cây phong thủy có hình dáng và màu sắc lá khá lạ ',
      des: 'Cây lưỡi hổ là cây phong thủy có hình dáng và màu sắc lá khá lạ , thường được dùng trồng viền hoặc trồng bụi trong sân vườn, công viên, nhà máy, trường học… Cây lưỡi hổ cũng có thể trồng trong chậu đứng trang trí cho nội thất cho nhà ở, văn phòng, xung quanh công ty.',
      image: 'assets/images/2a.png', label: 'Outdoors',price: 20.3,
      info: Info(size: 'Small',hum: 34,light: 'Diffuse',temp: '12-34 C')),
  Plant(id: 2, name: 'Cây Kim Tiền',
      title: 'Cây kim tiền hay kim phát tài là loại cây phong thủy màn đến nhiều may mắn cho gia chủ',
      des: 'Cây kim tiền hay kim phát tài là loại cây phong thủy màn đến nhiều may mắn cho gia chủ. Cây có nhiều kiểu dáng và mẫu mã khác nhau mang đến cho khách hàng nhiều sự lựa chọn hơn.',
      image: 'assets/images/3a.png', label: 'Outdoors',price: 14.67,
      info: Info(size: 'Small',hum: 34,light: 'Diffuse',temp: '12-34 C')),
  Plant(id: 3, name: 'Cây Monstera',
      title: 'Cây Monstera Mini Rhaphidophora Tetrasperma là loại cây kiểng lá thường được trồng trong chậu để bàn',
      des: 'Cây Monstera Mini Rhaphidophora Tetrasperma là loại cây kiểng lá thường được trồng trong chậu để bàn hoặc trồng chậu đứng để trang trí nội thất văn phòng, nhà hàng, khách sạn… Chúng được nhiều người yêu thích bởi hình dáng của lá rất đặc biệt luôn thu hút mọi ánh nhìn.',
      image: 'assets/images/4a.png', label: 'Outdoors',price: 77.75,
      info: Info(size: 'Small',hum: 34,light: 'Diffuse',temp: '12-34 C')),
  Plant(id: 4, name: 'Cây Vạn Lộc',
      title: 'Cây Vạn Lộc là cây dễ trồng và chăm sóc có vẻ ngoài sang trọng, bắt mắt với màu sắc ấn tượng',
      des: 'Cây Vạn Lộc là cây dễ trồng và chăm sóc có vẻ ngoài sang trọng, bắt mắt với màu sắc ấn tượng, vừa có thể trồng trong nhà, lại có thể đặt ở phòng làm việc giúp mang lại may mắn, phú quý cho gia chủ do đó cây vạn lộc được rất nhiều người tìm kiếm.',
      image: 'assets/images/5a.png', label: 'Outdoors',price: 45.34,
      info: Info(size: 'Small',hum: 34,light: 'Diffuse',temp: '12-34 C')),

  Plant(id: 5, name: 'Cây Vạn Lộc',
      title: 'Cây Vạn Lộc là cây dễ trồng và chăm sóc có vẻ ngoài sang trọng, bắt mắt với màu sắc ấn tượng',
      des: 'Cây Vạn Lộc là cây dễ trồng và chăm sóc có vẻ ngoài sang trọng, bắt mắt với màu sắc ấn tượng, vừa có thể trồng trong nhà, lại có thể đặt ở phòng làm việc giúp mang lại may mắn, phú quý cho gia chủ do đó cây vạn lộc được rất nhiều người tìm kiếm.',
      image: 'assets/images/1.png', label: 'Indoors',price: 50.34,
      info: Info(size: 'Big',hum: 34,light: 'Diffuse',temp: '12-34 C')),
  Plant(id: 6, name: 'Cây Lưỡi Hổ',
      title: 'Cây lưỡi hổ là cây phong thủy có hình dáng và màu sắc lá khá lạ ',
      des: 'Cây lưỡi hổ là cây phong thủy có hình dáng và màu sắc lá khá lạ , thường được dùng trồng viền hoặc trồng bụi trong sân vườn, công viên, nhà máy, trường học… Cây lưỡi hổ cũng có thể trồng trong chậu đứng trang trí cho nội thất cho nhà ở, văn phòng, xung quanh công ty.',
      image: 'assets/images/2.png', label: 'Indoors',price: 20.3,
      info: Info(size: 'Medium',hum: 34,light: 'Diffuse',temp: '12-34 C')),
  Plant(id: 7, name: 'Cây Kim Tiền',
      title: 'Cây kim tiền hay kim phát tài là loại cây phong thủy màn đến nhiều may mắn cho gia chủ',
      des: 'Cây kim tiền hay kim phát tài là loại cây phong thủy màn đến nhiều may mắn cho gia chủ. Cây có nhiều kiểu dáng và mẫu mã khác nhau mang đến cho khách hàng nhiều sự lựa chọn hơn.',
      image: 'assets/images/3.png', label: 'Indoors',price: 14.67,
      info: Info(size: 'Small',hum: 34,light: 'Diffuse',temp: '12-34 C')),
  Plant(id: 8, name: 'Cây Monstera',
      title: 'Cây Monstera Mini Rhaphidophora Tetrasperma là loại cây kiểng lá thường được trồng trong chậu để bàn',
      des: 'Cây Monstera Mini Rhaphidophora Tetrasperma là loại cây kiểng lá thường được trồng trong chậu để bàn hoặc trồng chậu đứng để trang trí nội thất văn phòng, nhà hàng, khách sạn… Chúng được nhiều người yêu thích bởi hình dáng của lá rất đặc biệt luôn thu hút mọi ánh nhìn.',
      image: 'assets/images/4.png', label: 'Indoors',price: 77.75,
      info: Info(size: 'Small',hum: 34,light: 'Diffuse',temp: '12-34 C')),
  Plant(id: 9, name: 'Cây Vạn Lộc',
      title: 'Cây Vạn Lộc là cây dễ trồng và chăm sóc có vẻ ngoài sang trọng, bắt mắt với màu sắc ấn tượng',
      des: 'Cây Vạn Lộc là cây dễ trồng và chăm sóc có vẻ ngoài sang trọng, bắt mắt với màu sắc ấn tượng, vừa có thể trồng trong nhà, lại có thể đặt ở phòng làm việc giúp mang lại may mắn, phú quý cho gia chủ do đó cây vạn lộc được rất nhiều người tìm kiếm.',
      image: 'assets/images/5.png', label: 'Indoors',price: 45.34,
      info: Info(size: 'Small',hum: 34,light: 'Diffuse',temp: '12-34 C')),
];

List<Plant> lstPlantOutDoors (){
  List<Plant> lst = [];
  for(var plant in lstPlant){
    if(plant.label == 'Outdoors'){
      lst.add(plant);
    }
  }
  return lst;
}

List<Plant> lstPlantInDoors (){
  List<Plant> lst = [];
  for(var plant in lstPlant){
    if(plant.label == 'Indoors'){
      lst.add(plant);
    }
  }
  return lst;
}