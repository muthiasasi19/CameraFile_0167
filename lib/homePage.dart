import 'dart:io';
import 'package:camerafile/camera_page.dart';
import 'package:camerafile/storage/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class FullPage extends StatefulWidget {
  const FullPage({super.key});

  @override
  State<FullPage> createState() => _FullPageState();
}

class _FullPageState extends State<FullPage> {
  File? _imageFile;

  Future<void> _requestPermission() async {
    await Permission.camera.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  Future<void> _takePicture() async {
    await _requestPermission();
    final File? result = await Navigator.push<File?>(
      context,
      MaterialPageRoute(builder: (_) => const CameraPage()),
    );
    if (result != null) {
      final saved = await StorageHelper.saveImage(result, 'camera');
      setState(() => _imageFile = saved);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Disimpan ${saved.path}')));
    }
  }

  Future<void> _pickFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final saved = await StorageHelper.saveImage(File(picked.path), 'gallery');
      setState(() => _imageFile = saved);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Disalin ${saved.path}')));
    }
  }
}
