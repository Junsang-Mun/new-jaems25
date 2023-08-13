import 'package:flutter/material.dart';
import 'dart:math';
import 'item.dart';
import 'page.dart';

const catalogLength = 200;

Future<ItemPage> fetchPage(int startingIndex) async {
  await Future<void>.delayed(const Duration(milliseconds: 750));

  if (startingIndex > catalogLength) {
    return ItemPage(products: [], startingIndex: startingIndex, hasNext: false);
  }

  return ItemPage(
    products: List.generate(
      min(itemsPerPage, catalogLength - startingIndex),
      (index) => Product(
        name: 'Item ${startingIndex + index}',
        price: 1000 + Random().nextInt(100000),
        count: 1 + Random().nextInt(10),
      ),
    ),
    startingIndex: startingIndex,
    hasNext: startingIndex + itemsPerPage < catalogLength,
  );
}