import 'package:climbing_diary/core/data/unique_id.dart';
import 'package:collection/collection.dart';

class DataWithUUID {
  final UniqueId _id;

  String get id => _id.value;

  DataWithUUID({String id = ''}) : _id = UniqueId.fromUniqueString(id);

  static List<DataWithUUID> values = [];

  static DataWithUUID? getById({required String id}) =>
      values.firstWhereOrNull((element) => element.id == id);
}
