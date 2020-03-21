class Genres {
  final String name;
  const Genres._(this.name);


  static const home = const Genres._('Дом. Досуг. Кулинария');
  static const bio = const Genres._('Биографии. Мемуары');
  static const world = const Genres._('Энциклопедии');
  static const myphs = const Genres._('Мифы. Легенды. Эпос');
  static const polytycs = const Genres._('Политика. Право. Государство');

  static const rus_lit = const Genres._('Русская классическая и современная литература');
  static const learn_lit = const Genres._('Учебная и обучающая литература');

  static const values = const [
    home,
    bio,
  world,
  myphs,
  polytycs,
  rus_lit,
  learn_lit,
  ];

}
