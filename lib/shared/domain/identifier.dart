class Identifier<T> {
  T _value;

  Identifier(this._value);

  bool equals([Identifier<T>? id]) {
    if (id is! Identifier) {
      return false;
    }

    return id?.toValue() == this._value;
  }

  String toString() {
    return "${this._value}";
  }

  /// Return raw value of identifier
  T toValue() {
    return this._value;
  }
}
