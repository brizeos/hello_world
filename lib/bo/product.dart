class ProductCustom{
  int id;
  String name;
  String description;
  String imageUrl;
  num price = 0;

  ProductCustom(this.id, this.name, this.description, this.imageUrl, this.price);

  String showPrice() => '$price €';


  ProductCustom.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['title'],
        description = json['description'],
        imageUrl = json['image'],
        price = json['price'];


  ProductCustom.fromOffJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['title']['product_name_fr'],
        description = json['description'],
        imageUrl = json['image'],
        price = json['price'];


}