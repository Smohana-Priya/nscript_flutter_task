class DataItem {
  int? currentStrike;
  List<String>? expiry;
  List<Data>? data;

  DataItem({this.currentStrike, this.expiry, this.data});

  DataItem.fromJson(Map<String, dynamic> json) {
    currentStrike = json['current_strike'];
    expiry = json['expiry'].cast<String>();
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_strike'] = currentStrike;
    data['expiry'] = expiry;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? putOi;
  String? putOiChange;
  String? callOi;
  String? callOiChange;
  String? id;
  int? expirydate;
  int? strike;
  String? iv;

  Data(
      {this.putOi,
      this.putOiChange,
      this.callOi,
      this.callOiChange,
      this.id,
      this.expirydate,
      this.strike,
      this.iv});

  Data.fromJson(Map<String, dynamic> json) {
    putOi = json['put_oi'];
    putOiChange = json['put_oi_change'];
    callOi = json['call_oi'];
    callOiChange = json['call_oi_change'];
    id = json['id'];
    expirydate = json['expirydate'];
    strike = json['strike'];
    iv = json['iv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['put_oi'] = putOi;
    data['put_oi_change'] = putOiChange;
    data['call_oi'] = callOi;
    data['call_oi_change'] = callOiChange;
    data['id'] = id;
    data['expirydate'] = expirydate;
    data['strike'] = strike;
    data['iv'] = iv;
    return data;
  }
}
