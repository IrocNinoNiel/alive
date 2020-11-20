import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mob_prog_project/repository/authentication/authentication_repository.dart';

part 'homepage_state.dart';
part 'homepage_event.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final AuthenticationRepository _repository;

  HomePageBloc(this._repository) : super(LogOutInitialState());

  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is HomePageLogoutEvent) {
      await _repository.signOut();
      yield LogOutSuccessState();
    }
  }
}
