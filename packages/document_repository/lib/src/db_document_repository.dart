import 'package:document_repository/src/document_repo.dart';

import 'models/models.dart';

class DbDocumentRepository implements DocumentRepository {
  @override
  Future<List<DocumentModel>> getRecentlyDocuments() async{
   return [];
  }

  @override
  Future setRecentlyDocuments() async{
   
  }
  
}