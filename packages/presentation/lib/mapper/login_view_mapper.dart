import 'package:presentation/pages/home_page/bloc/bloc_data.dart';
import 'package:domain/models/location.dart';

abstract class LocationMapper {
  factory LocationMapper() => _LocationMapper();

  CurrentLocation mapScreenDataToRequest(HomeData screenData);
}

class _LocationMapper implements LocationMapper {
  @override
  CurrentLocation mapScreenDataToRequest(
    HomeData screenData,
  ) =>
      CurrentLocation(
        city: screenData.city,
        country: screenData.country,
        lon: screenData.lon,
        lat: screenData.lat,
      );
}
