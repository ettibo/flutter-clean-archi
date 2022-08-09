class Tree {
  final int? id;
  final String? name;
  final String? address;
  final String? address2;
  final String? species;
  final int? height;
  final int? circumference;

  Tree(
      {required this.id,
      required this.name,
      required this.address,
      required this.address2,
      required this.species,
      required this.height,
      required this.circumference});

  static final Tree mock = Tree(
      id: 0,
      name: 'Pommier',
      address: "rue Victor Hugo",
      address2: "24",
      species: 'Pomm',
      height: 3,
      circumference: 40);
}
