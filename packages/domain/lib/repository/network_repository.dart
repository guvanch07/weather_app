import 'package:domain/models/weather_models.dart';
import 'package:domain/repository/base_repository.dart';

abstract class INetworkRepository implements BaseRepository {
  Future<Welcome> getNetworkData(String lon, String lat);
}
