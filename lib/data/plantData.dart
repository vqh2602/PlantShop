import 'package:getx_firebase/models/plant.dart';

// lấy danh sách small
List<Plant> lstPlantSmall (String lable){
  List<Plant> lst = [];
  if(lable == 'All'){
    for(var plant in lstPlant){
      if(plant.info.size == 'Small'  ){
        lst.add(plant);
      }
    }
  }else{
    for(var plant in lstPlant){
      if(plant.label == lable && plant.info.size == 'Small'  ){
        lst.add(plant);
      }
    }
  }
  return lst;
}
 // lấy danh sách còn lại
List<Plant> lstPlantBigAndMedium (String lable){
  List<Plant> lst = [];
  if(lable == 'All'){
    for(var plant in lstPlant){
      if(plant.info.size == 'Big' || plant.info.size == 'Medium' ){
        lst.add(plant);
      }
    }
  }else{
    for(var plant in lstPlant){
      if(plant.label == lable &&(plant.info.size == 'Big' ||plant.info.size == 'Medium' )){
        lst.add(plant);
      }
    }
  }
  return lst;
}

List<Plant> lstPlant = [
  //outdors small
  Plant(id: 0, name: 'Cây Vạn Lộc',
      title: 'Cây Vạn Lộc là cây dễ trồng và chăm sóc có vẻ ngoài sang trọng, bắt mắt với màu sắc ấn tượng',
      des: 'Cây Vạn Lộc là cây dễ trồng và chăm sóc có vẻ ngoài sang trọng, bắt mắt với màu sắc ấn tượng, vừa có thể trồng trong nhà, lại có thể đặt ở phòng làm việc giúp mang lại may mắn, phú quý cho gia chủ do đó cây vạn lộc được rất nhiều người tìm kiếm.',
      image: 'assets/images/1a.png', label: 'Outdoors',price: 50.34,
      info: Info(size: 'Small',hum: 34,light: 'Light',temp: '12-34 C')),
  Plant(id: 1, name: 'Cây Lưỡi Hổ',
      title: 'Cây lưỡi hổ là cây phong thủy có hình dáng và màu sắc lá khá lạ ',
      des: 'Cây lưỡi hổ là cây phong thủy có hình dáng và màu sắc lá khá lạ , thường được dùng trồng viền hoặc trồng bụi trong sân vườn, công viên, nhà máy, trường học… Cây lưỡi hổ cũng có thể trồng trong chậu đứng trang trí cho nội thất cho nhà ở, văn phòng, xung quanh công ty.',
      image: 'assets/images/2a.png', label: 'Outdoors',price: 20.3,
      info: Info(size: 'Small',hum: 34,light: 'Light',temp: '12-34 C')),
  Plant(id: 2, name: 'Cây Kim Tiền',
      title: 'Cây kim tiền hay kim phát tài là loại cây phong thủy màn đến nhiều may mắn cho gia chủ',
      des: 'Cây kim tiền hay kim phát tài là loại cây phong thủy màn đến nhiều may mắn cho gia chủ. Cây có nhiều kiểu dáng và mẫu mã khác nhau mang đến cho khách hàng nhiều sự lựa chọn hơn.',
      image: 'assets/images/3a.png', label: 'Outdoors',price: 14.67,
      info: Info(size: 'Small',hum: 34,light: 'Shade',temp: '12-34 C')),
  Plant(id: 3, name: 'Cây Monstera',
      title: 'Cây Monstera Mini Rhaphidophora Tetrasperma là loại cây kiểng lá thường được trồng trong chậu để bàn',
      des: 'Cây Monstera Mini Rhaphidophora Tetrasperma là loại cây kiểng lá thường được trồng trong chậu để bàn hoặc trồng chậu đứng để trang trí nội thất văn phòng, nhà hàng, khách sạn… Chúng được nhiều người yêu thích bởi hình dáng của lá rất đặc biệt luôn thu hút mọi ánh nhìn.',
      image: 'assets/images/4a.png', label: 'Outdoors',price: 77.75,
      info: Info(size: 'Small',hum: 34,light: 'Light',temp: '12-34 C')),
  Plant(id: 4, name: 'Cây Lưỡi Mèo',
      title: 'Cây Lưỡi Mèo là loài cây kiểng lá thường được dùng để trồng trong chậu sứ để bàn hoặc trồng trong nước,',
      des: 'Cây Lưỡi Mèo là loài cây kiểng lá thường được dùng để trồng trong chậu sứ để bàn hoặc trồng trong nước, cây cũng có thể dùng phối hợp với chậu trồng nền cây may mắn trang trí cho bàn làm việc, bàn ăn, bàn khách',
      image: 'assets/images/5a.png', label: 'Outdoors',price: 45.34,
      info: Info(size: 'Small',hum: 34,light: 'Shade',temp: '12-34 C')),
//indoors small
  Plant(id: 5, name: 'Chuối Thiên Điểu',
      title: 'Cây chuối thiên điểu là cây cảnh đẹp dùng để làm cây trang trí. ',
      des: 'Cây chuối thiên điểu là cây cảnh đẹp dùng để làm cây trang trí. Cây còn có tên gọi khác nhau như: cây hoa chim thiên đường. Tên khoa học được gọi là: Strelitzia reginae, thuộc họ chuối rẻ quạt.',
      image: 'assets/images/1.png', label: 'Indoors',price: 150.4,
      info: Info(size: 'Big',hum: 34,light: 'Light',temp: '12-34 C')),
  Plant(id: 6, name: 'Cây Kè Nhật',
      title: 'Cây kè nhật là loại cây chịu bóng bán phần nên rất thích hợp để ở sảnh, hành lan văn phòng',
      des: 'Cây kè nhật là loại cây chịu bóng bán phần nên rất thích hợp để ở sảnh, hành lan văn phòng… Tuy nhiên cây phát triển tốt nhất khi được trồng ở trong môi trường có ánh sáng đầy đủ, do đó cây kè nhật luôn được dùng trang trí phòng khách, văn phòng có cửa kính…',
      image: 'assets/images/2.png', label: 'Indoors',price: 12.76,
      info: Info(size: 'Medium',hum: 34,light: 'Light',temp: '12-34 C')),
  Plant(id: 7, name: 'Hoa Tử Đằng',
      title: 'Cây hoa tử đằng là loài cây có hoa nổi tiếng trên toàn thế giới. Chúng có những chuỗi hoa dài tuyệt đẹp,',
      des: 'Cây hoa tử đằng là loài cây có hoa nổi tiếng trên toàn thế giới. Chúng có những chuỗi hoa dài tuyệt đẹp, với hương thơm dịu dàng và quyến rũ, đặc biệt cây cực kỳ sai hoa. Cây thường được sử dụng để trồng giàn tạo cảnh quan đẹp.',
      image: 'assets/images/3.png', label: 'Indoors',price: 30.00,
      info: Info(size: 'Big',hum: 34,light: 'Light',temp: '12-34 C')),
  Plant(id: 8, name: 'Thiết Mộc Lan',
      title: 'Cây thiết mộc lan hay còn gọi là cây phát tài đây là loài cây phong thủy được nhiều người lựa chọn làm cây nội thất',
      des: 'Cây thiết mộc lan hay còn gọi là cây phát tài đây là loài cây phong thủy được nhiều người lựa chọn làm cây nội thất văn phòng, loài cây này không chỉ tạo điểm nhấn cho không gian mà còn đem đến phong thủy tốt lành.',
      image: 'assets/images/4.png', label: 'Indoors',price: 154.8,
      info: Info(size: 'Big',hum: 34,light: 'Light',temp: '12-34 C')),
  Plant(id: 9, name: 'Cây Phú Quý',
      title: 'Cây phú quý là cây kiểng lá đẹp thường được sử dụng làm cây để bàn, cây nội thất văn phòng. ',
      des: 'Cây phú quý là cây kiểng lá đẹp thường được sử dụng làm cây để bàn, cây nội thất văn phòng. Cây phú quý rất dễ tính có thể trồng chậu hoặc trồng thủy canh để trang trí để bàn để bệ cửa sổ hoặc trang trí ban công, trước hiên nhà tạo không không gian đẹp và sinh động, đây cũng là món quà tặng ý nghĩa dành cho người thân.',
      image: 'assets/images/5.png', label: 'Indoors',price: 65.04,
      info: Info(size: 'Medium',hum: 34,light: 'Light',temp: '12-34 C')),
  //indoor small
  Plant(id: 10, name: 'Bách Thủy Tiên',
      title: 'Cây bách thủy tiên thuộc giống cây thủy sinh mang ý nghĩa phong thủy tốt ',
      des: 'Cây bách thủy tiên thuộc giống cây thủy sinh mang ý nghĩa phong thủy tốt nên không những được nhiều người ưa chuộng và lựa chọn trồng nhiều mà còn trở thành một món quà tặng đầy tinh tế dành tặng người thân, bạn bè,…',
      image: 'assets/images/10.png', label: 'Indoors', price: 26.76,
      info: Info(size: 'Small', hum: 26, light: 'Light', temp: '22-35 C')),
  Plant(id: 11, name: 'Cây Hồng Môn',
      title: 'Cây hồng môn có nhiều mẫu mã đẹp thường được trồng làm cây để bàn, cây để sàn trang trí không gian sống và làm việc,',
      des: 'Cây hồng môn có nhiều mẫu mã đẹp thường được trồng làm cây để bàn, cây để sàn trang trí không gian sống và làm việc, đồng thời nếu đặt ở nơi thích hợp sẽ phát huy hết khả năng phong thủy mang đến nhiều may mắn và tài lộc.',
      image: 'assets/images/11.png', label: 'Indoors', price: 45.16,
      info: Info(size: 'Small', hum: 22, light: 'Light', temp: '34-44 C')),
  Plant(id: 12, name: 'Cây Ngọc Ngân',
      title: 'Cây Ngọc Ngân là loại cây cây thường được trồng tại các văn phòng, nhà ở hay quán cà phê,…',
      des: 'Cây Ngọc Ngân là loại cây cây thường được trồng tại các văn phòng, nhà ở hay quán cà phê,… hơn nữa loại cây ngày còn mang đến nhiều điều tốt đẹp cho cuộc sống, công việc cũng như đời sống tình cảm cũng như trong phong thủy. Ngọc ngân là loài cây nội thất đang rất được ưa chuộng hiện nay.',
      image: 'assets/images/12.png', label: 'Indoors', price: 23.00,
      info: Info(size: 'Small', hum: 27, light: 'Shade', temp: '23-30 C')),
  Plant(id: 13, name: 'Rêu San Hô',
      title: 'Cây rêu san hô là loại cây sở hữu vẻ ngoài đẹp mắt và độc đáo; loài cây này thường được trồng chậu để bàn hay chậu treo để trang trí cho không gian sống',
      des: 'Cây rêu san hô là loại cây sở hữu vẻ ngoài đẹp mắt và độc đáo; loài cây này thường được trồng chậu để bàn hay chậu treo để trang trí cho không gian sống và làm việc ở các vị trí như bàn làm việc, của sổ, ban công… Ngoài ra, cây tùng rêu san hô còn được sử dụng trong các tiểu cảnh sân vườn, trồng trong hộc đá, hòn non bộ…',
      image: 'assets/images/13.png', label: 'Indoors', price: 12.55,
      info: Info(size: 'Small', hum: 22, light: 'Shade', temp: '35-55 C')),
  Plant(id: 14, name: 'Alocasia Zebrina',
      title: 'Cây Môn Alocasia Zebrina là loại cây đặc biệt thân có hoa văn rất bắt mắt cùng bộ lá xanh đậm bóng bẩy rất đặt trưng. Cây thường được trồng để trang trí nội thất',
      des: 'Cây Môn Alocasia Zebrina là loại cây đặc biệt thân có hoa văn rất bắt mắt cùng bộ lá xanh đậm bóng bẩy rất đặt trưng. Cây thường được trồng để trang trí nội thất văn phòng không gian nhà ở, văn phòng làm việc; nhà hàng; khách sạn; quán cà phê',
      image: 'assets/images/14.png', label: 'Indoors', price: 40.03,
      info: Info(size: 'Small', hum: 24, light: 'Light', temp: '22-35 C')),
  Plant(id: 15, name: 'Cây Cánh Én',
      title: 'Cây cánh én đột biến ở hữu một loại cây cảnh én đột biến thì sẽ có rất rất nhiều lợi ích và công dụng khác nhau; chúng có ngoại hình độc đáo,',
      des: 'Cây cánh én đột biến ở hữu một loại cây cảnh én đột biến thì sẽ có rất rất nhiều lợi ích và công dụng khác nhau; chúng có ngoại hình độc đáo, màu sắc khác lạ thường được dùng để trang trí nội thất văn phòng. Bên cạnh cây còn có tác dụng thanh lọc không khí rất tốt.',
      image: 'assets/images/15.png', label: 'Indoors', price: 98.76,
      info: Info(size: 'Small', hum: 22, light: 'Light', temp: '22-45 C')),
  //outdoor big
  Plant(id: 16, name: 'Bao Thanh Thiên',
      title: 'Cây bao thanh thiên hay còn được gọi là cây cung điện đỏ, thuyền trưởng đỏ có tên khoa học là Pride of Sumatra.',
      des: 'Cây bao thanh thiên hay còn được gọi là cây cung điện đỏ, thuyền trưởng đỏ có tên khoa học là Pride of Sumatra. Là một trong những loại cây cảnh được nhiều người ưa thích trong trang trí nội thất, làm nổi bật không gian. Đồng thời giúp chiêu tài vượng khí về cho gia chủ. ',
      image: 'assets/images/16.png', label: 'Outdoors', price: 77.90,
      info: Info(size: 'Big', hum: 22, light: 'Light', temp: '22-34 C')),
  Plant(id: 17, name: 'Cây Swiss Cheese',
      title: 'Cây Swiss Cheese plant là cây thân thảo, ưa khí hậu và nhiệt độ ở nước ta ( khí hậu nhiệt đới ẩm gió mùa). ',
      des: 'Cây Swiss Cheese plant là cây thân thảo, ưa khí hậu và nhiệt độ ở nước ta ( khí hậu nhiệt đới ẩm gió mùa). Tên khoa học: Monstera deliciosa ‘Variegata’.  Lá cây hình dạng độc đáo, xẻ sâu thành các thùy.',
      image: 'assets/images/17.png', label: 'Outdoors', price: 12.87,
      info: Info(size: 'Big', hum: 28, light: 'Shade', temp: '24-55 C')),
  Plant(id: 18, name: 'Cây sâm thơm',
      title: 'Cây sâm thơm có tuổi thọ cao, hơn nữa cây rất ít khi bị sâu bệnh. Là loại cây cảnh tuyệt vời cho bất kỳ không gian nào.',
      des: 'Cây sâm thơm có tuổi thọ cao, hơn nữa cây rất ít khi bị sâu bệnh. Là loại cây cảnh tuyệt vời cho bất kỳ không gian nào. Và đặc biệt hơn cây rất dễ chăm sóc. Ánh sáng gián tiếp là điều kiện thích hợp cho cây phát triển.',
      image: 'assets/images/18.png', label: 'Outdoors', price: 55.55,
      info: Info(size: 'Medium', hum: 34, light: 'Light', temp: '12-40 C')),
  Plant(id: 19, name: 'Cây Thần Tài',
      title: 'Cây thần tài chỉ cần nghe tên thôi cũng đủ hiểu cây có ý nghĩa về mặt phong thủy.',
      des: 'Cây thần tài chỉ cần nghe tên thôi cũng đủ hiểu cây có ý nghĩa về mặt phong thủy. Cây không những đem lại vẻ đẹp mà còn đem đến không gian xanh lý tưởng cho ngôi nhà của bạn.',
      image: 'assets/images/19.png', label: 'Outdoors', price: 45.35,
      info: Info(size: 'Medium', hum: 17, light: 'Shade', temp: '22-34 C')),
  Plant(id: 20, name: 'Cây Tùng thơm',
      title: 'Cây Tùng thơm còn được gọi là cây Tùng hương, có nguồn gốc từ Nam Châu Mỹ. Cây Tùng thơm được rất nhiều người yêu thích',
      des: 'Cây Tùng thơm còn được gọi là cây Tùng hương, có nguồn gốc từ Nam Châu Mỹ. Cây Tùng thơm được rất nhiều người yêu thích bởi mùi hương dịu nhẹ thơm mát mang lại sự thư giãn, giúp con người lấy lại tinh thần sau những giờ phút làm việc căng thẳng mệt mỏi.',
      image: 'assets/images/20.png', label: 'Outdoors', price: 76.54,
      info: Info(size: 'Big', hum: 52, light: 'Light', temp: '30-40 C')),

//garden small + big
  Plant(id: 21, name: 'Cây Kim Ngân',
      title: 'Cây kim ngân để bàn được xem là rất tốt về phong thủy, mang đến cho gia chủ của câysự may mắn và thịnh vượng.',
      des: 'Cây kim ngân để bàn được xem là rất tốt về phong thủy, mang đến cho gia chủ của câysự may mắn và thịnh vượng. Nên được nhiều người sử dụng chưng bày trong văn phòng làm việc công ty, tiền sảnh nhà hàng, khách sạn…. Và còn có thể sử dụng chậu nhỏ để trên bàn làm việc',
      image: 'assets/images/21.png', label: 'Gardens', price: 33.85,
      info: Info(size: 'Medium', hum: 22, light: 'Light', temp: '12-45 C')),
  Plant(id: 22, name: 'Ngũ Gia Bì',
      title: 'Cây thân thảo, lá mọc từ thân với mặt trên xanh lục, mặt dưới xanh nhạt. Cây mang sức sống mãnh liệt, ',
      des: 'Cây thân thảo, lá mọc từ thân với mặt trên xanh lục, mặt dưới xanh nhạt. Cây mang sức sống mãnh liệt, được sử dụng rộng rãi làm cây cảnh và để trưng trong nhà với mong muốn cuộc sống lâu dài, hạnh phúc.',
      image: 'assets/images/22.png', label: 'Gardens', price: 27.70,
      info: Info(size: 'Big', hum: 26, light: 'Shade', temp: '33-40 C')),
  Plant(id: 23, name: 'Cây Thường Xuân',
      title: 'Cây thường xuân hay thường được gọi là cây vạn niên, cây nguyệt quế dây. Với hình thức bên ngoài đẹp mắt dễ trồng và phát triển tốt,',
      des: 'Cây thường xuân hay thường được gọi là cây vạn niên, cây nguyệt quế dây. Với hình thức bên ngoài đẹp mắt dễ trồng và phát triển tốt, cây được lựa chọn để trang trí nội thất tại ban công, phòng làm việc, quán cafe…',
      image: 'assets/images/23.png', label: 'Gardens', price: 345.66,
      info: Info(size: 'Big', hum: 55, light: 'Light', temp: '23-55 C')),
  Plant(id: 24, name: 'Đại Tứ Lan',
      title: 'Cây thân thảo, phiến lá mềm, hình giáo đầu nhọn, màu xanh sáng và có các sọc dọc màu trắng tạo điểm nhấn cho cây',
      des: 'Cây thân thảo, phiến lá mềm, hình giáo đầu nhọn, màu xanh sáng và có các sọc dọc màu trắng tạo điểm nhấn cho cây. Cây ưa bóng và thời tiết mát mẻ.',
      image: 'assets/images/24.png', label: 'Gardens', price: 255.05,
      info: Info(size: 'Small', hum: 30, light: 'Light', temp: '22-30 C')),
  Plant(id: 25, name: 'Cây Trúc Nhật',
      title: 'Cây có thân thảo mảnh dài, phân  nhánh ít, có các lóng thân dài, lá mọc đối hoặc vòng hình bầu dục thuôn nhọn đầu.',
      des: 'Cây có thân thảo mảnh dài, phân  nhánh ít, có các lóng thân dài, lá mọc đối hoặc vòng hình bầu dục thuôn nhọn đầu. Cây phát triển nhanh và mạnh trong môi trường tốt.',
      image: 'assets/images/25.png', label: 'Gardens', price: 470.55,
      info: Info(size: 'Small', hum: 18, light: 'Light', temp: '30-35 C')),
  Plant(id: 26, name: 'Cau Tiểu Trâm',
      title: 'Cây cau tiểu trâm một trong những loại cây cảnh nội thất rất được ưa chuộng. Với tán lá xanh mượt và đặc tính lọc sạch các chất khí độc, ',
      des: 'Cây cau tiểu trâm một trong những loại cây cảnh nội thất rất được ưa chuộng. Với tán lá xanh mượt và đặc tính lọc sạch các chất khí độc, cau tiểu trâm mang lại không khí tự nhiên xanh mát cho không gian xung quanh, biểu hiện cho sức sống mạnh mẽ, ',
      image: 'assets/images/26.png', label: 'Gardens', price: 120.05,
      info: Info(size: 'Small', hum: 67, light: 'Light', temp: '22-30 C')),

  //lake small + big
  Plant(id: 27, name: 'Cây Sen Đá',
      title: 'Đây là cây lâu năm, mọng nước, có hoa lưỡng tính. Cây sen đá rất đa dạng phong phú về kiểu dáng, màu sắc, kết cấu thân lá',
      des: 'Đây là cây lâu năm, mọng nước, có hoa lưỡng tính. Cây sen đá rất đa dạng phong phú về kiểu dáng, màu sắc, kết cấu thân lá, điều đó tạo nên sức hấp dẫn đặc biệt của loại cây này.',
      image: 'assets/images/27.png', label: 'Lakes', price: 68.55,
      info: Info(size: 'Small', hum: 22, light: 'Light', temp: '20-40 C')),
  Plant(id: 28, name: 'Cây Ngân Hậu',
      title: 'Cây ngân hậu đại diện cho sự cao sang, quyền quý giống như cái tên hoàng gia của nó vậy.',
      des: 'Cây ngân hậu đại diện cho sự cao sang, quyền quý giống như cái tên hoàng gia của nó vậy. Người ta quan niệm rằng nếu đặt cây ngân hậu trong nhà sẽ có thể xua đi những điều xui xẻo, mang lại sự giàu có và yên ấm cho gia đình.',
      image: 'assets/images/28.png', label: 'Lakes', price: 126.45,
      info: Info(size: 'Small', hum: 22, light: 'Shade', temp: '20-40 C')),
  Plant(id: 29, name: 'Cây Mật Cật',
      title: 'Cây ưa ánh sáng hoặc chịu bóng bán phần thích hợp làm loại cây trồng nội thất',
      des: 'Cây ưa ánh sáng hoặc chịu bóng bán phần thích hợp làm loại cây trồng nội thất, có thể đặt trong phòng khách hay hành lang.',
      image: 'assets/images/29.png', label: 'Lakes', price: 45.70,
      info: Info(size: 'Small', hum: 22, light: 'Shade', temp: '30-50 C')),
  Plant(id: 30, name: 'Cây Lan Chi',
      title: 'Cây lan chi trồng nước, thủy canh là cây cảnh có hình dáng nhỏ xinh, thường được dùng làm trang trí trong nhà, bàn làm việc, kệ sách.',
      des: 'Cây lan chi trồng nước, thủy canh là cây cảnh có hình dáng nhỏ xinh, thường được dùng làm trang trí trong nhà, bàn làm việc, kệ sách. Ngoài ra cây còn công dụng thanh lọc không khí tạo không gian tươi mát, trong lành. Trong phong thủy cây lan chi có tác dụng trừ tà, mang lại may mắn cho gia chủ.',
      image: 'assets/images/30.png', label: 'Lakes', price: 77.07,
      info: Info(size: 'Medium', hum: 22, light: 'Light', temp: '14-28 C')),
  Plant(id: 31, name: 'Cây Đế Vương',
      title: 'Đây là cây thuộc họ trầu bà, thích hợp sống trong môi trường thiếu nắng. Cây thể hiện tinh thần của một đế vương đầy uy quyền',
      des: 'Đây là cây thuộc họ trầu bà, thích hợp sống trong môi trường thiếu nắng. Cây thể hiện tinh thần của một đế vương đầy uy quyền. Đây là một món quà thích hợp dành cho nhưng người quản lý, lãnh đạo trong một tổ chức.',
      image: 'assets/images/31.png', label: 'Lakes', price: 780.05,
      info: Info(size: 'Medium', hum: 22, light: 'Shade', temp: '20-40 C')),
  Plant(id: 32, name: 'Cây Lục Bình',
      title: 'Cây thường được trồng nhiều trong ao hồ, hay trong bể cá trang trí, trồng tạo cảnh quan cho các hồ sinh thái',
      des: 'Cây thường được trồng nhiều trong ao hồ, hay trong bể cá trang trí, trồng tạo cảnh quan cho các hồ sinh thái & trồng kết hợp với các loài sen, súng trong các tiểu cảnh nước, tiểu cảnh sân vườn… ',
      image: 'assets/images/32.png', label: 'Lakes', price: 0.75,
      info: Info(size: 'Big', hum: 22, light: 'Light', temp: '20-40 C')),
];

