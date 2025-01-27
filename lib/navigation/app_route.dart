enum AppRoute {
  intro(path: '/intro'),
  main(path: '/main');

  final String path;
  const AppRoute({required this.path});
}
