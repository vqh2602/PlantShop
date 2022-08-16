
import 'package:getx_firebase/controllers/controllers/myCartController.dart';
import 'package:getx_firebase/data/plantData.dart';

import '../../../models/plant.dart';

Plant? getPlant(int idPlant) {
  Plant? pl;
  if(idPlant >= 0){
    for(var i in lstPlant){
      if(i.id == idPlant){
        pl = i;
        //break;
      }
    }
  }
  return pl;
}

num? bill(MyCartController myCartController){
  num bill = 0;
  for(var cart in myCartController.lstMyCart.value!){
    for(var plant in lstPlant){
      if(cart!.idPlant! == plant.id){
        bill +=  plant.price * cart.number!;
      }
    }
  }

  return bill;

}

