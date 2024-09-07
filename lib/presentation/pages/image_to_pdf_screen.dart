import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pdf_converter/helpers/share_helper.dart';
import 'package:pdf_converter/logic/image_to_pdf/convert_pdf_bloc.dart';
import 'package:pdf_converter/presentation/widgets/convert_images.dart';
import 'package:pdf_converter/presentation/widgets/custom_app_bar.dart';
import 'package:pdf_converter/presentation/widgets/custom_button.dart';
import 'package:pdf_converter/presentation/widgets/loading_widget.dart';
import 'package:pdf_converter/presentation/widgets/success_widget.dart';

import '../../logic/select_images/select_images_bloc.dart';

class ImageToPdfScreen extends StatefulWidget {
  const ImageToPdfScreen({super.key});

  @override
  State<ImageToPdfScreen> createState() => _ImageToPdfScreenState();
}

class _ImageToPdfScreenState extends State<ImageToPdfScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ConvertPdfBloc>().add(ToInitialEvent());
    context.read<SelectImagesBloc>().add(onInitial());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(
        context: context,
        title: "Image to PDF",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<ConvertPdfBloc, ConvertPdfState>(
        builder: (context, state) {
          if (state is ConvertPdfloading) {
            return const LoadingWidget();
          } else if (state is ConvertPdfSucces) {
            return Stack(
              children: [
                const SuccessWidget(),
                Positioned(
                  bottom: 40,
                  left: 16,
                  right: 16,
                  child: Column(
                    children: [
                      CustomButton(
                        ontap: () {
                          context
                              .read<ConvertPdfBloc>()
                              .add(OnOpenConvertedPdf(file: state.file));
                        },
                        title: "Open file",
                        color: Colors.green,
                        textColor: Colors.white,
                        borderColor: Colors.green,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                        ontap: () async {
                          ShareHelper.shareFile(state.file, state.title);
                        },
                        title: "Share",
                        color: Colors.white,
                        textColor: Colors.green,
                        borderColor: Colors.green,
                      ),
                    ],
                  ),
                )
              ],
            );
          } else if (state is ConvertPdfInitial) {
            return const ConvertImages();
          } else if (state is ConvertPdfError) {
            return Center(
              child: Text("Error: ${state.message}"),
            );
          }
          ;
          return const SizedBox();
        },
      ),
    );
  }
}
