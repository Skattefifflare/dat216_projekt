// ignore_for_file: constant_identifier_names

enum ProductCategory {
  POD,
  BREAD,
  BERRY,
  CITRUS_FRUIT,
  HOT_DRINKS,
  COLD_DRINKS,
  EXOTIC_FRUIT,
  FISH,
  VEGETABLE_FRUIT,
  CABBAGE,
  MEAT,
  DAIRIES,
  MELONS,
  FLOUR_SUGAR_SALT,
  NUTS_AND_SEEDS,
  PASTA,
  POTATO_RICE,
  ROOT_VEGETABLE,
  FRUIT,
  SWEET,
  HERB,
  UNDEFINED,
}

enum GeneralProductCategory {
  // Has to stay first for UI to work
  ALL(
    title: 'Allt',
    description: 'Hela sortimentet',
    image: 'Image-not-found.png',
    subCategories: ProductCategory.values,
  ),
  MEAT(
    title: 'Kött',
    description: 'Saftigt och proteinrikt',
    image: 'meat.jpg',
    subCategories: [ProductCategory.MEAT, ProductCategory.FISH],
  ),
  VEGETABLE(
    title: 'Grönsaker',
    description: 'Krispigt och fyllt av vitaminer',
    image: 'vegetables.jpg',
    subCategories: [
      ProductCategory.CABBAGE,
      ProductCategory.ROOT_VEGETABLE,
      ProductCategory.VEGETABLE_FRUIT,
      ProductCategory.HERB,
      ProductCategory.POD,
    ],
  ),
  FRUIT(
    title: 'Frukt',
    description: 'Söta och fräscha',
    image: 'fruits.jpg',
    subCategories: [
      ProductCategory.FRUIT,
      ProductCategory.BERRY,
      ProductCategory.CITRUS_FRUIT,
      ProductCategory.EXOTIC_FRUIT,
      ProductCategory.MELONS,
    ],
  ),
  DAIRIES(
    title: 'Mejeri',
    description: 'Krämigt för matlagning och bak',
    image: 'dairy.jpg',
    subCategories: [ProductCategory.DAIRIES],
  ),
  CARBOHYDRATES(
    title: 'Kolhydrater',
    description: 'Energi för långa dagar',
    image: 'pasta.jpg',
    subCategories: [
      ProductCategory.BREAD,
      ProductCategory.PASTA,
      ProductCategory.POTATO_RICE,
      ProductCategory.FLOUR_SUGAR_SALT,
    ],
  );

  const GeneralProductCategory({
    required this.title,
    required this.description,
    required this.image,
    required this.subCategories,
  });

  final String title;
  final String description;
  final String image;
  final List<ProductCategory> subCategories;
}

class Product {
  int productId;
  ProductCategory category;
  String name;
  bool isEcological;
  double price;
  String unit;
  String imageName;

  Product(
    this.productId,
    this.category,
    this.name,
    this.isEcological,
    this.price,
    this.unit,
    this.imageName,
  );

  Product.fromJson(Map<String, dynamic> json)
    : productId = json[_idKey],
      category = _category(json[_catKey]),
      name = json[_nameKey],
      isEcological = json[ecoKey],
      price = json[_priceKey],
      unit = json[_unitKey],
      imageName = json[_imageKey];

  Map<String, dynamic> toJson() => {
    _idKey: productId,
    _catKey: category.name,
    _nameKey: name,
    'isEcological': isEcological, // Fix to be able to match Jav class on server
    _priceKey: price,
    _unitKey: unit,
    _imageKey: imageName,
  };

  // Labels relevant for filtering
  Set<String> get activeLabels => {if (isEcological) ecoKey};

  static const _idKey = 'productId';
  static const _catKey = 'category';
  static const _nameKey = 'name';
  static const ecoKey = 'ecological';
  static const _priceKey = 'price';
  static const _unitKey = 'unit';
  static const _imageKey = 'imageName';

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    final Product otherProduct = other as Product;
    return productId == otherProduct.productId;
  }
}

ProductCategory _category(String cat) {
  switch (cat) {
    case 'POD':
      return ProductCategory.POD;
    case 'BREAD':
      return ProductCategory.BREAD;
    case 'BERRY':
      return ProductCategory.BERRY;
    case 'CITRUS_FRUIT':
      return ProductCategory.CITRUS_FRUIT;
    case 'HOT_DRINKS':
      return ProductCategory.HOT_DRINKS;
    case 'COLD_DRINKS':
      return ProductCategory.COLD_DRINKS;
    case 'EXOTIC_FRUIT':
      return ProductCategory.EXOTIC_FRUIT;
    case 'FISH':
      return ProductCategory.FISH;
    case 'VEGETABLE_FRUIT':
      return ProductCategory.VEGETABLE_FRUIT;
    case 'CABBAGE':
      return ProductCategory.CABBAGE;
    case 'MEAT':
      return ProductCategory.MEAT;
    case 'DAIRIES':
      return ProductCategory.DAIRIES;
    case 'MELONS':
      return ProductCategory.MELONS;
    case 'FLOUR_SUGAR_SALT':
      return ProductCategory.FLOUR_SUGAR_SALT;
    case 'NUTS_AND_SEEDS':
      return ProductCategory.NUTS_AND_SEEDS;
    case 'PASTA':
      return ProductCategory.PASTA;
    case 'POTATO_RICE':
      return ProductCategory.POTATO_RICE;
    case 'ROOT_VEGETABLE':
      return ProductCategory.ROOT_VEGETABLE;
    case 'FRUIT':
      return ProductCategory.FRUIT;
    case 'SWEET':
      return ProductCategory.SWEET;
    case 'HERB':
      return ProductCategory.HERB;
  }
  return ProductCategory.UNDEFINED;
}
