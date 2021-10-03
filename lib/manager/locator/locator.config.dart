// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:amatrider/core/data/index.dart' as _i3;
import 'package:amatrider/features/home/domain/repositories/index.dart' as _i12;
import 'package:amatrider/features/home/presentation/managers/tab_navigation/tab_navigation_cubit.dart'
    as _i16;
import 'package:amatrider/features/onborading/presentation/managers/onboarding/onboarding_cubit.dart'
    as _i13;
import 'package:amatrider/manager/locator/modules/modules.dart' as _i20;
import 'package:amatrider/manager/settings/external/preference_repository.dart'
    as _i18;
import 'package:amatrider/manager/settings/manager/global_app_preference_cubit.dart'
    as _i19;
import 'package:amatrider/manager/theme/manager/theme_cubit.dart' as _i17;
import 'package:amatrider/utils/utils.dart' as _i4;
import 'package:connectivity/connectivity.dart' as _i5;
import 'package:dio/dio.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i8;
import 'package:firebase_core/firebase_core.dart' as _i9;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i10;
import 'package:flutter_login_facebook/flutter_login_facebook.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i14;
import 'package:sweetsheet/sweetsheet.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> $initGetIt(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final modules = _$Modules();
    final serviceModules = _$ServiceModules();
    final gPSModules = _$GPSModules();
    await gh.factoryAsync<_i3.AppDatabase>(() => modules.database,
        preResolve: true);
    gh.singleton<_i3.AppHttpClient>(serviceModules.httpClient);
    gh.singleton<_i4.AppRouter>(modules.router);
    gh.lazySingleton<_i5.Connectivity>(() => serviceModules.connectionStatus);
    gh.singleton<_i6.Dio>(serviceModules.dio);
    gh.lazySingleton<_i7.FacebookLogin>(() => modules.facebookLogin);
    gh.lazySingleton<_i8.FirebaseAnalytics>(() => modules.firebaseAnalytics);
    await gh.factoryAsync<_i9.FirebaseApp>(() => modules.firebaseApp,
        preResolve: true);
    gh.lazySingleton<_i10.FirebaseCrashlytics>(
        () => modules.firebaseCrashlytics);
    gh.lazySingleton<_i11.InternetConnectionChecker>(
        () => serviceModules.connectionChecker);
    gh.lazySingleton<_i12.LocationService>(() => gPSModules.locationManager);
    gh.factory<_i13.OnboardingCubit>(() => _i13.OnboardingCubit());
    await gh.factoryAsync<_i14.SharedPreferences>(() => modules.preferences,
        preResolve: true);
    gh.lazySingleton<_i15.SweetSheet>(() => modules.sweetSheet);
    gh.factory<_i16.TabNavigationCubit>(() => _i16.TabNavigationCubit());
    gh.factory<_i17.ThemeCubit>(() => _i17.ThemeCubit());
    gh.singleton<_i18.PreferenceRepository>(
        _i18.PreferenceRepository(get<_i14.SharedPreferences>()));
    gh.singleton<_i19.GlobalAppPreferenceCubit>(
        _i19.GlobalAppPreferenceCubit(get<_i18.PreferenceRepository>()));
    return this;
  }
}

class _$Modules extends _i20.Modules {}

class _$ServiceModules extends _i20.ServiceModules {}

class _$GPSModules extends _i20.GPSModules {}
