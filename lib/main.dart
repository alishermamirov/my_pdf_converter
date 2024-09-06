import 'package:flutter/material.dart';
import 'package:pdf_converter/app.dart';
import 'package:pdf_converter/helpers/storage_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper.initialize();
  runApp(const MyApp());
}
