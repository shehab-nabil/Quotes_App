import 'package:dartz/dartz.dart';
import 'package:quotes_app/core/error/failure.dart';
import 'package:quotes_app/core/usecases/usecases.dart';
import 'package:quotes_app/features/splash/domain/repositories/lang_repository.dart';

class ChangeLangUseCase extends UseCases<bool, String> {
  final LangRepository langRepository;

  ChangeLangUseCase({required this.langRepository});
  @override
  Future<Either<Failure, bool>> call(String langCode) =>
      langRepository.changeLang(langCode: langCode);
}
