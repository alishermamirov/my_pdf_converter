
class DocumentEntity {
  final String id;
  final String title;
  final String path;

  const DocumentEntity({
    required this.id,
    required this.title,
    required this.path,
  });

  Map<String, dynamic> toDocument() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'path': path,
    };
  }

  DocumentEntity fromDocument(Map<String, dynamic> data) {
    return DocumentEntity(
      id: data['id'] as String,
      title: data['title'] as String,
      path: data['path'] as String,
    );
  }
}
