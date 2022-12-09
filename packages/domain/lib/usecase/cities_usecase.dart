import 'package:domain/models/city_model.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class CitiesUseCase implements UseCaseParams<String, Future<List<City>>> {
  final INetworkRepository _repository;

  CitiesUseCase(this._repository);
  @override
  Future<List<City>> call(String query) async {
    return _repository.getCities(query);
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
