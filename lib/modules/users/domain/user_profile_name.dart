import 'package:citacita/shared/core/guard.dart';
import 'package:citacita/shared/core/result.dart';
import 'package:equatable/equatable.dart';

class UserProfileName extends Equatable {
  static const maxLength = 50;
  static const minLength = 1;
  final String _name;

  const UserProfileName._({required name}) : _name = name;

  @override
  List<Object> get props => [name];

  String get name => _name;

  static Result<UserProfileName> create({required String name}) {
    var minLengthResult = Guard.againstAtLeast(minLength, name);
    if (!minLengthResult.succeeded)
      return Result.fail<UserProfileName>(minLengthResult.message);

    var maxLengthResult = Guard.againstAtMost(maxLength, name);
    if (!maxLengthResult.succeeded) return Result.fail(maxLengthResult.message);

    return Result.ok<UserProfileName>(UserProfileName._(name: name));
  }
}
