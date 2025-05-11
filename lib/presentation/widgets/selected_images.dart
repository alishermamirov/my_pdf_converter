// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';

import 'package:pdf_converter/presentation/widgets/custom_button.dart';

import '../../constants/colors_constants.dart';
import '../../logic/image_to_pdf/convert_pdf_bloc.dart';
import '../../logic/select_images/select_images_bloc.dart';

class SelectedImages extends StatefulWidget {
  final List<File> images;
  const SelectedImages({
    super.key,
    required this.images,
  });

  @override
  State<SelectedImages> createState() => _SelectedImagesState();
}

class _SelectedImagesState extends State<SelectedImages> {
  TextEditingController fileNameController = TextEditingController();

  final _scrollController = ScrollController();

  final _gridViewKey = GlobalKey();

  void save(BuildContext ctx) {
    if (fileNameController.text.isNotEmpty) {
      Navigator.of(ctx).pop();

      context.read<ConvertPdfBloc>().add(
            OnConvertImageToPdf(
              title: fileNameController.text.toString(),
              images: images,
            ),
          );
    }
  }

  void showBottomSheet(BuildContext context, List<File> images) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
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
                  labelText: "Fayl nomini kiriting",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                ontap: () {
                  FocusScope.of(context).unfocus();
                  save(ctx);
                },
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

  List<File> images = [];
  @override
  void initState() {
    images = widget.images;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ReorderableBuilder(
            enableDraggable: true,
            scrollController: _scrollController,
            onReorder: (ReorderedListFunction reorderedListFunction) {
              images = reorderedListFunction(images) as List<File>;
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
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
                    context.read<SelectImagesBloc>().add(onInitial());
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
                    showBottomSheet(context, images);
                  },
                  title: "Keyingisi",
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
}
