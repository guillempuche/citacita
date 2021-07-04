class Result<T> {
  bool isSuccess;
  bool isFailure;
  dynamic error;
  T? _value;

  Result(this.isSuccess, [this.error, this._value])
      : this.isFailure = !isSuccess,
        assert((isSuccess && error != null) == false,
            "InvalidOperation: A result cannot be successful and contain an error"),
        assert((isSuccess == false && error == null) == false,
            "InvalidOperation: A failing result needs to contain an error message");

  T? getValue() {
    if (!isSuccess) {
      print(error);
      throw FormatException(
          "Can't get the value of an error result. Use 'errorValue' instead.");
    }

    return _value;
  }

  T errorValue() {
    return error as T;
  }

  static Result<U> ok<U>([U? value]) => Result<U>(true, null, value);

  static Result<U> fail<U>(String error) => Result<U>(false, error);

  static Result<dynamic> combine(Iterable<Result<dynamic>> results) {
    for (var result in results) {
      if (result.isFailure) return result;
    }
    return Result.ok();
  }
}

// Reference to https://github.com/stemmlerjs/ddd-forum/blob/ea39350239/public/app/src/shared/core/Either.ts
class Left<L, A> {
  L _value;

  Left(this._value);

  L get value => _value;

  bool isLeft() => true;

  bool isRight() => false;
}

class Right<L, A> {
  A _value;

  Right(this._value);

  A get value => _value;

  bool isLeft() => false;

  bool isRight() => true;
}

// export type Either<L, A> = Left<L, A> | Right<L, A>;

// export const left = <L, A>(l: L): Either<L, A> => {
//   return new Left(l);
// };

// export const right = <L, A>(a: A): Either<L, A> => {
//   return new Right<L, A>(a);
// };
