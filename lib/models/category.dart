class Category {
  final String id;
  final String name;
  final bool isSelected;

  Category({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  Category copyWith({bool? isSelected}) {
    return Category(
      id: id,
      name: name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
