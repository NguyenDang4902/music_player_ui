import 'dart:async';

import 'package:flutter/material.dart';

class MusicPlayerUI extends StatefulWidget {
  const MusicPlayerUI({super.key});

  @override
  State<MusicPlayerUI> createState() => _MusicPlayerUIState();
}

class _MusicPlayerUIState extends State<MusicPlayerUI> {
  // music effect
  Timer? countdownTimer;
  Duration duration = const Duration(seconds: 0);
  bool musicOn = false;

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      const increaseTimer = 10;
      setState(() {
        final seconds = duration.inSeconds + increaseTimer;
        if (seconds >= 200) {
          countdownTimer!.cancel();
          duration = const Duration(seconds: 0);
          musicOn = false;
        } else {
          duration = Duration(seconds: seconds);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(children: [
          Container(
            height: size.height * 0.4,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(248, 32, 43, 1),
                border: Border.all(width: 5, color: Colors.black),
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(100))),
          ),
          Container(
            height: size.height * 0.33,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 163, 160, 1),
                border: Border.all(width: 5, color: Colors.black),
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(100))),
          ),
          Container(
            height: size.height * 0.25,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 155, 0, 1),
                border: Border.all(width: 5, color: Colors.black),
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(100))),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            alignment: Alignment.topCenter,
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.library_music,
                    size: 30,
                    color: Colors.white,
                  )
                ]),
          ),
          Positioned(
              top: size.height * 0.1,
              left: size.width * 0.15,
              child: Container(
                height: size.height * 0.4,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(width: 5, color: Colors.black),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        image: AssetImage('assets/song1.jpg'))),
              )),
          Positioned(
            top: size.height * 0.48,
            child: Center(
              child: Container(
                height: size.height * 0.4,
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Tempo',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'EXO',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SliderTheme(
                          data: SliderThemeData(
                              trackHeight: 5,
                              overlayShape: SliderComponentShape.noOverlay,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 14)),
                          child: Slider(
                            min: 0,
                            max: 200,
                            value: duration.inSeconds.toDouble(),
                            onChanged: (value) {
                              setState(() {});
                            },
                            inactiveColor: Colors.grey.shade300,
                            activeColor: Colors.black,
                            thumbColor: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(duration.toString().substring(2, 7)),
                            Text('03:10')
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.fast_rewind,
                          size: 60,
                        ),
                        GestureDetector(
                          onTap: () {
                            startTimer();
                            setState(() {
                              musicOn = !musicOn;
                            });
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.black,
                            child: musicOn
                                ? Icon(
                                    Icons.pause_outlined,
                                    size: 50,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.play_arrow,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                        const Icon(
                          Icons.fast_forward,
                          size: 60,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height * 0.15,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 5, color: Colors.black),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              padding: EdgeInsets.fromLTRB(30, 18, 30, 10),
              child: Row(children: [
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/song2.jpg'))),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Obsession',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'EXO',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    )
                  ],
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
