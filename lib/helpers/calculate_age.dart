class CalculateAge {
  //Calculate age in dateTime
  String _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();

    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;

    if (currentDate.day < birthDate.day) {
      months--;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    String ageText = "$years y";

    if (months > 0) {
      ageText += " $months m";
    }

    return ageText;
  }
  //Convert to in year month from mileSeconds
  String calculateAgeFromMilliseconds(int ageInMilliseconds) {
    // Convert milliseconds to DateTime
    DateTime birthDate = DateTime.fromMillisecondsSinceEpoch(ageInMilliseconds);

    return _calculateAge(birthDate);
  }
}