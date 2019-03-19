import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
import 'package:carona_prime/contacts/contact_helper.dart';


ContactHelper helper = ContactHelper();

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

  Future<bool> addMember(String phone, String status, String id){
    DocumentReference groupInfo = Firestore.instance.collection("groups").document(
      "group_"+ id +"_members"
      );
     groupInfo.setData({phone :status}, merge: true);
  }
  testGp(){
    
  }

}

class RideGroup {
  String groupId;
  String groupName;
  String fromTo;
  double origin;
  double destiny;
  String adm;
  RideGroup();
}