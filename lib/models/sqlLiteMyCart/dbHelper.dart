import 'dart:async';
import 'dart:io' as io;
import 'package:getx_firebase/models/sqlLiteMyCart/myCart.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper {
  static Database? _db;
  static const String ID = 'id';
  static const String EMAIL = 'email';
  static const String IDPLANT = 'idPlant';
  static const String NUMBER = 'number';
  static const String TABLE = 'tblMycart';
  static const String DB_NAME = 'mycart.db';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }else{
      _db = await initDb();
      return _db;
    }
  }

  initDb() async {  //init db
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async { //tạo database
    await db
        .execute("CREATE TABLE $TABLE "
        "($ID INTEGER PRIMARY KEY AUTOINCREMENT, "
        "$EMAIL TEXT NOT NULL,"
        "$IDPLANT NUMBER NOT NULL,"
        "$NUMBER NUMBER NOT NULL"
        ")");
  }

  Future<MyCart> save(MyCart myCart) async {  // insert employee vào bảng đơn giản
    // int? resule = 0;
    var dbClient = await db;
   var resule = await dbClient?.insert(TABLE, myCart.toMap());
    return myCart;
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query); //các bạn có thể sử dụng rawQuery nếu truy vẫn phức tạp để thay thế cho các phước thức có sẵn của lớp Database.
    });
    */
  }

  Future<List<MyCart>> getDataMyCart(String email) async {  //get list employees đơn giản
    var dbClient = await db;
    //List<Map> maps = await dbClient?.query(TABLE, columns: [ID, NAME]);
    List<Map<String, dynamic>>? maps = await dbClient?.rawQuery
      ("SELECT * FROM $TABLE "
        "WHERE $EMAIL = \"$email\""
      );
    List<MyCart> myCart = [];
    if (maps!.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        myCart.add(MyCart.fromMap(maps[i]));
      }
    }
    return myCart;
  }

  Future<int?> delete(String email, int idplant) async { // xóa employee
    var dbClient = await db;
    int? result = 0;
    result = await dbClient?.delete(TABLE, where: '$EMAIL = \"$email\" AND $IDPLANT = $idplant'); //where - xóa tại ID nào, whereArgs - argument là gì?
    getDataMyCart(email);
    return result;
  }

  Future<void> update(MyCart myCart) async {
    var dbClient = await db;
 if(await checkNumberInMyCart(myCart.email!, myCart.idPlant!, myCart.number!) ){
   await dbClient?.update(TABLE, myCart.toMap(),
       where: '$EMAIL = \"$EMAIL\" AND $IDPLANT = ${myCart.idPlant}');
 }
  }

  Future close() async { //close khi không sử dụng
    var dbClient = await db;
    dbClient?.close();
  }

  Future<bool> checkPlantInMyCart(String email, int idplant) async{
    var dbClient = await db;
    //List<Map> maps = await dbClient?.query(TABLE, columns: [ID, NAME]);
    List<Map<String, dynamic>>? maps = await dbClient?.rawQuery
      ("SELECT * FROM $TABLE "
        "WHERE $EMAIL = \"$email\" AND $IDPLANT = $idplant");
    if (maps!.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> checkNumberInMyCart(String email, int idplant, int number) async{
    var dbClient = await db;
    //List<Map> maps = await dbClient?.query(TABLE, columns: [ID, NAME]);
    List<Map<String, dynamic>>? maps = await dbClient?.rawQuery
      ("SELECT * FROM $TABLE "
        "WHERE $EMAIL = \"$email\" AND $IDPLANT = $idplant AND $NUMBER > 0");
    if (maps!.isNotEmpty && number>0) {
      return true;
    }else {
      delete(email,idplant);
      return false;
    }
  }
}
