import 'package:flutter/material.dart';
import 'package:app_runner/app_runner.dart';

class KaskaSplash extends StatelessWidget {
  const KaskaSplash({Key? key, this.showError = false}) : super(key: key);

  final bool showError;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: showError ?
             <Widget>[
              const SizedBox(height: 10),
              const Text("Oops, an initialization error occurred."),
              const SizedBox(height: 10),
              FilledButton(onPressed:(){
                context.reloadWidget();
              },
              child: const Text("- Reload app -"))
            ]: 
            const <Widget>[

              Text('..Kaskazini loading..'),
              SizedBox(height: 100),
              CircularProgressIndicator(),

            ],


          ),
        ),
      ),
    );
  }
}