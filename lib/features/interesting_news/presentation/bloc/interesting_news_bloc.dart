import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/news.dart';
import '../../domain/usecases/load_intersting_news.dart';

part 'interesting_news_event.dart';
part 'interesting_news_state.dart';

class InterestingNewsBloc extends Bloc<InterestingNewsEvent, InterestingNewsState> {

  final LoadInterestingNews loadInterestingNews;

  InterestingNewsBloc({@required this.loadInterestingNews});


  @override
  InterestingNewsState get initialState => Initial();

  @override
  Stream<InterestingNewsState> mapEventToState(
      InterestingNewsEvent event,
      ) async* {
    if (event is LoadInterestingNewsEvent) {
      yield Loading();
      final response = await this.loadInterestingNews(event.user);
      yield response.fold(
            (faliure) => InternetError(user: event.user),
            (news) => Loaded(user: event.user,news:news),
      );
    }
  }
}