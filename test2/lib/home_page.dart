import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/authentication_service.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Home"),
            ElevatedButton(onPressed: ()
                {
                  context.read<AuthenticationService>().signOut();
                }
                , child: Text("Sign Out"),
            ),
          ],
        )

      ),
    );
  }
}
