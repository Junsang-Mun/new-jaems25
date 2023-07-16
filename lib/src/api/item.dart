class Product {
  final String name;
  final int price;
  final int count;

  Product({
    required this.name,
    required this.price,
    required this.count,
  });

  Product.loading() : this(name:'...', price: 0, count: 0, startingIndex: 0);

  bool get isLoading => name == '...';
}