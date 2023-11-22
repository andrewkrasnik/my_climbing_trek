import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';

import 'package:my_climbing_trek/features/treanings/domain/usecases/export_treanings_usecase.dart';
import 'package:my_climbing_trek/features/treanings/domain/usecases/import_treanings_usecase.dart';

part 'treanings_export_import_cubit.freezed.dart';
part 'treanings_export_import_state.dart';

@Injectable()
class TreaningsExportImportCubit extends Cubit<TreaningsExportImportState> {
  final ExportTreaningsUseCase _exportTreaningsUseCase;
  final ImportTreaningsUseCase _importTreaningsUseCase;

  TreaningsExportImportCubit(
    this._exportTreaningsUseCase,
    this._importTreaningsUseCase,
  ) : super(const TreaningsExportImportState.initial());

  Future<void> export({required TreaningsSettings settings}) async {
    emit(const TreaningsExportImportState.loading());

    final failureOrData = await _exportTreaningsUseCase(settings: settings);

    failureOrData.fold(
        (failure) => emit(
            TreaningsExportImportState.error(description: failure.toString())),
        (data) => emit(TreaningsExportImportState.dataExport(treanings: data)));
  }
}
