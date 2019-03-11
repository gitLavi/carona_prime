import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:contacts_service/contacts_service.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

final String contactTable = "contactTable";
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
        "CREATE TABLE $contactTable($phoneColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $imgColumn TEXT)"
      );
    });
  }

  Future<ContactCp> saveContactCp(ContactCp contact) async {
    Database dbContact = await db;
    contact.phone = (await dbContact.insert(contactTable, contact.toMap())) as String;
    return contact;
  }

  Future<ContactCp> getContactCp(String phone) async {
    Database dbContactCp = await db;
    List<Map> maps = await dbContactCp.query(contactTable,
    columns: [phoneColumn, nameColumn, imgColumn],
    where: "$phoneColumn = ?",
    whereArgs: [phone]);
    if(maps.length > 0){
      return ContactCp.fromMap(maps.first);
    }else{
      return null;
    }
  }

  Future<int> deleteContactCp(String phone) async {
    Database dbContactCp = await db;
    await dbContactCp.delete(contactTable, where: "$phoneColumn = ?", whereArgs: [phone]);
    return 0;
  }

  Future<int> updateContactCp (ContactCp contactCp) async {
    Database dbContactCp = await db;
    await dbContactCp.update(contactTable, contactCp.toMap(), where: "$phoneColumn = ?", whereArgs:[contactCp.phone]);
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
    print(contacts.first.phones.first.value.replaceAll(new RegExp(r'[^\w]'), ""));
    for(Contact contacList in contacts){
      if (snapshot.documents[0].data.containsKey(contacList.phones.first.value.replaceAll(new RegExp(r'[^\w]'), ""))){
        ContactCp c =ContactCp();
        c.phone =  '3123123'; //(contacList.phones.first.value.replaceAll(new RegExp(r'[^\w]'), ""));
        c.name =contacList.givenName;
        saveContactCp(c);
      }
    }  
  }



}

class ContactCp {

  String name;
  String phone;
  String img;

  ContactCp();

  ContactCp.fromMap(Map map){
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
    if(phone != null) {
      map[phoneColumn] = phone;
    }
    return map;
  }

  @override
  String toString() {
    return "ContactCp( phone: $phone, name: $name, img: $img)";
  }

}