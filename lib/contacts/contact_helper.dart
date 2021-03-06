import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:contacts_service/contacts_service.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

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
    if(_db != null){
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "constructsnew.db");
    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
        "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $phoneColumn TEXT, $imgColumn TEXT)"
      );
    });
  }

  Future<ContactCp> saveContactCp(ContactCp contactCp) async {
    Database dbContact = await db;
    contactCp.id = await dbContact.insert(contactTable, contactCp.toMap());
    return contactCp;
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
    return await dbContactCp.delete(contactTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateContactCp (ContactCp contactCp) async {
    Database dbContactCp = await db;
    return await dbContactCp.update(contactTable, contactCp.toMap(), where: "$idColumn = ?", whereArgs:[contactCp.id]);
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
    DocumentReference contactDoc = Firestore.instance.collection("users").document("contacts");
    contactDoc.setData({phone:""},merge: true);
    return true;
  }

  Future<bool> setStatusFb (String phone, String status) async {
    DocumentReference contactDoc = Firestore.instance.collection("users").document("contacts");
    contactDoc.updateData({phone : status});
    return true;
  }

  Future<Contact> mergeFbToCp () async {
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
    var contacts = await ContactsService.getContacts();
    QuerySnapshot snapshot = await Firestore.instance.collection("users").getDocuments();
    //print(contacts.first.phones.first.value.replaceAll(new RegExp(r'[^\w]'), ""));
    for(Contact contacList in contacts){
      if (snapshot.documents[0].data.containsKey(contacList.phones.first.value.replaceAll(new RegExp(r'[^\w]'), ""))){
        ContactCp c =ContactCp();
        c.phone = (contacList.phones.first.value.replaceAll(new RegExp(r'[^\w]'), ""));
        c.name = contacList.givenName;
        c.img = "empty";
        saveContactCp(c);
        getAllContactsCp().then((list){
          print(list);
        });

      }
    }  
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
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      nameColumn: name,
      phoneColumn: phone,
      imgColumn: img
    };
    if(id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "ContactCp(id: $id, name: $name, phone: $phone img: $img)";
  }

}