import 'dart:async';

//pembuatan dan pengisian kelas product
class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

//pembuatan dan pengisian kelas catalog
class Catalog {
  final List<Product> products;

  Catalog(this.products);

  Future<List<Product>> search(String keyword) async {
    print('Searching for products with keyword: $keyword');
    await Future.delayed(Duration(seconds: 2)); // mensimulasikan waktu pencarian
    final results = products.where((product) => product.name.contains(keyword)).toList();
    return results;
  }
}

//pembuatan dan pengisian kelas shopper
class Shopper {
  final String name;

  Shopper(this.name);

  Future<void> searchAndDisplay(Catalog catalog, String keyword) async {
    print('$name is searching for products...');
    final searchResults = await catalog.search(keyword);
    if (searchResults.isNotEmpty) {
      print('Search results for "$keyword":');
      searchResults.forEach((product) {
        print('${product.name}: \$${product.price.toStringAsFixed(2)}');
      });
    } else {
      print('No products found for "$keyword".');
    }
  }
}

void main() {
  final catalogProducts = [
    Product('Laptop', 899.99),
    Product('Smartphone', 599.99),
    Product('Headphones', 99.99),
    Product('Tablet', 399.99),
  ];

  final catalog = Catalog(catalogProducts);
  final shopper = Shopper('Alice');

  final searchKeyword = 'Phone';
  shopper.searchAndDisplay(catalog, searchKeyword);
}
