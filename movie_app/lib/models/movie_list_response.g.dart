// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieParentAdapter extends TypeAdapter<MovieParent> {
  @override
  final int typeId = 0;

  @override
  MovieParent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieParent(
      page: fields[0] as num?,
      results: (fields[1] as List?)?.cast<MovieData>(),
      totalPages: fields[2] as num?,
      totalResults: fields[3] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieParent obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.results)
      ..writeByte(2)
      ..write(obj.totalPages)
      ..writeByte(3)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieParentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MovieDataAdapter extends TypeAdapter<MovieData> {
  @override
  final int typeId = 1;

  @override
  MovieData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieData(
      adult: fields[0] as bool?,
      backdropPath: fields[1] as String?,
      genreIds: (fields[2] as List?)?.cast<dynamic>(),
      id: fields[3] as num?,
      originalLanguage: fields[4] as String?,
      originalTitle: fields[5] as String?,
      overview: fields[6] as String?,
      popularity: fields[7] as num?,
      posterPath: fields[8] as String?,
      releaseDate: fields[9] as String?,
      title: fields[10] as String?,
      video: fields[11] as bool?,
      voteAverage: fields[12] as num?,
      voteCount: fields[13] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieData obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.voteAverage)
      ..writeByte(13)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
