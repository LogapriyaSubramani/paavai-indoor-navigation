import 'dart:math';

class NavigationService {
  static double calculateDistance(
      double x1,
      double y1,
      double x2,
      double y2,
      ) {
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  }

  static String getDistanceText(
      double x1,
      double y1,
      double x2,
      double y2,
      ) {
    double d = calculateDistance(x1, y1, x2, y2);

    return "${d.toStringAsFixed(0)} meters";
  }

  static String getWalkingTime(
      double x1,
      double y1,
      double x2,
      double y2,
      ) {
    double distance = calculateDistance(x1, y1, x2, y2);

    double minutes = distance / 70;

    if (minutes < 1) {
      return "Less than 1 min";
    }

    return "${minutes.toStringAsFixed(1)} mins walk";
  }
}