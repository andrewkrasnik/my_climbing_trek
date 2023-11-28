import 'dart:convert';
import 'dart:developer';

import 'package:file_saver/file_saver.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:my_climbing_trek/features/treanings/presentation/cubit/treanings_export_import/treanings_export_import_cubit.dart';
import 'package:my_climbing_trek/service_locator.dart' as di;

class TreaningsExportImportWidget extends StatelessWidget {
  const TreaningsExportImportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<TreaningsExportImportCubit>(),
      child:
          BlocConsumer<TreaningsExportImportCubit, TreaningsExportImportState>(
        listener: (context, state) => state.maybeMap(
          dataExport: (exportData) async {
            final json = jsonEncode(exportData.treanings);
            String? path = await FileSaver.instance.saveAs(
              name: 'treanings',
              bytes: const Utf8Codec().encode(json),
              ext: 'json',
              mimeType: MimeType.json,
            );
            return log(path.toString());
          },
          dataImport: (importData) =>
              ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(importData.treanings),
            ),
          ),
          error: (errorData) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorData.description),
            ),
          ),
          orElse: () => null,
        ),
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  BlocProvider.of<TreaningsExportImportCubit>(context).export(
                      settings: BlocProvider.of<SettingsCubit>(context)
                          .state
                          .treaningsSettings);
                },
                child: const Text('Выгрузить'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final cubit =
                      BlocProvider.of<TreaningsExportImportCubit>(context);

                  const XTypeGroup typeGroup = XTypeGroup(
                    label: 'json files',
                    extensions: <String>['json'],
                  );
                  final XFile? file = await openFile(
                      acceptedTypeGroups: <XTypeGroup>[typeGroup]);
                  final data = await file!.readAsBytes();
                  final stringData = const Utf8Codec().decode(data);
                  final json = jsonDecode(stringData);
                  // log(json.toString());

                  cubit.import(data: json);
                },
                child: const Text('Загрузить'),
              ),
            ],
          );
        },
      ),
    );
  }
}
