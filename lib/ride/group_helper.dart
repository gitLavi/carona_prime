import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carona_prime/contacts/contact_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:uuid/uuid.dart';

ContactHelper helper = ContactHelper();
FirebaseMessaging _messaging = FirebaseMessaging();

class GroupHelper {

  static final GroupHelper _instance = GroupHelper.internal();

  factory GroupHelper() => _instance;

  GroupHelper.internal();

  Future<bool> createGroup(RideGroup rg) async {
    DocumentReference groupInfo = Firestore.instance.collection("groups").document(
      "group_"+ rg.groupId +"_info"
    );
    groupInfo.setData({
      "groupId" : rg.groupId, "groupName" : rg.groupName, "fromTo" : rg.fromTo, "origin" : rg.origin,
       "destiny" : rg.destiny, "adm" : rg.adm
    });
    addMember(rg.adm, "Motorista", rg.groupId);
  }

  Future<bool> groupRequest(String phone, String admPhone, String gpId) async {
    DocumentReference ctRequest = Firestore.instance.collection("userInf").document(phone + "_requests");
    ctRequest.setData({admPhone : gpId, "update" : true}, merge: true);
  }

  Future<bool> addMember(String phone, String status, String id){
    DocumentReference groupInfo = Firestore.instance.collection("groups").document(
      "group_"+ id +"_members"
      );
     groupInfo.setData({phone : status}, merge: true);
     DocumentReference userGroups = Firestore.instance.collection("usrGroups").document(phone);
     userGroups.setData({id : ""}, merge: true);
  }
  
  Future<bool> notifyRequest (String phone) async {
    DocumentReference requestList = Firestore.instance.collection("userInfo").document(phone + "_info");
  }

  

}

class RideGroup {
  String groupId;
  String groupName;
  String fromTo;
  String adm;
  DateTime rideHour;
  double origin;
  double destiny;
  RideGroup();
}