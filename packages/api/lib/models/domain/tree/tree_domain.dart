import 'package:api/models/app/tree/tree.dart';
import 'package:api/models/remote/tree/tree_list_response.dart';

extension RecordDataToDomain on Fields {
  Tree toDomain() => Tree(
      id: idbase,
      name: libellefrancais,
      address: adresse,
      address2: complementadresse,
      species: espece,
      height: hauteurenm,
      circumference: circonferenceencm);
}

extension TreeListResponseDataToDomain on TreeListResponse {
  List<Tree> toDomain() {
    List<Tree> trees = [];
    records?.forEach((element) {
      Fields? fields = element.fields;
      if (fields != null) {
        trees.add(fields.toDomain());
      }
    });
    return trees;
  }
}
