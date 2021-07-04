import 'package:equatable/equatable.dart';

import 'package:citacita/shared/core/result.dart';

class UserMeta extends Equatable {
  final List<String> _preferredLanguage;

  UserMeta._({preferredLanguage}) : _preferredLanguage = preferredLanguage;

  @override
  List<Object> get props => [preferredLanguage];

  List get preferredLanguage => _preferredLanguage;

  static bool _allowedLanguages(languages) {
    var allowedLanguages = ['es', 'en'];

    for (final lang in languages) {
      bool allowed = allowedLanguages.any((item) => lang == item);

      if (!allowed) return false;
    }

    return true;
  }

  static Result<UserMeta> create({var preferredLanguages}) {
    if (!_allowedLanguages(preferredLanguages))
      return Result.fail<UserMeta>(
          "Some language of ${preferredLanguages} isn't allowed");

    return Result.ok<UserMeta>(
        UserMeta._(preferredLanguage: preferredLanguages));
  }
}
