import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class ContactType extends DataWithUUID {
  final String name;
  ContactType({required this.name, super.id});

  static final phone = ContactType(name: 'Телефон', id: 'phone');

  static final Map<String, ContactType> _values = {
    phone.id: phone,
  };

  static List<ContactType> get values => _values.values.toList();

  static ContactType getById(String id) => _values[id]!;
}
