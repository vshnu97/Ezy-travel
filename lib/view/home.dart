import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ezy_travel/res/app_colors.dart';
import 'package:ezy_travel/utility/page_trans.dart';
import 'package:ezy_travel/view/hotels.dart';
import 'package:ezy_travel/view/flight-search/search_flight.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<double>(begin: -30, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Appcolors.primaryColor,
        body: SafeArea(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: Transform.translate(
                  offset: Offset(0, _slideAnimation.value),
                  child: child,
                ),
              );
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(constraints.maxWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(constraints),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    _buildServiceCards(context, constraints),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    _buildGridView(constraints),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  //*********************** Refactored widgets ********************* */

  Widget _buildHeader(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ezy travel',
          style: TextStyle(
            fontFamily: "ProximaNova",
            color: Colors.white.withOpacity(.9),
            fontWeight: FontWeight.w700,
            fontSize: constraints.maxWidth * 0.06,
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.01),
        Text(
          'Grab top deals on flight tickets and more..',
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontFamily: "ProximaNova",
            color: Colors.white.withOpacity(.7),
            fontWeight: FontWeight.w500,
            fontSize: constraints.maxWidth * 0.04,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceCards(BuildContext context, BoxConstraints constraints) {
    return Wrap(
      spacing: constraints.maxWidth * 0.04,
      runSpacing: constraints.maxHeight * 0.02,
      children: [
        _buildServiceCard(
          context,
          constraints,
          color: Appcolors.iconHotel,
          icon: Icons.hotel,
          title: "Hotels",
          offer: "30-80",
          route: const ScreenHotels(),
        ),
        _buildServiceCard(
          context,
          constraints,
          color: Appcolors.iconFlight,
          icon: Icons.flight,
          title: "Flights",
          offer: "Upto 35",
          route: const SearchFlight(),
        ),
      ],
    );
  }

  Widget _buildServiceCard(
    BuildContext context,
    BoxConstraints constraints, {
    required Color color,
    required IconData icon,
    required String title,
    required String offer,
    required Widget route,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.push(context, PageTransition(route));
      },
      child: Container(
        padding: EdgeInsets.all(constraints.maxWidth * 0.03),
        width: constraints.maxWidth > 600
            ? constraints.maxWidth * 0.4
            : constraints.maxWidth * 0.43,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff040039).withOpacity(.15),
              blurRadius: 99,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIconContainer(color, icon, constraints),
            SizedBox(height: constraints.maxHeight * 0.01),
            Text(
              title,
              style: TextStyle(
                 fontFamily: "ProximaNova",
                fontSize: constraints.maxWidth * 0.05,
                color: Colors.black.withOpacity(.6),
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "$offer% off",
              style: TextStyle(
                 fontFamily: "ProximaNova",
                fontSize: constraints.maxWidth * 0.03,
                color: Colors.black.withOpacity(.6),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer(
      Color color, IconData icon, BoxConstraints constraints) {
    return Container(
      height: constraints.maxWidth * 0.12,
      width: constraints.maxWidth * 0.12,
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: color.withOpacity(.6),
        size: constraints.maxWidth * 0.06,
      ),
    );
  }

  Widget _buildGridView(BoxConstraints constraints) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: constraints.maxWidth > 600 ? 4 : 3,
        crossAxisSpacing: constraints.maxWidth * 0.04,
        mainAxisSpacing: constraints.maxWidth * 0.04,
        childAspectRatio: 1,
      ),
      itemCount: 3,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff040039).withOpacity(.15),
              blurRadius: 99,
            ),
          ],
        ),
      ),
    );
  }
}
