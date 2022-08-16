import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:getx_firebase/models/notifi.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget{
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _MyNotificationScreen();
  }

}
class _MyNotificationScreen extends State<NotificationScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Notifi>>(
          future: getListNotifi(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return snapshot.hasData?
            ListView.builder(
              itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(formatDate(snapshot.data[index].time, [dd, '/', mm, '/', yyyy]).toString(),
                          style: const TextStyle(
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFE9F0EA)
                        ),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 20.h,
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                  image:DecorationImage(image:NetworkImage(snapshot.data[index].image),fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text(snapshot.data[index].title,
                              style: const TextStyle(
                                fontFamily: 'Comfortaa',
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
            )
            :
            const CircularProgressIndicator();
          },),
      ),
    );
  }

}

Future <List<Notifi>> getListNotifi() async {
  //list<>
  List<Notifi> lstNotifi = [];
  FirebaseFirestore db = FirebaseFirestore.instance;

  await db.collection("notifi").get().then(
        (res){
      //print('dl: ${res.toString()}');
      for(var data in res.docs){
        // var array = data.data()["title"]; // array is now List<dynamic>
        // print('data: ${ data.data()["title"]}');
        lstNotifi.add(Notifi(time: (data.data()["time"] as Timestamp).toDate(), title: data.data()["title"], image: data.data()["image"]));
      }
    //print(lstNotifi[0].title);
     //  return lstStr;
    },
    onError: (e) {
    },
  );
  lstNotifi.sort((a,b) {
    var adate = a.time; //before -> var adate = a.expiry;
    var bdate = b.time;//before -> var bdate = b.expiry;
    return bdate.compareTo(adate); //to get the order other way just switch `adate & bdate`
  });
  return lstNotifi;
}