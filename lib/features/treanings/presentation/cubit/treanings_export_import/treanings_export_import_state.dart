part of 'treanings_export_import_cubit.dart';

@freezed
class TreaningsExportImportState with _$TreaningsExportImportState {
  const factory TreaningsExportImportState.initial() = _Initial;

  const factory TreaningsExportImportState.exporting() = _Exporting;

  const factory TreaningsExportImportState.importing() = _Importing;

  const factory TreaningsExportImportState.dataExport(
      {required Map<String, dynamic> treanings}) = _DataExport;

  const factory TreaningsExportImportState.dataImport(
      {required String treanings}) = _DataImport;

  const factory TreaningsExportImportState.error(
      {required String description}) = _Error;
}
