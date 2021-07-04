import 'package:citacita/shared/domain/entity.dart';
import 'package:citacita/shared/domain/events/domain_events.dart';
import 'package:citacita/shared/domain/unique_entity_id.dart';

abstract class AggregateRoot<T> extends Entity<T> {
  final UniqueEntityId _id;
  final IDomainEvent[] _domainEvents = [];

  AggregateRoot(id, domainEvents): this._id = id, this._domainEvents = domainEvents;

  UniqueEntityId get id => _id;

  get domainEvents => _domainEvents;

  void addDomainEvent(IDomainEvent domainEvent) {
    // Add the domain event to this aggregate's list of domain events
    _domainEvents.add(domainEvent);

    // Add this aggregate instance to the domain event's list of aggregates who's
    // events it eventually needs to dispatch.
    DomainEvents.markAggregateForDispatch(this);

    // Log the domain event
    this._logDomainEventAdded(domainEvent);
  }

  void clearEvents() {
    _domainEvents.removeRange(0, this._domainEvents.length);
  }


  void _logDomainEventAdded(IDomainEvent domainEvent) {
    print("[Domain Event Created]: ${this.toString()} ==> ${domainEvent.toString()}");
  }
  
  String toString();
} 