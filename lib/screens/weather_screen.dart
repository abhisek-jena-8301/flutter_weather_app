import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/widgets/card_widget.dart';

class WeatherHomeScreen extends HookConsumerWidget {
  const WeatherHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: [const WeatherAppBar(), const WeatherList()],
        ),
      ),
    );
  }
}

class WeatherAppBar extends StatelessWidget {
  const WeatherAppBar({super.key});

  static const double baseExpandedHeight = 100;
  static const double baseToolbarHeight = 52;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double expandedHeight = kToolbarHeight + (screenHeight * 0.12);
    final double toolbarHeight = kToolbarHeight + (screenHeight * 0.06);

    return SliverAppBar(
      expandedHeight: expandedHeight,
      toolbarHeight: toolbarHeight,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final bool isCollapsed = constraints.biggest.height <= toolbarHeight;

          return Stack(
            children: [
              Positioned.fill(
                child: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.015,
                    horizontal: 16,
                  ),
                  title: isCollapsed ? const _CollapsedTitle() : null,
                  background: const _ExpandedTitle(),
                ),
              ),
              Positioned(
                top: screenHeight * 0.015,
                right: 4,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/more-circle.svg',
                    width: screenHeight * 0.04,
                    height: screenHeight * 0.04,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CollapsedTitle extends StatelessWidget {
  const _CollapsedTitle();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Weather',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        const SearchBarWidget(),
      ],
    );
  }
}

class _ExpandedTitle extends StatelessWidget {
  const _ExpandedTitle();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(left: 16, top: screenHeight * 0.05, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weather',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          const SearchBarWidget(),
        ],
      ),
    );
  }
}

class WeatherList extends StatelessWidget {
  const WeatherList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => LocationCardWidget(
          location: "Bengaluru",
          time: "21:30 PM",
          weatherStatus: "Cloudy",
          temperature: "27°C",
          highTemp: "30°C",
          lowTemp: "22°C",
        ),
        childCount: 8,
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenWidth * 0.09,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for a city",
          prefixIcon: Icon(Icons.search, size: 24),
          isDense: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.01,
            horizontal: screenWidth * 0.03,
          ),
        ),
      ),
    );
  }
}
