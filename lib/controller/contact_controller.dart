import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:testtrinitywizard/const/const.dart';
import 'package:testtrinitywizard/model/contact_model.dart';

class ContactController extends GetxController{

  var listContacts = <ContactsModel>[].obs;
  var temptData = ContactsModel().obs;
  bool isEdit = false;

  TextEditingController textCtrlFirstName = TextEditingController();
  TextEditingController textCtrlLastName = TextEditingController();
  TextEditingController textCtrlEmail = TextEditingController();
  TextEditingController textCtrlDOB = TextEditingController();

  initValue(){
    List<dynamic> listData = (jsonDecode(ConstVariable.data) as List<dynamic>);
    listData.forEach((element) {
      listContacts.value.add(
        ContactsModel(
          email: element['email'] ?? '',
          dob:element['dob']?? '',
          firstName: element['firstName']?? '',
          id: element['id']?? '',
          lastName: element['lastName']?? ''
        )
      );
    });
    listContacts.refresh();
  }

  openDetail(ContactsModel data){
    temptData.value = data;
    textCtrlFirstName.text = data.firstName??'';
    textCtrlLastName.text = data.lastName??'';
    textCtrlEmail.text = data.email??'';
    textCtrlDOB.text = data.dob??'';
    Get.toNamed('/detail');
  }

  validate(){
    if(textCtrlFirstName.text .isEmpty){
      Get.defaultDialog(title: 'Warning',middleText: 'You must fill first name');
    } else if(textCtrlLastName.text .isEmpty){
      Get.defaultDialog(title: 'Warning' , middleText: 'You must fill first name');
    } else {
      if(isEdit){
        addNewContact();
      }else{
        save();
      }
    }
  }

  save(){
    int index = listContacts.value.indexWhere((element) => element.id == temptData.value.id);
    ContactsModel model = ContactsModel(
      firstName: textCtrlFirstName.text,
      lastName: textCtrlLastName.text,
      email: textCtrlEmail.text??'',
      dob: textCtrlDOB.text??'',
    );
    listContacts.value[index] = model;
    listContacts.refresh();
    isEdit = false;
    Get.back();
  }

  onRefresh(){
    listContacts.clear();
    initValue();
  }

  add(){
    textCtrlFirstName.clear();
    textCtrlLastName.clear();
    textCtrlEmail.clear();
    textCtrlDOB.clear();
    isEdit = true;
    Get.toNamed('/detail');
  }

  void addNewContact() {
    ContactsModel model = ContactsModel(
      firstName: textCtrlFirstName.text,
      lastName: textCtrlLastName.text,
      email: textCtrlEmail.text??'',
      dob: textCtrlDOB.text??'',
    );
    listContacts.value.add(model);
    listContacts.refresh();
    isEdit = false;
    Get.back();
  }
}