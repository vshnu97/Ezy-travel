import 'package:ezy_travel/model/flight_model.dart';
import 'package:get/get.dart';

import '../services/dummy_data.dart';

class DateSelectorController extends GetxController {
  final dates = <DateTime>[].obs;
  final selectedIndex = 0.obs;
  final selectedDate = Rx<DateTime?>(null);
  final flightOffers = <FlightOffer>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
    final now = DateTime.now();
    dates.value = List.generate(5, (index) => now.add(Duration(days: index)));
    selectedDate.value = now;
  }

  void selectDate(int index) {
    selectedIndex.value = index;
    selectedDate.value = dates[index];
    update();
  }

  int getPriceForDate(DateTime date) {
    return 700 + dates.indexOf(date) * 10;
  }

  void loadDummyData() {
    flightOffers.assignAll(dummyOffers);
  }
}
