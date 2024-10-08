import 'package:ezy_travel/utility/page_trans.dart';
import 'package:ezy_travel/view-model/search_flight_controller.dart';
import 'package:ezy_travel/view/flight-list/flight_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ezy_travel/res/app_colors.dart';

class FlightSearchForm extends GetView<SearchFlightController> {
  const FlightSearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDatePickerRow(),
                const SizedBox(height: 16),
                _buildInfoRow(),
                const SizedBox(height: 20),
                _buildSearchButton(context, controller),
              ],
            ),
          ),
        );
      },
    );
  }

  //****************************** Refracted widgets *************************** */

  Widget _buildDatePickerRow() {
    return Obx(() => Row(
          children: [
            Expanded(
                child: _buildDatePicker(
                    'Departure',
                    controller.formattedDepartureDate,
                    () => _selectDate(true))),
            const SizedBox(width: 16),
            Expanded(
                child: _buildDatePicker(
                    'Return',
                    controller.formattedReturnDate,
                    () => _selectDate(false),
                    controller.departureDate.value == null)),
          ],
        ));
  }

  Widget _buildInfoRow() {
    return Obx(() => Row(
          children: [
            Expanded(
                child: _buildInfoBox('Travelers', controller.passengersText,
                    _showPassengerSelector)),
            const SizedBox(width: 16),
            Expanded(child: _buildCabinClassDropdown()),
          ],
        ));
  }

  Widget _buildDatePicker(String label, String dateText, VoidCallback onTap,
      [bool disabled = false]) {
    return InkWell(
      onTap: disabled ? null : onTap,
      child: _buildStackedContainer(
        label,
        Row(
          children: [
            Expanded(
                child: Text(dateText,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:
                            disabled ? Colors.grey : const Color(0xff5B5B5B)))),
            Icon(Icons.calendar_today,
                size: 20,
                color: disabled ? Colors.grey : const Color(0xff49454F)),
          ],
        ),
        disabled: disabled,
      ),
    );
  }

  Widget _buildInfoBox(String label, String value, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: _buildStackedContainer(
        label,
        Row(
          children: [
            Expanded(
                child: Text(value,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500))),
            const Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCabinClassDropdown() {
    return _buildDropdownCont(
      "Cabin Class",
      DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: EdgeInsets.zero,
          value: controller.cabinClass.value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, size: 20),
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          onChanged: controller.setCabinClass,
          items: controller.cabinClasses
              .map((String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildDropdownCont(String label, Widget child,
      {bool disabled = false}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          height: 48, // Fixed height to match travelers box
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff79747E)),
            borderRadius: BorderRadius.circular(8),
            color: disabled ? Colors.grey.shade200 : Colors.white,
          ),
          child: child,
        ),
        Positioned(
          top: -10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: disabled ? const Color(0xffD4D4D4) : Appcolors.greenLight,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(label,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ),
        ),
      ],
    );
  }

  Widget _buildStackedContainer(String label, Widget child,
      {bool disabled = false}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff79747E)),
            borderRadius: BorderRadius.circular(8),
            color: disabled ? Colors.grey.shade200 : Colors.white,
          ),
          child: child,
        ),
        Positioned(
          top: -10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: disabled ? const Color(0xffD4D4D4) : Appcolors.greenLight,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(label,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchButton(
      BuildContext context, SearchFlightController controller) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {
          final validationMessage = controller.validateSearchInputs();
          if (validationMessage != null) {
            Fluttertoast.showToast(msg: validationMessage);
          } else {
            HapticFeedback.lightImpact();
            Navigator.push(context, PageTransition(ScreenFlightList()));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text('Search Flights',
            style: TextStyle(fontSize: 14, color: Colors.white)),
      ),
    );
  }

  void _selectDate(bool isDeparture) async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: isDeparture
          ? DateTime.now()
          : (controller.departureDate.value?.add(const Duration(days: 1)) ??
              DateTime.now()),
      firstDate: isDeparture
          ? DateTime.now()
          : controller.departureDate.value ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      isDeparture
          ? controller.selectDepartureDate(picked)
          : controller.selectReturnDate(picked);
    }
  }

  void _showPassengerSelector() {
    Get.dialog(
      AlertDialog(
        title: const Text('Select Passengers'),
        content: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: controller.passengers.value > 1
                      ? controller.decrementPassengers
                      : null,
                ),
                Text('${controller.passengers.value}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: controller.incrementPassengers,
                ),
              ],
            )),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
