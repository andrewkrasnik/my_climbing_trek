import 'package:my_climbing_trek/core/data/unique_id.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

class DataWithUUID extends Equatable {
  final UniqueId _id;
  final bool localData;

  String get id => _id.value;

  DataWithUUID({
    String id = '',
    this.localData = false,
  }) : _id = UniqueId.fromUniqueString(id);

  static List<DataWithUUID> values = [];

  static DataWithUUID? getById({required String id}) =>
      values.firstWhereOrNull((element) => element.id == id);

  @override
  List<Object?> get props => [id];
}
