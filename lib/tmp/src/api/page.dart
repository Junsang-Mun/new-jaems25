import 'item.dart';

const int itemsPerPage = 10;

class ItemPage {
  final List<Product> products;
  final int startingIndex;
  final bool hasNext;

  ItemPage({
    required this.products,
    required this.startingIndex,
    required this.hasNext,
  });
}