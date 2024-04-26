import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/map_point.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_poin_feature.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/delete_trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/delete_trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/get_trek_points.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/get_treks.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/save_trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/save_trek_point.dart';

part 'treks_state.dart';
part 'treks_cubit.freezed.dart';

@Injectable()
class TreksCubit extends Cubit<TreksState> {
  final GetTreks _getTreks;
  final GetTrekPoints _getTrekPoints;
  final DeleteTrekPoint _deleteTrekPoint;
  final DeleteTrek _deleteTrek;
  final SaveTrek _saveTrek;
  final SaveTrekPoint _saveTrekPoint;

  TreksCubit(
    this._getTreks,
    this._getTrekPoints,
    this._deleteTrek,
    this._deleteTrekPoint,
    this._saveTrek,
    this._saveTrekPoint,
  ) : super(const TreksState.initial());

  Future<void> loadData({required Region region}) async {
    emit(const TreksState.loading());

    final failureOrTreks = await _getTreks(region: region);

    failureOrTreks.fold(
      (failure) => emit(TreksState.error(description: failure.toString())),
      (treks) async {
        emit(TreksState.data(treks: treks, points: []));

        final failureOrPoints = await _getTrekPoints(region: region);

        failureOrPoints.fold(
          (failure) => emit(TreksState.error(description: failure.toString())),
          (points) => emit(TreksState.data(treks: treks, points: points)),
        );
      },
    );
  }

  Future<void> saveTrekPoint({
    required Region region,
    required String name,
    required MapPoint? mapPoint,
    required int altitude,
    required TrekPointType type,
    required List<TrekPointFeature> features,
    required String description,
    required String id,
    required String? image,
  }) async {
    emit(const TreksState.loading());

    final failureOrUnit = await _saveTrekPoint(
      region: region,
      name: name,
      type: type,
      altitude: altitude,
      description: description,
      features: features,
      id: id,
      image: image,
      mapPoint: mapPoint,
    );

    failureOrUnit.fold(
      (failure) => emit(TreksState.error(description: failure.toString())),
      (_) => loadData(region: region),
    );
  }

  Future<void> saveTrek({
    required Region region,
    required String name,
    required TrekkingType type,
    required String id,
    required String? image,
    required List<TrekSection> sections,
    required String? mapImage,
    required List<String> links,
  }) async {
    emit(const TreksState.loading());

    final failureOrUnit = await _saveTrek(
      name: name,
      type: type,
      id: id,
      image: image,
      region: region,
      sections: sections,
      links: links,
      mapImage: mapImage,
    );

    failureOrUnit.fold(
      (failure) => emit(TreksState.error(description: failure.toString())),
      (_) => loadData(region: region),
    );
  }

  Future<void> deleteTrekPoint({
    required Region region,
    required TrekPoint point,
  }) async {
    emit(const TreksState.loading());

    final failureOrUnit = await _deleteTrekPoint(region: region, point: point);

    failureOrUnit.fold(
      (failure) => emit(TreksState.error(description: failure.toString())),
      (_) => loadData(region: region),
    );
  }

  Future<void> deleteTrek({
    required Region region,
    required Trek trek,
  }) async {
    emit(const TreksState.loading());

    final failureOrUnit = await _deleteTrek(
      region: region,
      trek: trek,
    );

    failureOrUnit.fold(
      (failure) => emit(TreksState.error(description: failure.toString())),
      (_) => loadData(region: region),
    );
  }
}
