class Category {
  final int id;
  final String name;

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '';
  /**
   * Similar to
   * 
   * Category(this.id, this.name);
   * 
   * factory Category.fromJson(Map<String, dynamic> jsonMap) => Category(
   *    id = jsonMap['id'] ?? 0,
   *    name = jsonMap['name'] ?? '',
   *  );
   */

}
