import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testtrinitywizard/const/const.dart';
import 'package:testtrinitywizard/controller/contact_controller.dart';

class DetailContacts extends StatefulWidget{
  @override
  _StateDetailContacts createState() => _StateDetailContacts();
}

class _StateDetailContacts extends State<DetailContacts>{

  ContactController controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Center(
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
              controller.isEdit = false;
            },
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: const Text(
                  'Cancel',
                  style: TextStyle(
                      color: ConstVariable.primaryColors
                  )),
            ),
          ),
        ),
        actions: [
          Center(
            child: GestureDetector(
              onTap: (){
                controller.validate();
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: const Text(
                    'Save',
                    style: TextStyle(
                        color: ConstVariable.primaryColors
                    )),
              ),
            ),
          ),
        ],
      ),
      body: bodyDetail(),
    );
  }

  bodyDetail() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30,bottom: 30),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: ConstVariable.primaryColors,
                  radius: 60,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,bottom: 20),
              child: const Text(
                  'Main Information',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.only(left: 10,right: 10),
                  child: const Text(
                      'First Name',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        shape: BoxShape.rectangle
                    ),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: controller.textCtrlFirstName,
                      decoration: InputDecoration.collapsed(hintText: ''),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15,top: 15,left: 10),
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.only(left: 10,right: 10),
                  child: const Text(
                      'Last Name',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        shape: BoxShape.rectangle
                    ),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: controller.textCtrlLastName,
                      decoration: InputDecoration.collapsed(hintText: ''),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10,bottom: 20,top: 20),
              child: const Text(
                  'Sub Information',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.only(left: 10,right: 10),
                  child: const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        shape: BoxShape.rectangle
                    ),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: controller.textCtrlEmail,
                      decoration: InputDecoration.collapsed(hintText: ''),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15,top: 15,left: 10),
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  margin: EdgeInsets.only(left: 10,right: 10),
                  child: const Text(
                      'DOB',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        shape: BoxShape.rectangle
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            textInputAction: TextInputAction.done,
                            controller: controller.textCtrlDOB,
                            decoration: InputDecoration.collapsed(hintText: '',),
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.calendar_month),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}