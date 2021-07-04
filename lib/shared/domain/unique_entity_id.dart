import 'package:uuid/uuid.dart';

import 'package:citacita/shared/domain/identifier.dart';

class UniqueEntityId extends Identifier<dynamic> {
  String? id;

  UniqueEntityId([this.id]) : super(id ?? const Uuid().v4());

  // factory UniqueEntityId() {
  //   return UniqueEntityId()
  // }
}
