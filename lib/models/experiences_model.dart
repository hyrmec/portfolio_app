class Experience {
  String yearsOld;
  String place;
  String description;

  Experience({this.yearsOld, this.place, this.description});

  Experience.fromJson(Map<String, dynamic> json) {
    yearsOld = json['yearsOld'];
    place = json['place'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yearsOld'] = this.yearsOld;
    data['place'] = this.place;
    data['description'] = this.description;
    return data;
  }
}
