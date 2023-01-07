import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rive_animated/screens/next_screen.dart';


void main() {
  runApp(const MaterialApp(
    home: PlayOneShotAnimation(),
    debugShowCheckedModeBanner: false,
  ));
}


class PlayOneShotAnimation extends StatefulWidget {
  const PlayOneShotAnimation({Key? key}) : super(key: key);

  @override
  _PlayOneShotAnimationState createState() => _PlayOneShotAnimationState();
}

class _PlayOneShotAnimationState extends State<PlayOneShotAnimation> {
  late RiveAnimationController _controller;
  @override
  void initState() {
    super.initState();
    //make app full screen
    SystemChrome.setEnabledSystemUIOverlays([]);
    _controller = SimpleAnimation('StartLoading');
  }
  void changeAnimationState(String animationState) {
    setState(() {
      _controller = SimpleAnimation(animationState);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 169, 25),
        body:ListView(
        children: [
          Container(
            width: 370,
            height: 360,
            child: RiveAnimation.network(
              'https://public.rive.app/community/runtime-files/3897-8156-ball-loader.riv',
              controllers: [_controller],
            ),
          ),
          const SizedBox(
            height: 20,
          ),//decorated login text field for email and password
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 234, 168, 25),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 238, 234, 217),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),const SizedBox(
            height: 20,
          ),  //decorated login text field for email and password
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 234, 168, 25),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 238, 234, 217),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),//lgoin button
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                changeAnimationState("Loading");
                Future.delayed(const Duration(seconds: 3), () {
                  changeAnimationState("FinishLoading");
                }).then((value) => Future.delayed(const Duration(seconds: 1), () {
                  //navigate to next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                  );

                }));
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 234, 168, 25),
                fixedSize: const Size(370, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ]),
    );

}}