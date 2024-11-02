
class AccountModel {
  final String? gravatarHash;
  final String? avatarPath;
  final int? id;
  final String? language;
  final String? country;
  final String? name;
  final bool? includeAdult;
  final String? username;

  AccountModel({
     this.gravatarHash,
    this.avatarPath,
     this.id,
     this.language,
     this.country,
     this.name,
     this.includeAdult,
     this.username,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      gravatarHash: json['avatar']['gravatar']['hash'],
      avatarPath: json['avatar']['tmdb']['avatar_path'],
      id: json['id'],
      language: json['iso_639_1'],
      country: json['iso_3166_1'],
      name: json['name'],
      includeAdult: json['include_adult'],
      username: json['username'],
    );
  }
}
