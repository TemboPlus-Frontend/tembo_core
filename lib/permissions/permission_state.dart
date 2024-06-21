import 'permission_status.dart';

sealed class PermissionState {}

class PermissionInitialState extends PermissionState {}

class LoadingState extends PermissionState {
  final String? message;
  LoadingState({this.message});
}

class PermissionRequestedState extends PermissionState {
  final PermissionStatus state;

  PermissionRequestedState([this.state = PermissionStatus.notDetermined]);
}

extension PermissionStateExtension on PermissionState {
  bool get isInitial => this is PermissionInitialState;
  bool get isLoading => this is LoadingState;
  bool get isPermissionRequested => this is PermissionRequestedState;

  bool get granted {
    final e = this;
    return switch (e) {
      PermissionRequestedState() => e.state == PermissionStatus.authorized,
      _ => false,
    };
  }

  bool get denied {
    final e = this;
    return switch (e) {
      PermissionRequestedState() => e.state == PermissionStatus.denied,
      _ => false,
    };
  }
}
