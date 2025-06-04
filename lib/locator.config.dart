// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:iottive_pract/blocs/auth/auth_bloc.dart' as _i94;
import 'package:iottive_pract/blocs/connectivity/connectivity_bloc.dart'
    as _i399;
import 'package:iottive_pract/blocs/home/home_bloc.dart' as _i554;
import 'package:iottive_pract/blocs/status_bar_bloc.dart' as _i197;
import 'package:iottive_pract/repositories/auth_repository.dart' as _i680;
import 'package:iottive_pract/repositories/home_repository.dart' as _i772;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i399.ConnectivityBloc>(() => _i399.ConnectivityBloc());
    gh.factory<_i197.StatusBarBloc>(() => _i197.StatusBarBloc());
    gh.factory<_i680.AuthRepository>(() => _i680.AuthRepository());
    gh.factory<_i772.HomeRepository>(() => _i772.HomeRepository());
    gh.factory<_i94.AuthBloc>(
      () => _i94.AuthBloc(authRepository: gh<_i680.AuthRepository>()),
    );
    gh.factory<_i554.HomeBloc>(
      () => _i554.HomeBloc(gh<_i772.HomeRepository>()),
    );
    return this;
  }
}
