import 'package:flutter/material.dart';

class LocationCardWidget extends StatelessWidget {
  final String location;
  final String time;
  final String weatherStatus;
  final String temperature;
  final String highTemp;
  final String lowTemp;

  const LocationCardWidget({
    super.key,
    required this.location,
    required this.time,
    required this.weatherStatus,
    required this.temperature,
    required this.highTemp,
    required this.lowTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6, // Provides shadow effect
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 12),
                Text(
                  weatherStatus,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            // Right Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  temperature,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                  "H: $highTemp  |  L: $lowTemp",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
