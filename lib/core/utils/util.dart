class Util {
  // Private constructor
  Util._privateConstructor();

  // Singleton instance
  static final Util _instance = Util._privateConstructor();

  // Getter to access the singleton
  static Util get instance => _instance;

  /// Method to generate password
  String getCurrentPassword(
    String societyId,
    String userId,
    String userMobile,
  ) {
    final subMobile = _getLastThreeChars(userMobile);
    return '$userId@$subMobile@$societyId';
  }

  /// Utility to get last 3 characters
  String _getLastThreeChars(String input) {
    if (input.length < 3) return input;
    return input.substring(input.length - 3);
  }

  // Future<String?> getDeviceId() async {
  //   if (Platform.isAndroid || Platform.isIOS) {
  //     try {
  //       // Use platform_device_id for best persistent ID
  //       return await MobileDeviceIdentifier().getDeviceId();
  //     } catch (e) {
  //       debugPrint('Error getting device ID: $e');
  //     }
  //   }
  //   return null;
  // }

  String getMonthName(int month) => switch (month) {
    0 => 'All',
    1 => 'January',
    2 => 'February',
    3 => 'March',
    4 => 'April',
    5 => 'May',
    6 => 'June',
    7 => 'July',
    8 => 'August',
    9 => 'September',
    10 => 'October',
    11 => 'November',
    12 => 'December',
    _ => 'Unknown', // Return a non-null String
  };
}
