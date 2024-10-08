import 'package:ezy_travel/model/image_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class SearchFlightController extends GetxController {
  // UI Controllers
  final PageController pageController = PageController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  // Observable variables
  final destinations = <Destination>[].obs;
  final passengers = 1.obs;
  final cabinClass = 'Economy'.obs;
  final Rxn<DateTime> departureDate = Rxn<DateTime>();
  final Rxn<DateTime> returnDate = Rxn<DateTime>();

  // Non-observable variables
  String selectedTab = 'One Way';
  int currentPage = 0;

  // Constants
  final List<String> tabs = ['Round Trip', 'One Way', 'Multi-city'];
  final List<String> cabinClasses = ['Economy', 'Business', 'First Class'];

  // Getters
  String get formattedDepartureDate => _formatDate(departureDate.value);
  String get formattedReturnDate => _formatDate(returnDate.value);
  String get passengersText =>
      '${passengers.value} Passenger${passengers.value > 1 ? 's' : ''}';

  @override
  void onInit() {
    super.onInit();
    _initializeDestinations();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // Initialize the list of destinations
  void _initializeDestinations() {
    destinations.addAll([
      Destination(
        name: 'Saudi Arabia',
        imageUrl: 'assets/images/9820fa362a4f7764a748fceedb6be369.png',
        price: 867,
      ),
      Destination(
        name: 'Kuwait',
        imageUrl: 'assets/images/ce38a26e224a94b9bd2369843db5abd6.png',
        price: 867,
      ),
      Destination(
        name: 'Saudi Arabia',
        imageUrl: 'assets/images/462e7543d7dd8fb2b13aca1ec294d139.png',
        price: 867,
      ),
      Destination(
        name: 'Kuwait',
        imageUrl: 'assets/images/ce38a26e224a94b9bd2369843db5abd6.png',
        price: 867,
      ),
    ]);
  }

  // Format date to string
  String _formatDate(DateTime? date) => date != null
      ? DateFormat('E, dd MMM - yyyy').format(date)
      : 'Select Date';

  // Date selection methods
  void selectDepartureDate(DateTime? date) {
    departureDate.value = date;
    if (returnDate.value != null && returnDate.value!.isBefore(date!)) {
      returnDate.value = null;
    }
    update();
  }

  void selectReturnDate(DateTime? date) {
    returnDate.value = date;
    update();
  }

  // Passenger count methods
  void incrementPassengers() {
    passengers.value++;
    update();
  }

  void decrementPassengers() {
    if (passengers.value > 1) {
      passengers.value--;
      update();
    }
  }

  // Set cabin class
  void setCabinClass(String? value) {
    if (value != null) {
      cabinClass.value = value;
      update();
    }
  }

  String? validateSearchInputs() {
    if (fromController.text.isEmpty || toController.text.isEmpty) {
      return "Please select origin and destination city";
    }
    if (departureDate.value == null) {
      return "Please select the date";
    }
    return null;
  }

  // Change the selected tab
  void changeTab(String tab) {
    selectedTab = tab;

    update();
  }

  // Swap 'from' and 'to' locations
  void swapLocations(AnimationController animationController) {
    final temp = fromController.text;
    fromController.text = toController.text;
    toController.text = temp;
    update();
    animationController.forward(from: 0);
  }
}
