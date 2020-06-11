import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';

import '../../domain/entities/categories.dart';
import '../../domain/repos/categories_repo.dart';
import '../datasources/categories_remote_datasource.dart';

class CategoriesRepoImpl implements CategoriesRepo{

  final NetworkInfo networkInfo;
  final CategoriesRemoteDatasource categoriesRemoteDatasource;

  CategoriesRepoImpl({@required this.networkInfo, @required this.categoriesRemoteDatasource});

  @override
  Future<Either<Faliure, List<Categories>>> loadCategories(LoginUser user) async {
    if (await networkInfo.isConnected) {
      try {
        final finalCategories = await categoriesRemoteDatasource.loadCategories();
        //await Future.delayed(Duration(seconds: 3));
        return Right(finalCategories);
      } on ServerException {
        return (Left(ServerFaliure()));
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }



}