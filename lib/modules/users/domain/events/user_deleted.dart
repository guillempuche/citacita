import 'package:citacita/modules/users/domain/user.dart';
import 'package:citacita/shared/domain/events/domain_events.dart';
import 'package:citacita/shared/domain/unique_entity_id.dart';

class UserDeleted implements IDomainEvent {
  DateTime dateTimeOccurred;
  User user;

  UserDeleted(this.user) : dateTimeOccurred = DateTime.now().toUtc();

  @override
  UniqueEntityId getAggregateId() => this.user.id;
}
