class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;
  String? temperature;
  String? dateTime;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
    this.temperature,
    this.dateTime,
  });

  Weather copyWith({
    final int? id,
    final String? main,
    final String? description,
    final String? icon,
    final String? temperature,
    final String? dateTime,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temperature: temperature ?? this.temperature,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
