class GetBrowseResponseEntity {
  GetBrowseResponseEntity({
      this.genres,});

  List<GenresBrowseEntity>? genres;

}

class GenresBrowseEntity {
  GenresBrowseEntity({
      this.id, 
      this.name,});

  num? id;
  String? name;

}