import 'package:flutter/material.dart';
import 'package:helpusmall/service/auth.dart';
import 'package:helpusmall/views/loading.dart';
import 'package:helpusmall/views/styles.dart';

class SignIn extends StatefulWidget {

  final Function toogleView;
  SignIn({this.toogleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field State

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.purple[700],
          elevation: 0.0,
          title: Text(
            'Login',
            style: TextStyle(
                fontFamily: 'Cocogoose',
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
          ),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text('Register',
                style: TextStyle(
                fontFamily: 'Cocogoose',
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: (){
                widget.toogleView();
              } ,
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[     
                CircleAvatar(
                  radius: 90.0,
                  backgroundImage: AssetImage('images/logo-azul.png'),
                ),
                    SizedBox(height: 20.0),
                Card(
                   margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                   child: TextFormField(
                     decoration: textInputDecoration.copyWith(hintText: 'Email'),
                     validator: (val) => val.isEmpty ? 'Digitar email' : null,
                     onChanged: (value) {
                       setState(() => email = value);
                    },
                  ),
                ),
                SizedBox(height: 5.0),
                Card(
                   margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 15.0),
                   child: TextFormField(
                     decoration:  textInputDecoration.copyWith(hintText: 'Senha'),
                      obscureText: true,
                      validator: (val) => val.length <= 6 ? 'Senha deve no minimo 6 caracteres' : null,
                     onChanged: (value) {
                       setState(() => password = value);
                    
                    }
                  ),
                ),
                 SizedBox(height: 5.0),
                  RaisedButton(
                    color: Colors.purple[700],
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white),
                      ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result =  await _auth.login(email, password);
                          if(result == null ){
                            setState((){
                              error = 'Erro no email ou senha';
                              loading = false;                              
                            });
                          }
                      }
                    }
                  ),
                  SizedBox(height: 5.0 ), 
                    Text(error,
                        style: TextStyle(
                        fontFamily: 'Cocogoose',
                        fontSize: 15.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ), 
          )
        ),
    );
  }
}