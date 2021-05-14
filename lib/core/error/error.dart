String _errorMessage;
String get getErrorMessage => _errorMessage;
String setErrorMessage(String errorMessage) => _errorMessage = errorMessage;

class Error {
  Error({this.message});

  //Map error coming from the [API].
  Error.map(Map<String, dynamic> map) {
    message = map['message'].toString() ?? ''.toString();
  }
  String message;
}
