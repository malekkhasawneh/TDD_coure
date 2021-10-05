import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firstproject/core/error/errors.dart';

abstract class UseCase<Types, Parameters> {
  Future<Either<Errors, Types>> call(Parameters params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
