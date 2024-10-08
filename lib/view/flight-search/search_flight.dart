import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ezy_travel/model/image_model.dart';
import 'package:ezy_travel/res/app_colors.dart';
import 'package:ezy_travel/utility/case_format.dart';
import 'package:ezy_travel/view-model/search_flight_controller.dart';
import 'package:ezy_travel/view/flight-search/widgets/search_form.dart';

class SearchFlight extends StatefulWidget {
  const SearchFlight({super.key});

  @override
  State<SearchFlight> createState() => _SearchFlightState();
}

class _SearchFlightState extends State<SearchFlight>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFlightController>(
      builder: (controller) => Theme(
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
              appBar: _buildAppBar(),
              body: SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        _buildHeaderSection(constraints),
                        const SizedBox(height: 40),
                        _buildSearchForm(constraints, controller),
                        const SizedBox(height: 20),
                        const FlightSearchForm(),
                        const SizedBox(height: 5),
                        _buildTravelInspirations(controller),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // AppBar widget
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Search flights"),
      actions: [
        GestureDetector(
            onTap: () {
              Fluttertoast.showToast(msg: "Clicked on menu");
            },
            child: const Icon(Icons.menu)),
        SizedBox(width: MediaQuery.of(context).size.width * 0.04)
      ],
      centerTitle: false,
    );
  }

  // Travel Inspirations section
  Widget _buildTravelInspirations(SearchFlightController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTravelInspirationsHeader(),
        SizedBox(
          height: 250,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: (controller.destinations.length / 2).ceil(),
            itemBuilder: (context, index) =>
                _buildDestinationRow(controller, index),
          ),
        ),
      ],
    );
  }

  // Travel Inspirations header
  Widget _buildTravelInspirationsHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Travel Inspirations',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: "ProximaNova",
              color: Color(0xff2D2D2D),
            ),
          ),
          Row(
            children: [
              Text(
                'Dubai',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "ProximaNova",
                  color: Color(0xff2D2D2D),
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.green, size: 16),
            ],
          ),
        ],
      ),
    );
  }

  // Destination row in Travel Inspirations
  Widget _buildDestinationRow(SearchFlightController controller, int index) {
    return Row(
      children: [
        _buildDestinationCard(controller.destinations[index * 2]),
        if (index * 2 + 1 < controller.destinations.length)
          _buildDestinationCard(controller.destinations[index * 2 + 1]),
      ],
    );
  }

  // Individual destination card
  Widget _buildDestinationCard(Destination destination) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(destination.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'From AED${destination.price}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "ProximaNova",
                  ),
                ),
                const Text(
                  'Economy round trip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "ProximaNova",
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  destination.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "ProximaNova",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Header section with background image and tab buttons
  Widget _buildHeaderSection(BoxConstraints constraints) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          "assets/images/462e7543d7dd8fb2b13aca1ec294d139.png",
          width: double.infinity,
          height: constraints.maxHeight * .25,
          fit: BoxFit.cover,
        ),
        const Positioned(
          top: 12,
          left: 12,
          child: Text(
            "Let's start your trip",
            style: TextStyle(
              fontFamily: "ProximaNova",
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          bottom: constraints.maxHeight * -0.025,
          left: 0,
          right: 0,
          child: _buildTabButtons(),
        ),
      ],
    );
  }

  // Tab buttons widget
  Widget _buildTabButtons() {
    return GetBuilder<SearchFlightController>(
      builder: (controller) => Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: controller.tabs
                .map((tab) => _buildTabButton(tab, controller))
                .toList(),
          ),
        ),
      ),
    );
  }

  // Individual tab button
  Widget _buildTabButton(String tab, SearchFlightController controller) {
    final isSelected = controller.selectedTab == tab;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () => controller.changeTab(tab),
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          backgroundColor: isSelected ? Appcolors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(
          tab,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "ProximaNova",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Search form widget
  Widget _buildSearchForm(
      BoxConstraints constraints, SearchFlightController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildLocationRow(
              Icons.flight_outlined, 'From', controller.fromController),
          _buildSwapButton(controller),
          _buildLocationRow(Icons.location_pin, 'To', controller.toController),
        ],
      ),
    );
  }

  // Location input row
  Widget _buildLocationRow(
      IconData icon, String label, TextEditingController textController) {
    return Row(
      children: [
        Transform.rotate(
          angle: label == "From" ? 45 * pi / 180 : 0,
          child: Icon(icon, color: Colors.green),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: textController,
            inputFormatters: [UpperCaseTextFormatter()],
            maxLength: 50,
            decoration: InputDecoration(
              counterText: "",
              hintText: label,
              hintStyle: const TextStyle(
                fontFamily: "ProximaNova",
                fontWeight: FontWeight.w500,
                color: Color(0xff484C54),
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: "ProximaNova",
            ),
          ),
        ),
      ],
    );
  }

  // Swap button for location inputs
  Widget _buildSwapButton(SearchFlightController controller) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Appcolors.primaryColor,
                  Appcolors.lightColor,
                  Colors.white
                ],
              ),
            ),
          ),
        ),
        RotationTransition(
          turns: Tween(begin: 0.0, end: 0.5).animate(_animationController),
          child: IconButton(
            icon: const Icon(Icons.swap_vert, color: Colors.green),
            onPressed: () => controller.swapLocations(_animationController),
          ),
        ),
      ],
    );
  }
}
