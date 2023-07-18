import 'package:my_climbing_trek/features/traveling/domain/entities/contact_type.dart';

class ContactLine {
  final ContactType type;
  final String data;
  final String description;
  ContactLine({
    required this.type,
    required this.data,
    this.description = '',
  });
}
