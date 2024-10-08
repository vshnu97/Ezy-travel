import 'dart:math';
import 'package:ezy_travel/model/flight_model.dart';
import 'package:ezy_travel/res/app_colors.dart';
import 'package:ezy_travel/view/flight-list/widgets/custom_airplane.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlightOfferCard extends StatelessWidget {
  final FlightOffer offer;

  const FlightOfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildFlightInfo(offer.onward, 'Onward'),
            const Divider(),
            _buildFlightInfo(offer.return_, 'Return'),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: CustomPaint(
                painter: DottedLinePainter(
                  color: const Color(0xffC8C8C8),
                  strokeWidth: 2,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (offer.isCheapest)
                      _chipWidget(
                          title: 'Cheapest', color: Appcolors.primaryColor),
                    const SizedBox(
                      width: 20,
                    ),
                    _chipWidget(
                        title: 'Refundable', color: const Color(0xff1673E1)),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: "Clicked on flight details");
                  },
                  child: const Row(
                    children: [
                      Text('Flight Details',
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12,
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFA7927))),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xffFA7927),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _chipWidget({required String title, required Color color}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(title,
            style: TextStyle(
                fontSize: 9,
                fontFamily: "ProximaNova",
                fontWeight: FontWeight.w500,
                color: color)),
      ),
    );
  }

  Widget _buildFlightInfo(Flight flight, String type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Image.asset(
                      "assets/images/176472b7b12cf4949ca4c95013c01405.png"),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text("$type - ${flight.airline}",
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff0B0B0B))),
                  ),
                ],
              ),
            ),
            Text(
              '${flight.currency} ${flight.price.round()}',
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2EA446)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flight.departureTime.toString().substring(11, 16),
                  style: const TextStyle(
                      fontSize: 22,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w700,
                      color: Color(0xff0B0B0B)),
                ),
                Text(
                  flight.departureCode,
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2F2F2F)),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      child: CustomPaint(
                        painter: DottedLinePainter(
                          color: const Color(0xff505050),
                          strokeWidth: 1,
                        ),
                      ),
                    ),
                    Transform.rotate(
                        angle: 90 * pi / 180,
                        child: Icon(
                          Icons.flight,
                          size: 24,
                          color: Appcolors.primaryColor,
                        )),
                    SizedBox(
                      width: 30,
                      child: CustomPaint(
                        painter: DottedLinePainter(
                          color: const Color(0xff505050),
                          strokeWidth: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(flight.duration.toString().split('.').first,
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w500,
                        color: Color(0xff454B50))),
                flight.stops != 0
                    ? Text('${flight.stops} Stops',
                        style: const TextStyle(
                            fontSize: 12,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff454B50)))
                    : const SizedBox(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  flight.arrivalTime.toString().substring(11, 16),
                  style: const TextStyle(
                      fontSize: 22,
                      fontFamily: "ProximaNova",
                      fontWeight: FontWeight.w700,
                      color: Color(0xff0B0B0B)),
                ),
                Text(flight.arrivalCode,
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff2F2F2F))),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
