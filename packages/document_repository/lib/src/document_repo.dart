import 'package:document_repository/src/models/document_model.dart';

abstract class DocumentRepository {
  Future<List<DocumentModel>> getRecentlyDocuments();
  Future<void> setRecentlyDocuments();
}
