
import 'package:get/get.dart';
import 'package:zrt_interview/controller/search_controller.dart';



class DataBinding extends Bindings{

  @override
  void dependencies(){



    Get.lazyPut(() => SearchingController(),fenix: true);


  }

}