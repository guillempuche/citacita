import 'package:citacita/shared/core/result.dart';
import 'package:citacita/shared/domain/entity.dart';
import 'package:citacita/shared/domain/unique_entity_id.dart';

class UserId extends Entity {
  final UniqueEntityId _id;

  UserId._(this._id) : super(null, _id);

  // @override
  // UniqueEntityId? get id => _id;

  static Result<UserId> create(UniqueEntityId id) {
    return Result.ok<UserId>(UserId._(id));
  }

  UniqueEntityId get id => _id;
}
