bool validateEmailAddress(String input) {
  RegExp emailRegex = RegExp(
      r'((([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,})))');

  if (emailRegex.hasMatch(input)) {
    return true;
  } else {
    return false;
  }
}
