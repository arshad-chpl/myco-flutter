import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/splash/domain/entities/app_version.dart';
import 'package:myco_flutter/features/splash/domain/usecases/get_app_version.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetAppVersion getAppVersion;

  SplashBloc(this.getAppVersion) : super(SplashInitial()) {
    on<LoadSplash>(_onLoadSplash);
  }

  Future<void> _onLoadSplash(
    LoadSplash event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoading());

    try {
      Either<Failure, AppVersion> versionInfo =
          await getAppVersion(); // Domain entity

      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final String version = packageInfo.version;
      final String buildNumber = packageInfo.buildNumber;

      final String platform = Platform.isAndroid ? 'android' : 'ios';

      print('App Version: $version');
      print('Build Number: $buildNumber');
      print('Platform: $platform');
      versionInfo.fold((failure) => emit(SplashError(failure.message)), (
        appVersion,
      ) {
        if (int.parse(appVersion.latestVersion!) <
            int.parse(packageInfo.buildNumber)) {
          emit(SplashForceUpdate(appVersion));
        } else {
          emit(SplashLoaded());
        }
      });
    } catch (e) {
      emit(SplashError('Failed to check app version'));
    }
  }
}
