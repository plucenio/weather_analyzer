class CityResponse {
  int? id;
  String? name;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  CityResponse(
      {this.id,
      this.name,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});
}
