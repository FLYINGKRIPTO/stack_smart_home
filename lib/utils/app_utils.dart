import 'package:stack_smart_home/utils/costants.dart';

class AppUtils {
  static String getGreetingMessage() {
    var currentTime = DateTime.now().hour;
    if (currentTime <= 12) {
      return StringConstants.morningGreeting;
    } else if ((currentTime > 12) && (currentTime <= 16)) {
      return StringConstants.afternoonGreeting;
    } else if ((currentTime > 16) && (currentTime < 20)) {
      return StringConstants.eveningGreeting;
    } else {
      return StringConstants.nightGreeting;
    }
  }
}
