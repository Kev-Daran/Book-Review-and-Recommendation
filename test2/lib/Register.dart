import 'package:flutter/material.dart';
import 'package:test2/FadeAnimation.dart';
import 'package:test2/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:test2/login_page.dart';


class Register extends StatefulWidget {



  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body:

        SingleChildScrollView(
          child: Column(
              children: <Widget>[
                FadeAnimation(1,Container(
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('Assets/background.png'),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Stack(
                      key: _formKey,
                      children: <Widget> [
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: FadeAnimation(1.3,Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('Assets/light-1.png'),
                                    fit: BoxFit.fill
                                )
                            ),
                          )),
                        ),
                        Positioned(
                            left: 150,
                            width: 80,
                            height: 150,
                            child: FadeAnimation(1.5,Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('Assets/light-2.png'),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ))
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 80,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('Assets/clock.png'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                        ),
                        Positioned(
                            child: FadeAnimation(1.7,Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                                )

                            ))
                        )
                      ],
                    )
                )),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: emailController,
                                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      controller: passwordController,
                                      obscureText: true,
                                      validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                      ),
                                    ),
                                  ),
                                  // SizedBox(height: 30, ),
                                  // Container(
                                  //   height: 50,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     gradient: LinearGradient(
                                  //       colors: [
                                  //         Color.fromRGBO(143, 148, 251, 1),
                                  //         Color.fromRGBO(143, 148, 251, .6)
                                  //       ]
                                  //     )
                                  //   ),
                                  //   child: Center(
                                  //     child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  //   ),
                                  // ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      // TextField(
                      //   controller: emailController,
                      //   decoration: InputDecoration(
                      //     labelText: "Email",
                      //   ),
                      // ),
                      // TextField(
                      //   controller: passswordController,
                      //   decoration: InputDecoration(
                      //     labelText: "Password",
                      //   ),
                      // ),
                      Row(
                        children: [
                          Padding(padding:
                          EdgeInsets.all(35.0),
                          ),
                          ElevatedButton(onPressed: () async
                          {
                            context.read<AuthenticationService>().signUp(
                                email: emailController.text.trim(),
                            password: passwordController.text.trim()
                            );
                          },
                            child: Text("Register"),
                          ),
                          Padding(padding:
                          EdgeInsets.all(35.0)
                          ),
                          ElevatedButton(onPressed: ()
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>LoginPage()));
                          }
                              , child: Text("Sign In")
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]
          ),
        )
    );
  }
}
