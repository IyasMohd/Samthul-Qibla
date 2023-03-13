class LocationMapModel {
  final String longitude;
  final String latittude;
  final String samthulQibla;
  final String direction;
  const LocationMapModel({
    this.latittude = "0° 0' 0''",
    this.longitude = "0° 0' 0''",
    this.samthulQibla = "0° 0' 0''",
    this.direction = '',
  });
}

class AddressModel {
  final String address;
  const AddressModel({
    this.address = '',
  });
}
