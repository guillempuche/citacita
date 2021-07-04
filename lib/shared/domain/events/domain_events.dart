import 'package:citacita/shared/domain/aggregate_root.dart';
import 'package:citacita/shared/domain/unique_entity_id.dart';

// Reference https://github.com/dart-lang/language/issues/783
abstract class IDomainEvent {
  DateTime dateTimeOccurred;

  IDomainEvent(this.dateTimeOccurred);

  UniqueEntityId getAggregateId();

  @override
  String toString();
}

class DomainEvents {
  late Map<String, List> _handlersMap = {};
  List<AggregateRoot<dynamic>> markedAggregates = [];

  DomainEvents._(this._handlersMap, this.markedAggregates);

  void markAggregateForDispatch(AggregateRoot<dynamic> aggregate) {
    var aggregateFound =
        this.findMarkedAggregateById(aggregate.id) != null ? true : false;

    if (!aggregateFound) this.markedAggregates.add(aggregate);
  }

  void dispatchAggregateEvents(AggregateRoot<dynamic> aggregate) {
    aggregate.domainEvents
        .forEach((IDomainEvent event) => this.dispatch(event));
  }

  void removeAggregateFromMarkedDispatchList(AggregateRoot<dynamic> aggregate) {
    var index = this.markedAggregates.indexOf(aggregate);

    this.markedAggregates.removeAt(index);
  }

  AggregateRoot<dynamic>? findMarkedAggregateById(UniqueEntityId id) {
    var found = null;

    for (var aggregate in this.markedAggregates) {
      if (aggregate.id == id) found = aggregate;
    }

    return found;
  }

  void dispatchEventsForAggregate(UniqueEntityId id) {
    AggregateRoot<dynamic>? aggregate = this.findMarkedAggregateById(id);

    if (aggregate != null) {
      this.dispatchAggregateEvents(aggregate);
      aggregate.clearEvents();
      this.removeAggregateFromMarkedDispatchList(aggregate);
    }
  }

  void register(
      void Function(IDomainEvent event) callback, String eventClassName) {
    if (!this._handlersMap.containsKey(eventClassName)) {
      this._handlersMap[eventClassName] = [];
    }

    _handlersMap[eventClassName]?.add(callback);
  }

  void clearHandlers() {
    this._handlersMap = {};
  }

  void clearMarkedAggregates() {
    this.markedAggregates = [];
  }

  // TODO: I don't know the use of this method, neither undestant the reference
  // in https://github.com/stemmlerjs/ddd-forum/blob/ea39350239/src/shared/domain/events/DomainEvents.ts#L71
  void dispatch(IDomainEvent event) {}
}
