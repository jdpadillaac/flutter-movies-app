class Cast {
  Cast({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Cast.fromJsonMap(Map<String, dynamic> json) {
    this.castId = json['cast_id'];
    this.character = json['character'];
    this.creditId = json['credit_id'];
    this.gender = json['gender'];
    this.id = json['id'];
    this.name = json['name'];
    this.order = json['order'];
    this.profilePath = json['profile_path'];
  }

  String getImage() {
    if (profilePath == null) {
      return 'https://ramenparados.com/wp-content/uploads/2019/03/no-avatar-png-8.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}

class CastList {
  List<Cast> actors = new List();

  CastList.fromJsonList(List<dynamic> jsonList) {

    if (jsonList == null ) return;

    jsonList.forEach((element) {
      final actor = Cast.fromJsonMap(element);
      actors.add(actor);
    });
  }

}

class Crew {
  Crew({
    this.creditId,
    this.department,
    this.gender,
    this.id,
    this.job,
    this.name,
    this.profilePath,
  });

  String creditId;
  String department;
  int gender;
  int id;
  String job;
  String name;
  String profilePath;
}
