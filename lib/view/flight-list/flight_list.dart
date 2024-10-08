import 'package:ezy_travel/res/app_colors.dart';
import 'package:ezy_travel/view-model/flight_list_controlelr.dart';
import 'package:ezy_travel/view/flight-list/widgets/flight_offer_card.dart';
import 'package:ezy_travel/view/flight-list/widgets/price_date.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ScreenFlightList extends StatelessWidget {
  ScreenFlightList({super.key});
  final DateSelectorController controller = Get.put(DateSelectorController());
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Appcolors.lightColor,
          titleTextStyle: const TextStyle(
            fontSize: 18,
            fontFamily: "ProximaNova",
            color: Color(0xff49454F),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: Container(
        color: Appcolors.primaryColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                "Ezy travel",
              ),
              centerTitle: false,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildInfoCard(),
                  const SizedBox(height: 20),
                  const DateSelectorView(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.flightOffers.length.toString()} Flights found",
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "ProximaNova",
                          color: Color(0xff2F2F2F),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.flightOffers.length,
                        itemBuilder: (context, index) {
                          return FlightOfferCard(
                              offer: controller.flightOffers[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //***************** Refracted widgets *************/

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "BLR - Bengaluru to DXB - Dubai",
            style: TextStyle(
              fontSize: 14,
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            "Departure: Sat, 23 Mar - Return: Sat, 23 Mar",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff2F2F2F),
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "(Round Trip)",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffFA7927),
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: "Clicked on modify search");
                },
                child: const Text(
                  "Modify Search",
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff2EA446),
                    color: Color(0xff2EA446),
                    fontFamily: "ProximaNova",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _sortFilter("Sort", Icons.keyboard_arrow_down, true),
              _sortFilter("Non-stop", Icons.keyboard_arrow_down, false),
              _sortFilter("Filter", Icons.sort_sharp, true)
            ],
          )
        ],
      ),
    );
  }

  Widget _sortFilter(String text, IconData icon, bool isActive) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff434343),
            fontFamily: "ProximaNova",
            fontWeight: FontWeight.w500,
          ),
        ),
        isActive
            ? Icon(
                icon,
                color: isActive ? Colors.black : Colors.grey,
                size: 20,
              )
            : const SizedBox(),
      ],
    );
  }
}
