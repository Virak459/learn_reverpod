import 'dart:math';

class LocationHelper {
  static Random random = Random();

  /// Generate random latitude between -90 to +90
  static double randomLat() {
    return -90 + random.nextDouble() * 180;
  }

  /// Generate random longitude between -180 to +180
  static double randomLng() {
    return -180 + random.nextDouble() * 360;
  }
}
