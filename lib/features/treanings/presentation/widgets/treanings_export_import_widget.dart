import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_saver/file_saver.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TreaningsExportImportWidget extends StatelessWidget {
  const TreaningsExportImportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () async {
            final json = jsonEncode({'treaning': 'test'});
            String? path = await FileSaver.instance.saveAs(
                name: 'treanings',
                bytes: Uint8List.fromList(json.codeUnits),
                ext: 'json',
                mimeType: MimeType.json);
            log(path.toString());
          },
          child: const Text('Экспорт'),
        ),
        ElevatedButton(
          onPressed: () async {
            const XTypeGroup typeGroup = XTypeGroup(
              label: 'json files',
              extensions: <String>['json'],
            );
            final XFile? file =
                await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);

            log(await file!.readAsString());
          },
          child: const Text('Импорт'),
        ),
      ],
    );
  }
}
