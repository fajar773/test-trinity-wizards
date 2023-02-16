import 'package:get/instance_manager.dart';
import 'package:testtrinitywizard/controller/contact_controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ContactController>(ContactController());
  }

}