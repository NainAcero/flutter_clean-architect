import 'package:flutter/material.dart';
import 'package:flutter_example05/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as fb;
import 'package:flutter_example05/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_example05/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_example05/features/productos/presentation/pages/producto_page.dart';
import 'package:flutter_example05/utils/navigator_utils.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({ Key? key }) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final textUsername = TextEditingController();
  final textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                fb.BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if(state is Initial) {
                      return _formAuth(null);
                    } else if(state is Loading){
                      return CircularProgressIndicator();
                    } else if (state is Loaded) {
                      pushAndReplaceToPage(context, ProductoPage());
                    }else if(state is Error) {
                      return _formAuth(state.message);
                    }
                    return CircularProgressIndicator();
                  }
                )
              ],
            )
          ),
        )
      ),
    );
  }
  
  Widget _formAuth(String? texto) {
    return Column(
      children: [
        SizedBox(height: 40,),
        TextField(
          controller: textUsername,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter username'
          ),
        ),
        SizedBox(height: 20,),
        TextField(
          controller: textPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Password'
          ),
        ),
        SizedBox(height: 20,),
        InkWell(
          onTap: () {
            
            final mapaBloc = fb.BlocProvider.of<AuthBloc>(context);
            String username = textUsername.text.toString();
            String password = textPassword.text.toString();

            mapaBloc.add(SignIn(username, password));
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            color: Colors.blue,
            child: Text(
              "LOGIN",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        if(texto != null)
        Text(texto),

      ],
    );
  }
}