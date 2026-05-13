class Location {
  final String city;
  final String countryCode;

  const Location({
    required this.city,
    required this.countryCode,
  });

  @override
  String toString() => '$city, ${countryCode.toUpperCase()}';
}