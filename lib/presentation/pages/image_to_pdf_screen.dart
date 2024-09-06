import 'dart:io';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:pdf_converter/constants/colors_constants.dart';
import 'package:pdf_converter/logic/bloc/convert_pdf_bloc.dart';
import 'package:pdf_converter/presentation/widgets/custom_app_bar.dart';
import 'package:pdf_converter/presentation/widgets/custom_button.dart';

class ImageToPdfScreen extends StatefulWidget {
  const ImageToPdfScreen({super.key});

  @override
  State<ImageToPdfScreen> createState() => _ImageToPdfScreenState();
}

class _ImageToPdfScreenState extends State<ImageToPdfScreen> {
  TextEditingController fileNameController = TextEditingController();
  final _scrollController = ScrollController();
  final _gridViewKey = GlobalKey();

  List<File> images = [];

  Future<void> imagePick() async {
    final ImagePicker picker = ImagePicker();
    List<XFile?> pickedImages = await picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      setState(
        () {
          for (var image in pickedImages) {
            if (image != null) {
              images.add(File(image.path));
            }
          }
        },
      );
    }
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: fileNameController,
                decoration: const InputDecoration(
                  labelText: "Fayl nomi",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                ontap: fileNameController.text.isNotEmpty
                    ? () async {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          Navigator.pop(context);

                          context.read<ConvertPdfBloc>().add(
                                OnConvertImageToPdf(
                                    title: fileNameController.text.toString(),
                                    images: images),
                              );
                        });
                      }
                    : () {},
                title: "Saqlash",
                color: mainColor,
                textColor: Colors.white,
                borderColor: mainColor,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
  
    fileNameController.dispose();
    _scrollController.dispose();
    images.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
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
      body: BlocConsumer<ConvertPdfBloc, ConvertPdfState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ConvertPdfloading) {
            return Center(
              child: SizedBox(
                width: 180,
                height: 180,
                child: Lottie.asset(

                    // repeat: false,
                    frameRate: FrameRate.max,
                    "assets/lotties/loading2.json"),
              ),
            );
          } else if (state is ConvertPdfSucces) {
            return Center(
              child: SizedBox(
                width: 180,
                height: 180,
                child: Lottie.asset(
                    repeat: false,
                    frameRate: FrameRate.max,
                    "assets/lotties/check.json"),
              ),
            );
          } else if (state is ConvertPdfInitial) {
            if (images.isEmpty) {
              return BouncingWidget(
                onPressed: () async {
                  await imagePick();
                },
                duration: const Duration(milliseconds: 100),
                scaleFactor: 1.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(
                      top: 16, right: 16, left: 16, bottom: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Ionicons.image_outline,
                        color: Colors.grey,
                        size: 100,
                      ),
                      Text(
                        "Select image",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ReorderableBuilder(
                      enableDraggable: true,
                      scrollController: _scrollController,
                      onReorder: (ReorderedListFunction reorderedListFunction) {
                        setState(() {
                          images = reorderedListFunction(images) as List<File>;
                        });
                      },
                      children: List.generate(
                        images.length,
                        (index) => Container(
                          key: Key(images.elementAt(index).path),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Image.file(
                            images.elementAt(index),
                          ),
                        ),
                      ),
                      builder: (children) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView(
                            key: _gridViewKey,
                            controller: _scrollController,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 250,
                              childAspectRatio: 3 / 4,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                            ),
                            children: children,
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomButton(
                            ontap: () {
                              setState(() {
                                images.clear();
                              });
                            },
                            title: "Bekor qilish",
                            color: Colors.white,
                            textColor: mainColor,
                            borderColor: mainColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CustomButton(
                            ontap: () {
                              showBottomSheet();
                            },
                            title: "Davom etish",
                            textColor: Colors.white,
                            color: mainColor,
                            borderColor: mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          } else if (state is ConvertPdfError) {
            return Center(
              child: Text("Xatolik ${state.message}"),
            );
          }
          ;
          return const SizedBox();
        },
      ),
    );
  }
}
