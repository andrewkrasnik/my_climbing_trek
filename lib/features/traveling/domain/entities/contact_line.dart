import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_type.dart';

class ContactLine extends DataWithUUID {
  final ContactType type;
  final String data;
  final String description;
  ContactLine({
    required this.type,
    required this.data,
    this.description = '',
    super.id,
  });
}
