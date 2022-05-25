import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/core/base/bloc_base.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:presentation/mapper/time_date_mapper.dart';

abstract class BlocState<S extends StatefulWidget, B extends BaseBloc>
    extends State<S> {
  @protected
  final B bloc = GetIt.I.get<B>();

  @protected
  final weatherMapper = GetIt.I<WeatherMapper>();

  @protected
  late AppLocalizations appLocalizations;
}
