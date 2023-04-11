class AddProductModel {
  AddProductModel({
      dynamic  name, 
      dynamic  barcode, 
      dynamic  description, 
      dynamic  image, 
      dynamic  price,}){
    _name = name;
    _barcode = barcode;
    _description = description;
    _image = image;
    _price = price;
}

  AddProductModel.fromJson(dynamic json) {
    _name = json['name'];
    _barcode = json['barcode'];
    _description = json['description'];
    _image = json['image'];
    _price = json['price'];
  }
  dynamic  _name;
  dynamic  _barcode;
  dynamic  _description;
  dynamic  _image;
  dynamic  _price;
AddProductModel copyWith({  dynamic  name,
  dynamic  barcode,
  dynamic  description,
  dynamic  image,
  dynamic  price,
}) => AddProductModel(  name: name ?? _name,
  barcode: barcode ?? _barcode,
  description: description ?? _description,
  image: image ?? _image,
  price: price ?? _price,
);
  dynamic  get name => _name;
  dynamic  get barcode => _barcode;
  dynamic  get description => _description;
  dynamic  get image => _image;
  dynamic  get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['barcode'] = _barcode;
    map['description'] = _description;
    map['image'] = _image;
    map['price'] = _price;
    return map;
  }

}