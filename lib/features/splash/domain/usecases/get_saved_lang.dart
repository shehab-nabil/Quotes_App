import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/lang_repository.dart';

class GetSavedLangUseCase implements UseCases<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String?>> call(NoParams params) async =>
      await langRepository.getSavedLang();
}
