import 'package:citacita/modules/users/domain/user_email.dart';
import 'package:citacita/modules/users/domain/user_id.dart';
import 'package:citacita/modules/users/domain/user_meta.dart';
import 'package:citacita/modules/users/domain/user_name.dart';
import 'package:citacita/modules/users/domain/user_profile_name.dart';
import 'package:citacita/modules/users/domain/events/user_created.dart';
import 'package:citacita/modules/users/domain/events/user_deleted.dart';
import 'package:citacita/shared/core/result.dart';
import 'package:citacita/shared/domain/aggregate_root.dart';
import 'package:citacita/shared/domain/unique_entity_id.dart';

class UserProps {
  final UniqueEntityId _id;
  final UserName _username;
  final UserProfileName _profileName;
  final UserEmail _email;
  final UserMeta _meta;
  UserProps._({id, username, profileName, email, meta})
      : _id = id,
        _username = username,
        _profileName = profileName,
        _email = email,
        _meta = meta;
}

class User extends AggregateRoot<UserProps> {
  final UniqueEntityId _id;
  final UserName _username;
  final UserProfileName _profileName;
  final UserEmail _email;
  final UserMeta _meta;

  User._({id, username, profileName, email, meta})
      : _id = id,
        _username = username,
        _profileName = profileName,
        _email = email,
        _meta = meta,
        super(UserProps props, id);

  static Result<User> create(
      {required username,
      required profileName,
      required email,
      required meta,
      id}) {
    User user = User._(
        username: username, profileName: profileName, email: email, meta: meta);

    if (!id) user.addDomainEvent(UserCreated(user));

    return Result.ok<User>(user);
  }

  get id => _id;

  get username => _username;

  get profileName => _profileName;

  get email => _email;

  get meta => _meta;

  // @override
  // List<Object> get props => <dynamic>[id, username, profileName, email, meta];

  get userId => UserId.create(this._id).getValue();

  void delete() {
    this.addDomainEvent(UserDeleted(this));
  }
}
