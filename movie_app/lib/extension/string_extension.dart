extension StringExtension on String {
  String getLanguage() {
    switch (this) {
      case "en":
        return "English";
      case "nl":
        return "Dutch";
      case "es":
        return "Spanish";
      case "fr":
        return "French";
      case "de":
        return "German";
      case "ja":
        return "Japanese";
      default:
        return "Others";
    }
  }
}
