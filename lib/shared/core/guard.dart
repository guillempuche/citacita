class IGuardResult {
  bool succeeded;
  String message;

  // TODO: solve when passing Guard doesn't pass a message, then it generates a type error.
  IGuardResult(this.succeeded, [String this.message = '']);
}

class IGuardArgument {
  dynamic argument;
  String argumentName;

  IGuardArgument(this.argument, this.argumentName);
}

class Guard implements IGuardResult, IGuardArgument {
  late final bool succeeded;
  late final String message;
  late final dynamic argument;
  late final String argumentName;

  static IGuardResult againstAtLeast(int numChars, String text) {
    return text.length >= numChars
        ? IGuardResult(true)
        : IGuardResult(false, "Text is not at least ${numChars} chars.");
  }

  static IGuardResult againstAtMost(int numChars, String text) {
    return text.length <= numChars
        ? IGuardResult(true)
        : IGuardResult(false, "Text is greater than ${numChars} chars.");
  }
}
