import 'package:movie/feather/browse_screen/domain/entities/GetBrowseResponseEntity.dart';

class GetBrowseResponseDto extends GetBrowseResponseEntity {
  GetBrowseResponseDto({
      super.genres,
    this.status_message,
    this.success,
    this.status_code});

  GetBrowseResponseDto.fromJson(dynamic json) {
    status_message = json['status_message'];
    success = json['success'];
    status_code = json['status_code'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(GenresBrowseDto.fromJson(v));
      });
    }
  }
  int? status_code ;
  String? status_message ;
  bool? success ;
}

class GenresBrowseDto extends GenresBrowseEntity {
  GenresBrowseDto({
      super.id,
    super.name,
 });

  GenresBrowseDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }



}