import 'dart:convert';

class Provinces {
  final List<Province> provinces;

  Provinces({
    required this.provinces,
  });

  factory Provinces.fromJson(String str) => Provinces.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Provinces.fromMap(Map<String, dynamic> json) => Provinces(
    provinces: List<Province>.from(
        json["provinces"].map((x) => Province.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "provinces": List<dynamic>.from(provinces.map((x) => x.toMap())),
  };
}

class Province {
  final String provinceName;
  final String provinceImage;
  final CulturalHeritage culturalHeritage;

  Province({
    required this.provinceName,
    required this.provinceImage,
    required this.culturalHeritage,
  });

  factory Province.fromJson(String str) =>
      Province.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Province.fromMap(Map<String, dynamic> json) => Province(
    provinceName: json["province_name"],
    provinceImage: json["province_image"],
    culturalHeritage: CulturalHeritage.fromMap(json["cultural_heritage"]),
  );

  Map<String, dynamic> toMap() => {
    "province_name": provinceName,
    "province_image": provinceImage,
    "cultural_heritage": culturalHeritage.toMap(),
  };
}

class CulturalHeritage {
  final List<Tradition> traditionalFoods;
  final List<Tradition> traditionalHouses;
  final List<Tradition> traditionalDances;
  final List<Tradition> traditionalWeapons;
  final List<Tradition> traditions;

  CulturalHeritage({
    required this.traditionalFoods,
    required this.traditionalHouses,
    required this.traditionalDances,
    required this.traditionalWeapons,
    required this.traditions,
  });

  factory CulturalHeritage.fromJson(String str) =>
      CulturalHeritage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CulturalHeritage.fromMap(Map<String, dynamic> json) => CulturalHeritage(
    traditionalFoods: List<Tradition>.from(
        json["traditional_foods"].map((x) => Tradition.fromMap(x))),
    traditionalHouses: List<Tradition>.from(
        json["traditional_houses"].map((x) => Tradition.fromMap(x))),
    traditionalDances: List<Tradition>.from(
        json["traditional_dances"].map((x) => Tradition.fromMap(x))),
    traditionalWeapons: List<Tradition>.from(
        json["traditional_weapons"].map((x) => Tradition.fromMap(x))),
    traditions: List<Tradition>.from(
        json["traditions"].map((x) => Tradition.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "traditional_foods":
    List<dynamic>.from(traditionalFoods.map((x) => x.toMap())),
    "traditional_houses":
    List<dynamic>.from(traditionalHouses.map((x) => x.toMap())),
    "traditional_dances":
    List<dynamic>.from(traditionalDances.map((x) => x.toMap())),
    "traditional_weapons":
    List<dynamic>.from(traditionalWeapons.map((x) => x.toMap())),
    "traditions": List<dynamic>.from(traditions.map((x) => x.toMap())),
  };
}

class Tradition {
  final String image;
  final String title;
  final String subText;
  final DateTime updatedDate;
  final String province;
  final Details details;

  Tradition({
    required this.image,
    required this.title,
    required this.subText,
    required this.updatedDate,
    required this.province,
    required this.details,
  });

  factory Tradition.fromJson(String str) => Tradition.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tradition.fromMap(Map<String, dynamic> json) => Tradition(
    image: json["image"],
    title: json["title"],
    subText: json["sub_text"],
    updatedDate: DateTime.parse(json["updated_date"]),
    province: json["province"],
    details: Details.fromMap(json["details"]),
  );

  Map<String, dynamic> toMap() => {
    "image": image,
    "title": title,
    "sub_text": subText,
    "updated_date":
    "${updatedDate.year.toString().padLeft(4, '0')}-${updatedDate.month.toString().padLeft(2, '0')}-${updatedDate.day.toString().padLeft(2, '0')}",
    "province": province,
    "details": details.toMap(),
  };
}

class Details {
  final String bannerImage;
  final String title;
  final String subTitle;
  final String description;
  final String videoLink;
  final List<String> images;

  Details({
    required this.bannerImage,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.videoLink,
    required this.images,
  });

  factory Details.fromJson(String str) => Details.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Details.fromMap(Map<String, dynamic> json) => Details(
    bannerImage: json["banner_image"],
    title: json["title"],
    subTitle: json["sub_title"],
    description: json["description"],
    videoLink: json["video_link"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "banner_image": bannerImage,
    "title": title,
    "sub_title": subTitle,
    "description": description,
    "video_link": videoLink,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
