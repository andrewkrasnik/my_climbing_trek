import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/core/data/mixed_category.dart';
import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';

class MountainRouteRoop extends DataWithUUID {
  final ClimbingCategory? climbingCategory;
  final IceCategory? iceCategory;
  final int number;
  final int length;
  final int boltCount;
  final String anchor;
  final String description;
  final int slope;
  final List<MountainRoutePiece>? pieces;

  MountainRouteRoop({
    this.climbingCategory,
    this.iceCategory,
    required this.number,
    required this.length,
    this.slope = 0,
    this.description = '',
    this.anchor = '',
    this.boltCount = 0,
    this.pieces,
    super.id,
  });

  String get title => 'R${number - 1}-R$number';

  String get piecesText {
    List<String> text = [];

    for (var piece in pieces ?? <MountainRoutePiece>[]) {
      String value = '';

      value += '${piece.length}м';

      if (piece is MountainRouteRockPiece) {
        value += ' ${piece.categoryText}';

        if (piece.slope > 0) {
          value += ' ${piece.slope}°';
        }
      }

      text.add(value);
    }

    return text.join('; ');
  }

  String get text {
    String text = '$title:';

    if (climbingCategory != null) {
      text += ' ${climbingCategory!.name}';
    }

    text += ' $lengthм';

    if (slope > 0) {
      text += ' $slope°';
    }

    return text;
  }
}

class MountainRoutePiece {
  final int length;
  final int slope;
  final RoutePieceType type;
  MountainRoutePiece({
    required this.type,
    required this.length,
    this.slope = 0,
  });
}

class MountainRouteIcePiece extends MountainRoutePiece {
  final IceCategory category;
  MountainRouteIcePiece({
    required super.length,
    super.slope,
    required this.category,
  }) : super(type: RoutePieceType.ice);
}

class MountainRouteRockPiece extends MountainRoutePiece {
  final ClimbingCategory? climbingCategory;
  final AidCategory? aidCategory;
  final UssrClimbingCategory? ussrCategory;
  MountainRouteRockPiece({
    required super.length,
    this.aidCategory,
    this.climbingCategory,
    this.ussrCategory,
    super.slope,
  }) : super(type: RoutePieceType.rock);

  get categoryText {
    List<String> text = [];

    if (ussrCategory != null) {
      text.add(ussrCategory!.name);
    }

    if (climbingCategory != null) {
      text.add(climbingCategory!.name);
    }

    if (aidCategory != null) {
      text.add(aidCategory!.name);
    }

    return text.join(' ');
  }
}

class MountainRouteMixedPiece extends MountainRoutePiece {
  final MixedCategory category;
  MountainRouteMixedPiece({
    required this.category,
    required super.length,
    super.slope,
  }) : super(type: RoutePieceType.mixed);
}

enum RoutePieceType { ice, rock, mixed }
