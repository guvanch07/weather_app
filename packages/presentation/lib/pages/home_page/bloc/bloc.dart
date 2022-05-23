import 'package:domain/usecase/weather_usecase.dart';
import 'package:presentation/core/base/bloc_base.dart';
import 'package:presentation/core/base/bloc_base_impl.dart';
import 'package:presentation/mapper/login_view_mapper.dart';
import 'package:presentation/pages/home_page/bloc/bloc_data.dart';
//import 'package:presentation/core/utils/string_exctention.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc(WeatherUseCase useCase, LocationMapper locationMapper) =>
      _HomeBloc(useCase, locationMapper);

  void getData();
}

class _HomeBloc extends BaseBlocImpl implements HomeBloc {
  final WeatherUseCase _homeUseCase;
  final LocationMapper _locationMapper;

  final _screenData = HomeData.init();

  _HomeBloc(this._homeUseCase, this._locationMapper);

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getData() async {
    //final requestData = _locationMapper.mapScreenDataToRequest(_screenData);
    _screenData.forecast = await _homeUseCase();
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
    _homeUseCase.dispose();
  }
}
