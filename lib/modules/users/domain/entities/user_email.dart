import 'package:citacita/shared/core/result.dart';
import 'package:citacita/shared/domain/validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

// Reference to:
// - https://github.com/felangel/equatable/blob/master/example/main.dart
// - https://github.com/stemmlerjs/ddd-forum/blob/master/src/modules/users/domain/userEmail.ts
class UserEmail extends Equatable {
  final String _value;

  const UserEmail({@required value}) : _value = value;

  @override
  List<Object> get props => [value];

  String get value => _value;

  static isValidEmail(String email) {
    return validateEmailAddress(email);
  }

  static String _format(String email) {
    return email.trim().toLowerCase();
  }

  static Result<UserEmail> create(String email) {
    if (isValidEmail(email))
      return Result.fail<UserEmail>("Email address not valid");

    return Result.ok<UserEmail>(UserEmail(value: _format(email)));
  }
}
