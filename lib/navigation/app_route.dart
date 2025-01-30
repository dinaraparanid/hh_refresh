enum AppRoute {
  root(path: '/root'),
  intro(path: '/intro'),
  intro1(path: '/intro/1'),
  intro2(path: '/intro/2'),
  main(path: '/main');

  final String path;
  const AppRoute({required this.path});
}
