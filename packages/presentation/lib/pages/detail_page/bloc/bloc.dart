import 'dart:developer';

import 'package:domain/usecase/current_data.dart';
import 'package:presentation/core/base/bloc_base.dart';
import 'package:presentation/core/base/bloc_base_impl.dart';
import 'package:presentation/pages/detail_page/bloc/bloc_data.dart';
//import 'package:presentation/core/utils/string_exctention.dart';

abstract class DetailBloc extends BaseBloc {
  factory DetailBloc(CurrentWeatherUseCase currentWeatherUseCase) =>
      _DetailBloc(
        currentWeatherUseCase,
      );

  void getData(String city);
}

class _DetailBloc extends BaseBlocImpl implements DetailBloc {
  final CurrentWeatherUseCase _currentWeatherUseCase;

  final _screenData = DetailData.init();

  _DetailBloc(this._currentWeatherUseCase);

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  void getData(String city) async {
    _screenData.current = await _currentWeatherUseCase(city);

    _updateData();
    log('${_screenData.current}<<<<<<<<');
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
    _currentWeatherUseCase.dispose();
  }
}
