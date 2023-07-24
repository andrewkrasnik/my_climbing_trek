import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class ContactType extends DataWithUUID {
  final String name;
  ContactType({required this.name, super.id});

  static final phone = ContactType(name: 'Телефон', id: 'phone');

  static final email = ContactType(name: 'e-mail', id: 'email');

  static final address = ContactType(name: 'Адрес', id: 'address');

  static final website = ContactType(name: 'Сайт', id: 'website');

  static final Map<String, ContactType> _values = {
    phone.id: phone,
    email.id: email,
    address.id: address,
    website.id: website,
  };

  static List<ContactType> get values => _values.values.toList();

  static ContactType getById(String id) => _values[id]!;
}
