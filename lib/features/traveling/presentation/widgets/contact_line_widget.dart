import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_type.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactLineWidget extends StatelessWidget {
  final ContactLine contact;
  const ContactLineWidget({
    required this.contact,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SelectableText(contact.data),
      subtitle: Text(contact.description),
      trailing: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            iconFormType(contact.type),
            color: Theme.of(context).colorScheme.surface,
          ),
          onPressed: () {
            if (contact.type == ContactType.address) {
              launchUrlString('https://yandex.ru/maps/?text=${contact.data}');
            } else if (contact.type == ContactType.phone) {
              launchUrlString('tel:${contact.data}');
            } else if (contact.type == ContactType.email) {
              launchUrlString(
                'mailto:${contact.data}',
              );
            } else if (contact.type == ContactType.website) {
              launchUrlString(contact.data);
            }
          }),
    );
  }
}

class ContactParametersWidget extends HookWidget {
  final ContactLine? line;
  const ContactParametersWidget({this.line, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactType = useState<ContactType>(line?.type ?? ContactType.phone);

    final dataController = useTextEditingController(text: line?.data);

    final descriptionController =
        useTextEditingController(text: line?.description);

    final descriptionFocusNode = useFocusNode();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            if (line == null)
              Text(
                'Новый контакт',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: ContactType.values.map((type) {
                    final current = type == contactType.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                          onPressed: () {
                            contactType.value = type;
                          },
                          color: current
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context)
                                  .colorScheme
                                  .surface
                                  .withOpacity(0.5),
                          icon: Icon(
                            iconFormType(type),
                            size: 40,
                          )),
                    );
                  }).toList()),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: dataController,
              decoration: InputDecoration(
                  labelText: contactType.value.name,
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: descriptionController,
              focusNode: descriptionFocusNode,
              decoration: const InputDecoration(
                  labelText: 'Описание', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Сохранить'))
          ],
        ),
      ),
    );
  }
}

IconData iconFormType(ContactType type) {
  if (type == ContactType.address) {
    return Icons.place;
  } else if (type == ContactType.phone) {
    return Icons.phone;
  } else if (type == ContactType.email) {
    return Icons.email;
  } else if (type == ContactType.website) {
    return Icons.web;
  } else {
    return Icons.error;
  }
}
