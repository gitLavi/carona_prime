import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

final String contactTable = "contactTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String phoneColumn = "phoneColumn";
final String imgColumn = "imgColumn";

class ContactHelper {

  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  Future<Database> get db async {
    if(_db != Null){
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "constructsnew.db");

    return openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
        "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $phoneColumn TEXT, $imgColumn TEXT)"
      );
    });
  }

  Future<ContactCp> saveContactCp(ContactCp contact) async {
    Database dbContact = await db;
    contact.id = await dbContact.insert(contactTable, contact.toMap());
    return contact;
  }

  Future<ContactCp> getContactCp(int id) async {
    Database dbContactCp = await db;
    List<Map> maps = await dbContactCp.query(contactTable,
    columns: [idColumn, nameColumn, phoneColumn, imgColumn],
    where: "$idColumn = ?",
    whereArgs: [id]);
    if(maps.length > 0){
      return ContactCp.fromMap(maps.first);
    }else{
      return null;
    }
  }

  Future<int> deleteContactCp(int id) async {
    Database dbContactCp = await db;
    await dbContactCp.delete(contactTable, where: "$idColumn = ?", whereArgs: [id]);
    return 0;
  }

  Future<int> updateContactCp (ContactCp contactCp) async {
    Database dbContactCp = await db;
    await dbContactCp.update(contactTable, contactCp.toMap(), where: "$idColumn = ?", whereArgs:[contactCp.id]);
    return 0;
  }

  Future<List> getAllContactsCp () async {
    Database dbContactCp = await db;
    List listMap = await dbContactCp.rawQuery("SELECT * FROM $contactTable");
    List<ContactCp> listContactCp = List();
    for(Map n in listMap){
      listContactCp.add(ContactCp.fromMap(n));
    }
    return listContactCp;
  }

  Future close () async {
    Database dbContactCp = await db;
    await dbContactCp.close();
  }

  Future<bool> checkContactFb (String phone) async {
    QuerySnapshot snapshot = await Firestore.instance.collection("users").getDocuments();
    if(snapshot.documents[0].data.containsKey(phone)){
      return(true);
    }else{
      return(false);
    }
  }

  Future<bool> createContactFb (String phone) async {
    DocumentReference snapshot = Firestore.instance.collection("users").document("contacts");
    snapshot.setData({phone:""},merge: true);
    return true;
  }

}

class ContactCp {

  int id;
  String name;
  String phone;
  String img;

  ContactCp();

  ContactCp.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    phone = map[nameColumn];
    img = map[imgColumn];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      nameColumn: name,
      phoneColumn: phone,
      imgColumn: img
    };
    if(id = null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "ContactCp(id: $id, name: $name, phone: $phone, img: $img";
  }

}