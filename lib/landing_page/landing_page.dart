import 'package:flutter/material.dart';
import 'package:outdoor_social/consts/outdoor_consts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFFC62B),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  width: width * .7,
                  child: Image.asset("assets/images/bg_no_color.png")),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: width,
                child: Text(
                    overflow: TextOverflow.clip,
                    style: const TextStyle(fontSize: 32),
                    introTexts[index]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: index == 0
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (index < 2) {
                            index++;
                            print("..................$index");
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: const SizedBox(
                        width: 100,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (index < 2) {
                                  index++;
                                  print("..................$index");
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            child: const SizedBox(
                              width: 100,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Prev",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            )),
                        const SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (index > 0) {
                                  index--;
                                  print("..................$index");
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            child: const SizedBox(
                              width: 100,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ))
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
