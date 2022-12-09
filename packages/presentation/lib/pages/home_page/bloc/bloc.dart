//import 'package:presentation/core/utils/string_exctention.dart';
import 'package:domain/models/city_model.dart';
import 'package:domain/usecase/cities_usecase.dart';
import 'package:domain/usecase/current_data.dart';
import 'package:domain/usecase/weather_usecase.dart';
import 'package:presentation/core/base/bloc_base.dart';
import 'package:presentation/core/base/bloc_base_impl.dart';
import 'package:presentation/mapper/login_view_mapper.dart';
import 'package:presentation/pages/home_page/bloc/bloc_data.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(
          ForecastWeatherUseCase useCase,
          LocationMapper locationMapper,
          CitiesUseCase cityUseCase,
          CurrentWeatherUseCase currentWeatherUseCase) =>
      _HomeBloc(useCase, currentWeatherUseCase, cityUseCase);

  void getData(String city);
  Future<List<City>> searchQuery(String query);
}

class _HomeBloc extends BaseBlocImpl implements HomeBloc {
  final ForecastWeatherUseCase _forecastUseCase;
  final CurrentWeatherUseCase _currentWeatherUseCase;
  final CitiesUseCase cityModel;

  final _screenData = HomeData.init();

  _HomeBloc(this._forecastUseCase, this._currentWeatherUseCase, this.cityModel);

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getData(String city) async {
    //final requestData = _locationMapper.mapScreenDataToRequest(_screenData);

    _screenData.current = await _currentWeatherUseCase(city);
    _screenData.forecast = await _forecastUseCase();
    _updateData();
  }

  void _updateData() {
    super.handleData(
      isLoading: isLoading,
      data: _screenData.copy(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _forecastUseCase.dispose();
    _currentWeatherUseCase.dispose();
    cityModel.dispose();
  }

  @override
  Future<List<City>> searchQuery(String query) async {
    return await cityModel(query);
  }
}
