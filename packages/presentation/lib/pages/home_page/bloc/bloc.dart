import 'package:domain/usecase/weather_usecase.dart';
import 'package:domain/usecase/current_data.dart';
import 'package:presentation/core/base/bloc_base.dart';
import 'package:presentation/core/base/bloc_base_impl.dart';
import 'package:presentation/mapper/login_view_mapper.dart';
import 'package:presentation/pages/home_page/bloc/bloc_data.dart';
//import 'package:presentation/core/utils/string_exctention.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(
          ForecastWeatherUseCase useCase,
          LocationMapper locationMapper,
          CurrentWeatherUseCase currentWeatherUseCase) =>
      _HomeBloc(useCase, locationMapper, currentWeatherUseCase);

  void getData();
}

class _HomeBloc extends BaseBlocImpl implements HomeBloc {
  final ForecastWeatherUseCase _forecastUseCase;
  final CurrentWeatherUseCase _currentWeatherUseCase;
  final LocationMapper _locationMapper;

  final _screenData = HomeData.init();

  _HomeBloc(
      this._forecastUseCase, this._locationMapper, this._currentWeatherUseCase);

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getData() async {
    //final requestData = _locationMapper.mapScreenDataToRequest(_screenData);
    _screenData.current = await _currentWeatherUseCase();
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
  }
}
