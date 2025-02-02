
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
part 'movie_model.g.dart';

@HiveType(typeId : 0)
@injectable
class MovieModel extends HiveObject {
  @HiveField(0)
  final String imageUrl ;
  @HiveField(1)
  final String title ;
  @HiveField(2)
  final String year ;
  @HiveField(3)
  final String description ;
  @HiveField(4)
  bool isFavorite ;

  MovieModel({
    required this.imageUrl ,
    required this.title ,
    required this.description,
    required this.year,
     this.isFavorite = false
});
}