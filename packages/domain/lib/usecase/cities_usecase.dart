import 'package:domain/models/city_model.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class CitiesUseCase implements UseCase<Future<List>> {
  final INetworkRepository _repository;

  CitiesUseCase(this._repository);
  @override
  Future<List<CityModel>> call() async {
    return _repository.getCities();
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
