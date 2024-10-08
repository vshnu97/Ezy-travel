import 'package:ezy_travel/view-model/flight_list_controlelr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateSelectorView extends GetView<DateSelectorController> {
  const DateSelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Obx(() => ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.dates.length,
            itemBuilder: (context, index) => Obx(() => DateItem(
                  date: controller.dates[index],
                  index: index,
                  isSelected: controller.selectedIndex.value == index,
                  onTap: () => controller.selectDate(index),
                  price: controller.getPriceForDate(controller.dates[index]),
                )),
          )),
    );
  }
}

class DateItem extends StatelessWidget {
  final DateTime date;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final int price;

  const DateItem({
    super.key,
    required this.date,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.green : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DateText(date: date, isSelected: isSelected),
            PriceText(price: price, isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class DateText extends StatelessWidget {
  final DateTime date;
  final bool isSelected;

  const DateText({
    super.key,
    required this.date,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontFamily: "ProximaNova",
      fontSize: 12,
      color: isSelected ? Colors.white : const Color(0xff434343),
      fontWeight: FontWeight.w700,
    );

    return Text(
      '${DateFormat('MMM dd').format(date)} - ${DateFormat('MMM dd').format(date.add(const Duration(days: 1)))}',
      style: textStyle,
    );
  }
}

class PriceText extends StatelessWidget {
  final int price;
  final bool isSelected;

  const PriceText({
    super.key,
    required this.price,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'From AED $price',
      style: TextStyle(
        fontSize: 12,
        fontFamily: "ProximaNova",
        fontWeight: FontWeight.w500,
        color: isSelected ? Colors.white : const Color(0xff434343),
      ),
    );
  }
}
