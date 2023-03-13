class CurrentLocationModel {
  final String address;
  final String longitude;
  final String latittude;
  final String samthulQibla;
  final String direction;

  const CurrentLocationModel({
    this.address = '',
    this.latittude = "0° 0' 0''",
    this.longitude = "0° 0' 0''",
    this.samthulQibla = "0° 0' 0''",
    this.direction = '',
  });
}
