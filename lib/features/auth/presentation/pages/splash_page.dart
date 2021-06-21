import 'package:flutter/material.dart';
import 'package:flutter_example05/features/auth/presentation/bloc/splash/splash_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as fb;
import 'package:flutter_example05/features/auth/presentation/bloc/splash/splash_event.dart';
import 'package:flutter_example05/features/auth/presentation/bloc/splash/splash_state.dart';
import 'package:flutter_example05/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter_example05/features/productos/presentation/pages/producto_page.dart';
import 'package:flutter_example05/utils/navigator_utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    final mapaBloc = fb.BlocProvider.of<SplashBloc>(context);
    mapaBloc.add(VerifyToken());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          fb.BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              if(state is Loaded){
                pushAndReplaceToPage(context, ProductoPage());
              } else if(state is Error){
                pushAndReplaceToPage(context, AuthPage());
              }
              return CircularProgressIndicator();
            }
          )
        ],
      )
    );
  }
}