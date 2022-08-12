import 'package:api/models/local/base_local_object.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LocalTree implements BaseLocalObject {
  @Id(assignable: true)
  int? id;
  String? name;
  String? address;
  String? address2;
  String? species;
  int? height;
  int? circumference;

  @override
  int getId() => id ?? 0;
}
