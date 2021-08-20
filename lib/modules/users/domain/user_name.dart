import 'package:citacita/shared/core/guard.dart';
import 'package:citacita/shared/core/result.dart';
import 'package:equatable/equatable.dart';

class UserName extends Equatable {
  static final maxLength = 15;
  static final minLength = 1;
  final String _name;

  UserName._({required name}) : _name = name;

  @override
  List<Object> get props => [name];

  String get name => _name;

  static Result<UserName> create({required String name}) {
    var minLengthResult = Guard.againstAtLeast(minLength, name);
    if (!minLengthResult.succeeded)
      return Result.fail<UserName>(minLengthResult.message);

    var maxLengthResult = Guard.againstAtMost(maxLength, name);
    if (!maxLengthResult.succeeded) return Result.fail(maxLengthResult.message);

    return Result.ok<UserName>(UserName._(name: name));
  }
}
