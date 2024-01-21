extension NumExtension on num {
  String get hoursAndMinutes {
    // Ensure the value is a non-negative number
    if (this < 0) {
      return "0h 0min";
    }

    int hours = (this / 60).floor();
    int minutes = (this % 60).floor();

    return hours.toString() + "h " + minutes.toString() + "min";
  }
}
