class ProductListModel {
  ProductListModel({
      dynamic  id,
      dynamic  name,
      dynamic  barcode,
      dynamic  description,
      SubCategory? subCategory,
      Brand? brand,
      Quantity? quantity,
      ProductPrice? productPrice,
      dynamic  image,}){
    _id = id;
    _name = name;
    _barcode = barcode;
    _description = description;
    _subCategory = subCategory;
    _brand = brand;
    _quantity = quantity;
    _productPrice = productPrice;
    _image = image;
}
  ProductListModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _barcode = json['barcode'];
    _description = json['description'];
    _subCategory = json['subCategory'] != null ? SubCategory.fromJson(json['subCategory']) : null;
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _quantity = json['quantity'] != null ? Quantity.fromJson(json['quantity']) : null;
    _productPrice = json['productPrice'] != null ? ProductPrice.fromJson(json['productPrice']) : null;
    _image = json['image'];
  }
  dynamic  _id;
  dynamic  _name;
  dynamic  _barcode;
  dynamic  _description;
  SubCategory? _subCategory;
  Brand? _brand;
  Quantity? _quantity;
  ProductPrice? _productPrice;
  dynamic  _image;
ProductListModel copyWith({  dynamic  id,
  dynamic  name,
  dynamic  barcode,
  dynamic  description,
  SubCategory? subCategory,
  Brand? brand,
  Quantity? quantity,
  ProductPrice? productPrice,
  dynamic  image,
}) => ProductListModel(  id: id ?? _id,
  name: name ?? _name,
  barcode: barcode ?? _barcode,
  description: description ?? _description,
  subCategory: subCategory ?? _subCategory,
  brand: brand ?? _brand,
  quantity: quantity ?? _quantity,
  productPrice: productPrice ?? _productPrice,
  image: image ?? _image,
);
  dynamic  get id => _id;
  dynamic  get name => _name;
  dynamic  get barcode => _barcode;
  dynamic  get description => _description;
  SubCategory? get subCategory => _subCategory;
  Brand? get brand => _brand;
  Quantity? get quantity => _quantity;
  ProductPrice? get productPrice => _productPrice;
  dynamic  get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['barcode'] = _barcode;
    map['description'] = _description;
    if (_subCategory != null) {
      map['subCategory'] = _subCategory?.toJson();
    }
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_quantity != null) {
      map['quantity'] = _quantity?.toJson();
    }
    if (_productPrice != null) {
      map['productPrice'] = _productPrice?.toJson();
    }
    map['image'] = _image;
    return map;
  }

}

class ProductPrice {
  ProductPrice({
      dynamic  id,
      dynamic  price,
      dynamic  unitPrice,
      dynamic  mrp,}){
    _id = id;
    _price = price;
    _unitPrice = unitPrice;
    _mrp = mrp;
}

  ProductPrice.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _unitPrice = json['unitPrice'];
    _mrp = json['mrp'];
  }
  dynamic  _id;
  dynamic  _price;
  dynamic  _unitPrice;
  dynamic  _mrp;
ProductPrice copyWith({  dynamic  id,
  dynamic  price,
  dynamic  unitPrice,
  dynamic  mrp,
}) => ProductPrice(  id: id ?? _id,
  price: price ?? _price,
  unitPrice: unitPrice ?? _unitPrice,
  mrp: mrp ?? _mrp,
);
  dynamic  get id => _id;
  dynamic  get price => _price;
  dynamic  get unitPrice => _unitPrice;
  dynamic  get mrp => _mrp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    map['unitPrice'] = _unitPrice;
    map['mrp'] = _mrp;
    return map;
  }

}

class Quantity {
  Quantity({
      dynamic  id,
      dynamic  quantity,
      dynamic  unit,
      dynamic  unitValue,
      dynamic  pastQuantity,}){
    _id = id;
    _quantity = quantity;
    _unit = unit;
    _unitValue = unitValue;
    _pastQuantity = pastQuantity;
}

  Quantity.fromJson(dynamic json) {
    _id = json['id'];
    _quantity = json['quantity'];
    _unit = json['unit'];
    _unitValue = json['unitValue'];
    _pastQuantity = json['pastQuantity'];
  }
  dynamic  _id;
  dynamic  _quantity;
  dynamic  _unit;
  dynamic  _unitValue;
  dynamic  _pastQuantity;
Quantity copyWith({  dynamic  id,
  dynamic  quantity,
  dynamic  unit,
  dynamic  unitValue,
  dynamic  pastQuantity,
}) => Quantity(  id: id ?? _id,
  quantity: quantity ?? _quantity,
  unit: unit ?? _unit,
  unitValue: unitValue ?? _unitValue,
  pastQuantity: pastQuantity ?? _pastQuantity,
);
  dynamic  get id => _id;
  dynamic  get quantity => _quantity;
  dynamic  get unit => _unit;
  dynamic  get unitValue => _unitValue;
  dynamic  get pastQuantity => _pastQuantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quantity'] = _quantity;
    map['unit'] = _unit;
    map['unitValue'] = _unitValue;
    map['pastQuantity'] = _pastQuantity;
    return map;
  }

}

class Brand {
  Brand({
      dynamic  id,
      dynamic  name,
      dynamic  description,
      dynamic  image,}){
    _id = id;
    _name = name;
    _description = description;
    _image = image;
}

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
  }
  dynamic  _id;
  dynamic  _name;
  dynamic  _description;
  dynamic  _image;
Brand copyWith({  dynamic  id,
  dynamic  name,
  dynamic  description,
  dynamic  image,
}) => Brand(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  image: image ?? _image,
);
  dynamic  get id => _id;
  dynamic  get name => _name;
  dynamic  get description => _description;
  dynamic  get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    return map;
  }

}

class SubCategory {
  SubCategory({
      dynamic  id,
      dynamic  name,
      dynamic image,
      dynamic  description,
      Category? category,}){
    _id = id;
    _name = name;
    _image = image;
    _description = description;
    _category = category;
}

  SubCategory.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  dynamic  _id;
  dynamic  _name;
  dynamic _image;
  dynamic  _description;
  Category? _category;
SubCategory copyWith({  dynamic  id,
  dynamic  name,
  dynamic image,
  dynamic  description,
  Category? category,
}) => SubCategory(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  description: description ?? _description,
  category: category ?? _category,
);
  dynamic  get id => _id;
  dynamic  get name => _name;
  dynamic get image => _image;
  dynamic  get description => _description;
  Category? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }

}

class Category {
  Category({
      dynamic  id,
      dynamic  name,
      dynamic  image,
      dynamic  description,}){
    _id = id;
    _name = name;
    _image = image;
    _description = description;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
  }
  dynamic  _id;
  dynamic  _name;
  dynamic  _image;
  dynamic  _description;
Category copyWith({  dynamic  id,
  dynamic  name,
  dynamic  image,
  dynamic  description,
}) => Category(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  description: description ?? _description,
);
  dynamic  get id => _id;
  dynamic  get name => _name;
  dynamic  get image => _image;
  dynamic  get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    return map;
  }

}