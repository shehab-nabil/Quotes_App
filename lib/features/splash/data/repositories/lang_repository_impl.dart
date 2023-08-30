import 'package:dartz/dartz.dart';
import 'package:quotes_app/core/error/exceptions.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/lang_repository.dart';
import '../datasources/lang_local_data_source.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on LocalException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode!);
    } on LocalException {
      return Left(CacheFailure());
    }
  }
}
