//User Model
class UserModel {
  String uid;
  String photoUrl;
  String plec;
  String education;
  double age;
  double polPref;

  UserModel({this.uid, this.plec, this.education, this.age, this.polPref, this.photoUrl});

  factory UserModel.fromMap(Map data) {
    return UserModel(
      uid: data['uid'],
     // email: data['email'] ?? '',
     // name: data['name'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      plec: data['plec'] ?? '',
      education: data['education'] ?? '',
      age: double.parse(data['age'] ?? '20'),
      polPref: double.parse(data['pol_pref' ?? 0])
    );
  }

  Map<String, dynamic> toJson() =>
      {"uid": uid,
      // "email": email, "name": name, 
      "photoUrl": photoUrl, 
      "plec":plec, 'education': education, 'age' : age.toString(), 'pol_pref': polPref.toString() };
}
