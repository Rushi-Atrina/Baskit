enum ProductSortOption {
  none('Default'),
  priceLowHigh('Price: Low to High'),
  priceHighLow('Price: High to Low'),
  ratingHighLow('Rating: High to Low'),
  ratingLowHigh('Rating: Low to High');

  const ProductSortOption(this.label);

  final String label;
}
