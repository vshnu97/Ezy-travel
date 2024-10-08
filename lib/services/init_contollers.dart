import 'package:ezy_travel/view-model/flight_list_controlelr.dart';
import 'package:ezy_travel/view-model/search_flight_controller.dart';
import 'package:get/instance_manager.dart';

class InitializeControllers {
  static void initialize() {
    Get.put(SearchFlightController());
     Get.put(DateSelectorController());
   
  }
}