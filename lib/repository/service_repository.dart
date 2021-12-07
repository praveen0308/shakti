import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shakti/model/document_request_model.dart';
import 'package:shakti/model/query_model.dart';
import 'package:shakti/model/scheme_request_model.dart';
import 'package:shakti/model/service_model.dart';
import 'package:shakti/model/service_request_model.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _requestReference = _fireStore.collection('Requests');
final CollectionReference _schemeRequestsReference =
    _fireStore.collection('scheme_requests');
final CollectionReference _serviceRequestsReference =
    _fireStore.collection('service_requests');
final CollectionReference _documentRequestsReference =
    _fireStore.collection('document_requests');

class ServiceRepository {
  static Future<List<ServiceModel>> getServices() async {
    var response1 = await _requestReference.get().then((value) => value);
    print("response >> $response1");
    List<ServiceModel> services = [];
    for (var element in response1.docs) {
      print("Element ${element.data()}");
      services.add(ServiceModel.fromSnapshot(element));
    }
    return services;
  }

  static Future<void> addNewDocumentRequest(
      DocumentRequestModel requestModel) async {
    await _documentRequestsReference
        .doc()
        .set(requestModel.toJson())
        .whenComplete(() => print("Added successfully!!!"))
        .catchError((e) => print(e));
  }

  static Future<void> addNewSchemeRequest(
      SchemeRequestModel requestModel) async {
    await _schemeRequestsReference
        .doc()
        .set(requestModel.toJson())
        .whenComplete(() => print("Added successfully!!!"))
        .catchError((e) => print(e));
  }

  static Future<void> addNewServiceRequest(
      ServiceRequestModel requestModel) async {
    await _serviceRequestsReference
        .doc()
        .set(requestModel.toJson())
        .whenComplete(() => print("Added successfully!!!"))
        .catchError((e) => print(e));
  }

  static Future<List<QueryModel>> getQueriesByUserId(String userId) async {
    var rServices = await _serviceRequestsReference
        .where("addedBy", isEqualTo: userId)
        .get();
    var rDocuments = await _documentRequestsReference
        .where("addedBy", isEqualTo: userId)
        .get();
    var rSchemes = await _schemeRequestsReference
        .where("addedBy", isEqualTo: userId)
        .get();

    List<ServiceRequestModel> services = [];
    for (var element in rServices.docs) {
      services.add(ServiceRequestModel.fromSnapshot(element));
    }

    List<DocumentRequestModel> documents = [];
    for (var element in rDocuments.docs) {
      documents.add(DocumentRequestModel.fromSnapshot(element));
    }

    List<SchemeRequestModel> schemes = [];
    for (var element in rSchemes.docs) {
      schemes.add(SchemeRequestModel.fromSnapshot(element));
    }

    List<QueryModel> queries = [];
    queries.addAll(services.map((e) => ServiceRequestModel.toQueryModel(e)));
    queries.addAll(documents.map((e) => DocumentRequestModel.toQueryModel(e)));
    queries.addAll(schemes.map((e) => SchemeRequestModel.toQueryModel(e)));

    return queries;
  }
}
