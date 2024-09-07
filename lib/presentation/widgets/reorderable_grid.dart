// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';

class ReorderableGrid extends StatefulWidget {
  List<File> images;
  const ReorderableGrid({
    super.key,
    required this.images,
  });

  @override
  State<ReorderableGrid> createState() => _ReorderableGridState();
}

class _ReorderableGridState extends State<ReorderableGrid> {
  final _scrollController = ScrollController();

  final _gridViewKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ReorderableBuilder(
      enableDraggable: true,
      scrollController: _scrollController,
      onReorder: (ReorderedListFunction reorderedListFunction) {
        widget.images = reorderedListFunction( widget.images) as List<File>;
      },
      children: List.generate(
         widget.images.length,
        (index) => Container(
          key: Key( widget.images.elementAt(index).path),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Image.file(
             widget.images.elementAt(index),
          ),
        ),
      ),
      builder: (children) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            // key: _gridViewKey,
            // controller: _scrollController,
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
    );
  }
}
