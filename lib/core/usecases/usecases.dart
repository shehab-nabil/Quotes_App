import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes_app/core/error/failure.dart';

abstract class UseCases<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
