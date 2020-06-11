import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/categories.dart';
import '../repos/categories_repo.dart';

class LoadCategories implements UseCase<List<Categories>,LoginUser>{

  final CategoriesRepo categoriesRepo;

  LoadCategories({@required this.categoriesRepo});


  @override
  Future<Either<Faliure, List<Categories>>> call(LoginUser user) async {
    return await this.categoriesRepo.loadCategories(user) ;
  }

}