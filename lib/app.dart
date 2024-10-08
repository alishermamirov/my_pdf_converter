import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pdf_converter/logic/image_to_pdf/convert_pdf_bloc.dart';
import 'package:pdf_converter/logic/select_images/select_images_bloc.dart';
import 'package:pdf_converter/logic/theme/theme_bloc.dart';
import 'package:pdf_converter/presentation/pages/home_sceen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConvertPdfBloc(),
        ),
        BlocProvider(
          create: (context) => SelectImagesBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeSceen(),
      ),
    );
  }
}
