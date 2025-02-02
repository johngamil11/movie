import 'package:movie/feather/Movie_details/domain/entities/GetMovieDetailsResponseEntity.dart';

class GetMoviesDetailsResponseDto extends GetMovieDetailsResponseEntity {
  GetMoviesDetailsResponseDto({
      super.adult,
    super.backdropPath,
    super.belongsToCollection,
    super.budget,
    super.genres,
    super.homepage,
    super.id,
    super.imdbId,
    super.originCountry,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.productionCompanies,
    super.productionCountries,
    super.releaseDate,
    super.revenue,
    super.runtime,
    super.spokenLanguages,
    super.status,
    super.tagline,
    this.status_code,
    this.success,
    this.status_message,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,});

  GetMoviesDetailsResponseDto.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null ? BelongsToCollection.fromJson(json['belongs_to_collection']) : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      }

      );
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    status_code = json['status_code'];
    status_message = json['status_message'];
    success = json['success'];

    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  int? status_code ;
  String? status_message ;
  bool? success ;
}

class SpokenLanguages extends SpokenLanguagesEntity {
  SpokenLanguages({
    super.englishName,
    super.iso6391,
    super.name,});

  SpokenLanguages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }



}

class ProductionCountries extends ProductionCountriesEntity{
  ProductionCountries({
    super.iso31661,
    super.name,});

  ProductionCountries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }


}

class ProductionCompanies extends ProductionCompaniesEntity {
  ProductionCompanies({
    super.id,
    super.logoPath,
    super.name,
    super.originCountry,});

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

}

class Genres extends GenresEntity {
  Genres({
    super.id,
    super.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

}

class BelongsToCollection extends BelongsToCollectionEntity {
  BelongsToCollection({
    super.id,
    super.name,
    super.posterPath,
    super.backdropPath,});

  BelongsToCollection.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }


}