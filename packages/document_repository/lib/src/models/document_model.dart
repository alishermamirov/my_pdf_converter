import 'package:document_repository/src/entities/document_entity.dart';
import 'package:equatable/equatable.dart';

class DocumentModel extends Equatable {
  final String id;
  final String title;
  final String path;

  const DocumentModel({
    required this.id,
    required this.title,
    required this.path,
  });

  static var empty = const DocumentModel(
    id: "",
    title: "",
    path: "",
  );

  DocumentModel copyWith({
    String? id,
    String? title,
    String? path,
  }) {
    return DocumentModel(
      id: id ?? this.id,
      title: title ?? this.title,
      path: path ?? this.path,
    );
  }

  DocumentEntity toEntity() {
    return DocumentEntity(
      id: id,
      title: title,
      path: path,
    );
  }

  static DocumentModel fromEntity(DocumentEntity entity) {
    return DocumentModel(
      id: entity.id,
      title: entity.title,
      path: entity.path,
    );
  }

  @override
  List<Object?> get props => [id, title, path];
}
