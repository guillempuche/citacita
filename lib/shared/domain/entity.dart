import 'package:equatable/equatable.dart';

import 'package:citacita/shared/domain/unique_entity_id.dart';

abstract class Entity<T> extends Equatable {
  final UniqueEntityId? _id;
  final T _props;

  Entity(this._props, this._id);

  UniqueEntityId get id => _id ?? UniqueEntityId();

  @override
  List<dynamic> get props => [_props];
}
