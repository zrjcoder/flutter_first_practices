enum HttpFailure {
  notFound('404 not found'),
  unknown('unknown error');

  final String description;
  const HttpFailure(this.description);
}
