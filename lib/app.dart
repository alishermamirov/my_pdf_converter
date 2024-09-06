import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_converter/logic/bloc/convert_pdf_bloc.dart';
import 'package:pdf_converter/presentation/pages/tab_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConvertPdfBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TabScreen(),
      ),
    );
  }
}
