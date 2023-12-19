import 'package:doggo_dec_19/helpers/ui_helper.dart';
import 'package:flutter/material.dart';

class DogScreen extends StatefulWidget {
  const DogScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dog app! ~ For dogs and humans!"),
        backgroundColor: Colors.deepPurpleAccent.shade100,
      ),
      body: Column(children: [_buildButtonContainer()]),
    );
  }

  Widget _buildButtonContainer() {
    return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 9, bottom: 10),
        child: ElevatedButton(
          onPressed: _handleRequestButtonPressed,
          child: const Text("Display list of dog breeds, please!"),
        ));
  }

  void _handleRequestButtonPressed() {
    UiHelper.displaySnackbar(context,
        "This feature is not implemented yet. It will be up and running as soon as possible. Bear with us until then. (Or doggo with us! Any animal with us is fine for sure!)");
  }
}
