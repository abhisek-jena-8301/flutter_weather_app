import 'package:flutter/material.dart';

class ConditionBackground {
  static const Map<int, String> conditionBackground = {
    1: 'assets/images/rain.jpg', // For condition 1, we use a rainy background.
    2: 'assets/images/sunny.jpg', // For condition 2, we use a sunny background.
    3: 'assets/images/night.jpg', // For condition 3, we use a windy background.
    4: 'assets/images/cloudy_day.jpg', // For condition 4, we use a cloudy background.
    5: 'assets/images/cloudy_night.jpg', // For condition 5, we use a stormy background.
  };
}

class LocationCardWidget extends StatelessWidget {
  final String location;
  final String time;
  final String weatherStatus;
  final String temperature;
  final String highTemp;
  final String lowTemp;
  final int condition; // Add condition parameter here

  const LocationCardWidget({
    super.key,
    required this.location,
    required this.time,
    required this.weatherStatus,
    required this.temperature,
    required this.highTemp,
    required this.lowTemp,
    required this.condition, // Pass condition as an argument
  });

  // Method to get the background image based on condition
  String _getBackgroundImage() {
    return ConditionBackground.conditionBackground[condition] ??
        'assets/images/sunny.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6, // Provides shadow effect
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_getBackgroundImage()), // Use the method here
              fit: BoxFit.cover,
              opacity: 0.3, // Make the background a bit faded
            ),
          ),
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      time,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 12),
                    Text(
                      weatherStatus,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                // Right Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      temperature,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
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
        ),
      ),
    );
  }
}
