import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_prog_project/presentation/bloc/homepage/homepage_bloc.dart';
import 'package:mob_prog_project/presentation/ui/login/pages/login.dart';
import 'package:mob_prog_project/repository/authentication/authentication_repository.dart';

class HomePageParent extends StatelessWidget {
  final FirebaseUser user;
  HomePageParent(this.user);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(AuthenticationRepository()),
      child: HomePage(this.user),
    );
  }
}

class HomePage extends StatelessWidget {
  final FirebaseUser user;
  HomePageBloc homePageBloc;
  HomePage(this.user);
  @override
  Widget build(BuildContext context) {
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    return WillPopScope(
        onWillPop: () async => null,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Email'),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () async {
                  homePageBloc.add(HomePageLogoutEvent());
                },
                color: Colors.white,
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocListener<HomePageBloc, HomePageState>(
                listener: (context, state) {
                  if (state is LogOutSuccessState) {
                    navigateToSignUp(context);
                  }
                },
                child: BlocBuilder<HomePageBloc, HomePageState>(
                    builder: (context, state) {
                  if (state is LogOutInitialState) {
                    return Container();
                  } else if (state is LogOutSuccessState) {
                    return Container();
                  }
                }),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(user.email),
              )
            ],
          ),
        ));
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPageParent();
    }));
  }
}
