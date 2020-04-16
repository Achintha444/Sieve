import 'package:dartz/dartz.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';

abstract class BottomNavRepo{
  Future<Either<Faliure,EmptyEntity>> navigateToNewsFeed();
  Future<Either<Faliure,EmptyEntity>> navigateToCategory();
  Future<Either<Faliure,EmptyEntity>> navigateToDashboard();
  Future<Either<Faliure,EmptyEntity>> navigateToPrivacyLaws();
  Future<Either<Faliure,EmptyEntity>> navigateToPrivacyTips();
}