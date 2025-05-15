part of 'camera_bloc.dart';

sealed class CameraEvent {}

final class InitializeCamera extends CameraEvent {}

final class SwitchCamera extends CameraEvent {}

final class ToggleFlash extends CameraEvent {}
