import 'dart:io';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../data/plantData.dart';
import '../../../models/plant.dart';
import '../../infoPlantScreen/infoPlantScreen.dart';

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QRViewExampleState();
  }
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  Plant? plant;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  // (result != null)
  // ? Text(
  // 'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
  //     : Text('Scan a code'),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset('assets/images/logo.png',height: 50,),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child:  plant!= null?
            Container(
                margin: EdgeInsets.all(20),
                child: BlurryContainer(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      //color: Colors.purple,
                      height: 180,
                      padding: const EdgeInsets.only(top: 20, bottom: 10,left: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFE9F0EA).withOpacity(0.2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                              plant!.image,
                              height: 180,
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              //padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      plant!.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Comfortaa',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      plant!.title,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white30,
                                        fontFamily: 'Comfortaa',
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${plant!.price} \$',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Comfortaa',
                                            ),
                                          ),
                                          ElevatedButton(
                                              child: const Icon(Icons.add),
                                              style: ButtonStyle(
                                                  foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                                  backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                      const Color(0xFF498552)),
                                                  shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(100),
                                                      ))),
                                              onPressed: () {
                                                Get.to(InfoPlantScreen(plant: plant!));
                                              })
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  blur: 5,
                  elevation: 0,
                  color: Colors.white24,
                  padding: const EdgeInsets.all(8),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ))
            :
            SizedBox(),
          )


        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        getPlantInResultQr(scanData.code!);
        print('dataqr:${scanData.code!}');
      });
    });
  }

  Plant searchPlant(String query) {
    var listResult = lstPlant.where((element) {
      var plantName = element.id;
      var toLowQuery = int.parse(query);
      return plantName == toLowQuery;
    }).toList();
    return listResult[0];
  }
  void getPlantInResultQr(String result){
    List<String> idPlant = result.split(':');
if(idPlant[0].toLowerCase()== 'plantapp'){
  setState(() {
    plant = searchPlant(idPlant[1]);
  });
}


  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
