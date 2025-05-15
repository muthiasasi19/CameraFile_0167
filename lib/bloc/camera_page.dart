import 'package:camera/camera.dart';
import 'package:camerafile/bloc/camera_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<CameraBloc>();
    if (bloc.state is! CameraReady) {
      bloc.add(InitializeCamera());
    }
  }
}
