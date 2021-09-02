class CultinoDataModel {
  List<int?>? favMandi;
  List<OtherMandi?>? otherMandi;

  CultinoDataModel({this.favMandi, this.otherMandi});

  CultinoDataModel.fromJson(Map<String, dynamic> json) {
    if (json['fav_mandi'] != null) {
      favMandi = new List<int>.empty(growable: true);
      json['fav_mandi'].forEach((v) {
        favMandi?.add(v);
      });
    }
    if (json['other_mandi'] != null) {
      otherMandi = new List<OtherMandi>.empty(growable: true);
      json['other_mandi'].forEach((v) {
        otherMandi?.add(new OtherMandi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favMandi != null) {
      data['fav_mandi'] = this.favMandi?.map((v) => v).toList();
    }
    if (this.otherMandi != null) {
      data['other_mandi'] = this.otherMandi?.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

class OtherMandi {
  int? cropId;
  String? district;
  int? districtId;
  String? hindiName;
  int? id;
  String? image;
  double? km;
  String? lastDate;
  double? lat;
  double? lng;
  String? location;
  String? market;
  double? meters;
  String? state;
  String? urlStr;

  OtherMandi(
      {this.cropId,
      this.district,
      this.districtId,
      this.hindiName,
      this.id,
      this.image,
      this.km,
      this.lastDate,
      this.lat,
      this.lng,
      this.location,
      this.market,
      this.meters,
      this.state,
      this.urlStr});

  OtherMandi.fromJson(Map<String, dynamic> json) {
    cropId = json['crop_id'];
    district = json['district'];
    districtId = json['district_id'];
    hindiName = json['hindi_name'];
    id = json['id'];
    image = json['image'];
    km = json['km'];
    lastDate = json['last_date'];
    lat = json['lat'];
    lng = json['lng'];
    location = json['location'];
    market = json['market'];
    meters = json['meters'];
    state = json['state'];
    urlStr = json['url_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['crop_id'] = this.cropId;
    data['district'] = this.district;
    data['district_id'] = this.districtId;
    data['hindi_name'] = this.hindiName;
    data['id'] = this.id;
    data['image'] = this.image;
    data['km'] = this.km;
    data['last_date'] = this.lastDate;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['location'] = this.location;
    data['market'] = this.market;
    data['meters'] = this.meters;
    data['state'] = this.state;
    data['url_str'] = this.urlStr;
    return data;
  }
}
