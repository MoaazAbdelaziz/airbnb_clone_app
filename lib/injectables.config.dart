// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'app_module.dart' as _i460;
import 'core/utils/api_service.dart' as _i424;
import 'features/home/data/repos/booking_tab_repo/bookings_tab_repo.dart'
    as _i310;
import 'features/home/data/repos/booking_tab_repo/bookings_tab_repo_impl.dart'
    as _i860;
import 'features/home/data/repos/users_tab_repo/users_tab_repo.dart' as _i863;
import 'features/home/data/repos/users_tab_repo/users_tab_repo_impl.dart'
    as _i980;
import 'features/home/presention/views/taps/bookings/manger/bookings_tab_cubit.dart'
    as _i311;
import 'features/home/presention/views/taps/users/manger/cubit/users_tab_cubit.dart'
    as _i851;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i361.Dio>(() => appModule.getDio());
    gh.factory<_i424.ApiService>(() => _i424.ApiService(gh<_i361.Dio>()));
    gh.factory<_i863.UsersTabRepo>(
        () => _i980.UsersTabRepoImpl(gh<_i424.ApiService>()));
    gh.factory<_i310.BookingsTabRepo>(
        () => _i860.BookingsTabRepoImpl(gh<_i424.ApiService>()));
    gh.factory<_i311.BookingsTabCubit>(
        () => _i311.BookingsTabCubit(gh<_i310.BookingsTabRepo>()));
    gh.factory<_i851.UsersTabCubit>(
        () => _i851.UsersTabCubit(gh<_i863.UsersTabRepo>()));
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
