import 'package:dartz/dartz.dart';
import '../../../../core/data/errors/failure.dart';
import '../datasource/medical_test_datasource.dart';
import '../models/medical_test_model.dart';

abstract class MedicalTestRepository {
  Future<Either<Failure, MedicalTestModel>> getMedicalTestPrediction(
      String testImageFilePath);
}

class MedicalTestRepositoryImpl implements MedicalTestRepository {
  MedicalTestRepositoryImpl(this.remoteDataSource);
  final MedicalTestRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, MedicalTestModel>> getMedicalTestPrediction(
      String testImageFilePath) async {
    try {
      final medicalTest =
          await remoteDataSource.getMedicalTestPrediction(testImageFilePath);
      return Right(medicalTest);
    } on NetworkFailure catch (_) {
      return Left(NetworkFailure());
    } on ServerFailure catch (_) {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
