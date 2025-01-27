enum AppRoute {
  root(path: '/root'),
  intro(path: '/intro'),
  main(path: '/main');

  final String path;
  const AppRoute({required this.path});
}
