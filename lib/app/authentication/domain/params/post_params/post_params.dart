class EmailPasswordParams {
  EmailPasswordParams({
    this.email,
    this.password,
  });

  final String email;
  final String password;

  @override
  String toString() =>
      // ignore: lines_longer_than_80_chars
      '$runtimeType($email, $password)';
}
