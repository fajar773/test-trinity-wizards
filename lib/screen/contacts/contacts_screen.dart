import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:testtrinitywizard/const/const.dart';
import 'package:testtrinitywizard/controller/contact_controller.dart';
import 'package:testtrinitywizard/model/contact_model.dart';

class ContactScreen extends StatefulWidget{
  @override
  _StateContactScreen createState()=> _StateContactScreen();

}

class _StateContactScreen extends State<ContactScreen>{

  ContactController controller = Get.find();
  RefreshController refreshController =
  RefreshController(initialRefresh: false);


  @override
  void initState() {
    // TODO: implement initState
    controller.initValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
            'Contacts',
            style: TextStyle(
              color: Colors.black
            )),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.search,
            color: ConstVariable.primaryColors,size: 30),
        ),
        actions: [
          IconButton(
            onPressed: (){
              controller.add();
            },
            icon: const Icon(
                Icons.add,
                color: ConstVariable.primaryColors,size: 30),
          )
        ],
      ),
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return Obx(() => Container(
      margin: EdgeInsets.all(10),
      child: SmartRefresher(
        controller: refreshController,
        onRefresh: (){
          controller.onRefresh();
          refreshController.refreshCompleted();
        },
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: controller.listContacts.value.length,
            itemBuilder: (context, index){
              ContactsModel data = controller.listContacts.value[index];
              return GestureDetector(
                onTap: (){
                  controller.openDetail(data);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 1),
                      shape: BoxShape.rectangle
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ConstVariable.primaryColors,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                            data.firstName??'',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19
                            )),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    ));
  }

}