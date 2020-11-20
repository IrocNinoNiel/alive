part of 'homepage_bloc.dart';

@immutable
abstract class HomePageEvent extends Equatable {}

class HomePageLogoutEvent extends HomePageEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageLoadData extends HomePageEvent {
  List<Object> get props => throw UnimplementedError();
}
