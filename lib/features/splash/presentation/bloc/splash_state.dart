part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  final String version;
  final String buildNumber;

  const SplashState({this.version='',this.buildNumber=''});

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {
  const SplashLoading({String version = '', String buildNumber = ''})
      : super(version: version, buildNumber: buildNumber);

  @override
  List<Object> get props => [version, buildNumber];
}

class SplashLoaded extends SplashState {}

class SplashForceUpdate extends SplashState {
  final AppVersion versionInfo;
  const SplashForceUpdate(this.versionInfo);

  @override
  List<Object> get props => [versionInfo];
}

class SplashError extends SplashState {
  final String message;
  const SplashError(this.message);

  @override
  List<Object> get props => [message];
}
