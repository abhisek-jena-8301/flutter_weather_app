import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/screens/weather_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder:
          (BuildContext context, state) =>
              MyHomePage(title: 'Flutter Demo Home Page'),
    ),
    GoRoute(
      path: '/weatherscreen',
      name: 'weatherscreen',
      builder: (context, state) => WeatherHomeScreen(),
    ),
  ],
);
