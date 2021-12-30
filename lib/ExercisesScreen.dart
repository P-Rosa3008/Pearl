import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:math' as math;
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:yoga/ad_state.dart';

class ExercisesScreen extends StatefulWidget {
  @override
  ExercisesScreenState createState() => ExercisesScreenState();
}

class ExercisesScreenState extends State<ExercisesScreen>
    with TickerProviderStateMixin {
  BannerAd banner;
  AnimationController animationController;
  AnimationController controller;
  AudioPlayer player = new AudioPlayer();
  AudioCache cache = new AudioCache();
  int minutes;
  String userName;
  bool jungleChoose = false;
  bool rainChoose = false;
  bool riverChoose = false;
  bool tibetenChoose = false;
  bool isPlaying = false;
  String image;
  double opacity;
  double right = 133;
  Duration duration;
  var random;

  String get timerString {
    duration = controller.duration * controller.value;
    return '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        userName = prefs.getString(
          'username',
        );
      },
    );
  }

  void stopFile() {
    player?.stop();
  }

  double getRight() {
    if (minutes == 5) {
      right = 110.0;
      return right;
    } else {
      right = 103;
      return right;
    }
  }

  getBackground() async {
    if (minutes == 5 && jungleChoose == true) {
      // player = await cache.play('jungle5min.mp3');
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/jungle5min.mp3?alt=media&token=48b51315-2d0c-472d-8207-b0e70e7fa08e');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/jungle5min.mp3?alt=media&token=48b51315-2d0c-472d-8207-b0e70e7fa08e');
      print('Estou aqui e bem de saúde 5');
    }
    if (minutes == 10 && jungleChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/jungle10min.mp3?alt=media&token=ff16d6a4-f457-4997-be41-71c66603a195');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/jungle10min.mp3?alt=media&token=ff16d6a4-f457-4997-be41-71c66603a195');
      print('Estou aqui e bem de saúde 10');
    }
    if (minutes == 15 && jungleChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/jungle15min.mp3?alt=media&token=c9895e72-62a6-486a-bd83-8135a1eb3345');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/jungle15min.mp3?alt=media&token=c9895e72-62a6-486a-bd83-8135a1eb3345');
      print('Estou aqui e bem de saúde 15');
    }
    if (minutes == 20 && jungleChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/junlge20min.mp3?alt=media&token=677aa066-a648-4341-b621-c0ea6d818cca');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/junlge20min.mp3?alt=media&token=677aa066-a648-4341-b621-c0ea6d818cca');
      print('Estou aqui e bem de saúde 20');
    }
    if (minutes == 25 && jungleChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/jungle25min.mp3?alt=media&token=9586cd57-59d9-4780-af43-c490faca5563');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/jungle25min.mp3?alt=media&token=9586cd57-59d9-4780-af43-c490faca5563');
      print('Estou aqui e bem de saúde 25');
    }
    if (minutes == 30 && jungleChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/jungle30min.mp3?alt=media&token=6dc649de-1203-4a65-8bf8-b335760a2f44');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/jungle30min.mp3?alt=media&token=6dc649de-1203-4a65-8bf8-b335760a2f44');
    }
    ///////////////////////////////////////////////////////////////////
    if (minutes == 5 && rainChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/rain5min.mp3?alt=media&token=572d5e21-6d82-43a2-8e01-79cb80b3363b');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/rain5min.mp3?alt=media&token=572d5e21-6d82-43a2-8e01-79cb80b3363b');
      print('Estou aqui e bem de saúde 5');
    }
    if (minutes == 10 && rainChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river10min.mp3?alt=media&token=8b8917dd-1b33-4db2-b46c-58c19b95fb33');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river10min.mp3?alt=media&token=8b8917dd-1b33-4db2-b46c-58c19b95fb33');
      print('Estou aqui e bem de saúde 10');
    }
    if (minutes == 15 && rainChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/rain15min.mp3?alt=media&token=548c3637-be41-4ec3-ac8f-e6cf895c6fa7');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/rain15min.mp3?alt=media&token=548c3637-be41-4ec3-ac8f-e6cf895c6fa7');
      print('Estou aqui e bem de saúde 15');
    }
    if (minutes == 20 && rainChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/rain20min.mp3?alt=media&token=d4d32ddc-c2e6-44d7-867c-b6b68a95b1ce');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/rain20min.mp3?alt=media&token=d4d32ddc-c2e6-44d7-867c-b6b68a95b1ce');
      print('Estou aqui e bem de saúde 20');
    }
    if (minutes == 25 && rainChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/rain25min.mp3?alt=media&token=1279971a-61c8-422b-aca4-a4d2282ebe5a');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/rain25min.mp3?alt=media&token=1279971a-61c8-422b-aca4-a4d2282ebe5a');
    }
    if (minutes == 30 && rainChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/rain30min.mp3?alt=media&token=5824d677-ac19-4cda-95e4-84104acdbdf3');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/rain30min.mp3?alt=media&token=5824d677-ac19-4cda-95e4-84104acdbdf3');
    }
    ///////////////////////////////////////////////////////////////////
    if (minutes == 5 && riverChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river5min.mp3?alt=media&token=8e3ffb04-5c78-413a-85c1-b4d34a73c3ea');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river5min.mp3?alt=media&token=8e3ffb04-5c78-413a-85c1-b4d34a73c3ea');
    }
    if (minutes == 10 && riverChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river10min.mp3?alt=media&token=8b8917dd-1b33-4db2-b46c-58c19b95fb33');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river10min.mp3?alt=media&token=8b8917dd-1b33-4db2-b46c-58c19b95fb33');
    }
    if (minutes == 15 && riverChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river15min.mp3?alt=media&token=9bf6425c-d302-4d75-8c9d-14ee04622194');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river15min.mp3?alt=media&token=9bf6425c-d302-4d75-8c9d-14ee04622194');
    }
    if (minutes == 20 && riverChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river20min.mp3?alt=media&token=c91679e6-a1c8-4105-93c5-d1cfa82b5179');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river20min.mp3?alt=media&token=c91679e6-a1c8-4105-93c5-d1cfa82b5179');
    }
    if (minutes == 25 && riverChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river25min.mp3?alt=media&token=db452d78-52a2-4a64-a882-5033ee9e81dd');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river25min.mp3?alt=media&token=db452d78-52a2-4a64-a882-5033ee9e81dd');
    }
    if (minutes == 30 && riverChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river30min.mp3?alt=media&token=283edaec-f3cd-4ce7-8f1c-355ed9c2d68b');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/river30min.mp3?alt=media&token=283edaec-f3cd-4ce7-8f1c-355ed9c2d68b');
    }
    ///////////////////////////////////////////////////////////////////
    if (minutes == 5 && tibetenChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan5min.mp3?alt=media&token=7a239984-940e-49c1-923e-298d4fdf1067');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan5min.mp3?alt=media&token=7a239984-940e-49c1-923e-298d4fdf1067');
    }
    if (minutes == 10 && tibetenChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan10min.mp3?alt=media&token=d92b1cfa-bc27-47ec-b451-d77a8e4a27e1');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan10min.mp3?alt=media&token=d92b1cfa-bc27-47ec-b451-d77a8e4a27e1');
    }
    if (minutes == 15 && tibetenChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan15min.mp3?alt=media&token=00575cc2-05c4-4024-91e0-b4e3c9740bcb');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan15min.mp3?alt=media&token=00575cc2-05c4-4024-91e0-b4e3c9740bcb');
    }
    if (minutes == 20 && tibetenChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan20min.mp3?alt=media&token=8f67a389-47fc-47b1-8a73-4cab7fc94847');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan20min.mp3?alt=media&token=8f67a389-47fc-47b1-8a73-4cab7fc94847');
    }
    if (minutes == 25 && tibetenChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan25min.mp3?alt=media&token=042b3815-7e57-411d-b7ed-6012e8d16a4d');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan25min.mp3?alt=media&token=042b3815-7e57-411d-b7ed-6012e8d16a4d');
    }
    if (minutes == 30 && tibetenChoose == true) {
      player.setUrl(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan30min.mp3?alt=media&token=eab40222-c598-4d4b-9fa6-7f09b2888e76');
      player.play(
          'https://firebasestorage.googleapis.com/v0/b/pearl-f19e8.appspot.com/o/tibetan30min.mp3?alt=media&token=eab40222-c598-4d4b-9fa6-7f09b2888e76');
    }
  }

  @override
  void initState() {
    super.initState();
    opacity = 0;
    image = '';
    minutes = 10;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    )..addListener(() {});
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 600,
      ),
    )..addStatusListener(
        (status) {
          if (controller.status == AnimationStatus.dismissed) {
            setState(
              () => isPlaying = false,
            );
          }
        },
      );
    getUserName();
    cache = AudioCache(
      prefix: "asset/",
      fixedPlayer: AudioPlayer()
        ..setReleaseMode(
          ReleaseMode.STOP,
        ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  randomNumber(min, max) {
    var random = math.Random();
    double x = random.nextDouble() * (max - min) + min;
    return x;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then(
      (status) {
        setState(
          () {
            banner = BannerAd(
              size: AdSize.banner,
              adUnitId: adState.bannerAdUnitId,
              request: AdRequest(),
              listener: adState.adListener,
            )..load();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(245, 248, 250, 3),
        body: Container(
          color: Color.fromRGBO(
            245,
            248,
            250,
            50,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 14,
                      left: 16,
                      top: 16,
                      bottom: 16,
                    ),
                    child: SizedBox(
                      height: 110,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Hello",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: AutoSizeText(
                                  "$userName",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  minFontSize: 20,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueAccent[700],
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shadowColor: Colors.transparent,
                                onSurface: Colors.transparent,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () async {
                                Timer(Duration(milliseconds: 180),
                                    () => animationController.forward());
                                showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding: EdgeInsets.all(0),
                                      title: Container(),
                                      content: Stack(
                                        clipBehavior: Clip.none,
                                        alignment: AlignmentDirectional.topEnd,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SlideTransition(
                                                  position: Tween<Offset>(
                                                    begin: Offset(
                                                        randomNumber(0.8, 0.21),
                                                        0),
                                                    end: Offset(0, 0),
                                                  ).animate(
                                                    animationController,
                                                  ),
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                      overlayColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                    ),
                                                    onPressed: () async {
                                                      jungleChoose = true;
                                                      rainChoose = false;
                                                      riverChoose = false;
                                                      tibetenChoose = false;
                                                      opacity = 1;
                                                      image =
                                                          'asset/jungle.jpg';
                                                      setState(() {});
                                                      stopFile();
                                                      controller.reset();
                                                      Navigator.pop(
                                                        context,
                                                      );
                                                    },
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .bottomEnd,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10,
                                                          ),
                                                          child: Image.asset(
                                                            'asset/jungle.jpg',
                                                            fit: BoxFit.cover,
                                                            height: 100,
                                                            width: 400,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            right: 5,
                                                            bottom: 5,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              10,
                                                            ),
                                                            child:
                                                                BackdropFilter(
                                                              filter:
                                                                  ImageFilter
                                                                      .blur(
                                                                sigmaX: 5,
                                                                sigmaY: 5,
                                                              ),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    1,
                                                                  ),
                                                                  color: Colors
                                                                      .grey[600]
                                                                      .withOpacity(
                                                                    0.4,
                                                                  ),
                                                                ),
                                                                height: 35,
                                                                width: 130,
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    "Jungle",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Avenir',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      letterSpacing:
                                                                          1.2,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SlideTransition(
                                                  position: Tween<Offset>(
                                                          begin: Offset(
                                                              randomNumber(
                                                                  0.8, 0.21),
                                                              0),
                                                          end: Offset(0, 0))
                                                      .animate(
                                                          animationController),
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                      overlayColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                    ),
                                                    onPressed: () async {
                                                      jungleChoose = false;
                                                      rainChoose = true;
                                                      riverChoose = false;
                                                      tibetenChoose = false;
                                                      opacity = 1;
                                                      image = 'asset/rain.jpg';
                                                      setState(() {});
                                                      stopFile();
                                                      controller.reset();
                                                      Navigator.pop(
                                                        context,
                                                      );
                                                    },
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .bottomEnd,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10,
                                                          ),
                                                          child: Image.asset(
                                                            'asset/rain.jpg',
                                                            fit: BoxFit.cover,
                                                            height: 100,
                                                            width: 400,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            right: 5,
                                                            bottom: 5,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              10,
                                                            ),
                                                            child:
                                                                BackdropFilter(
                                                              filter:
                                                                  ImageFilter
                                                                      .blur(
                                                                sigmaX: 5,
                                                                sigmaY: 5,
                                                              ),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    1,
                                                                  ),
                                                                  color: Colors
                                                                      .grey[600]
                                                                      .withOpacity(
                                                                    0.4,
                                                                  ),
                                                                ),
                                                                height: 35,
                                                                width: 130,
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    "Rain",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Avenir',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      letterSpacing:
                                                                          1.2,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SlideTransition(
                                                  position: Tween<Offset>(
                                                          begin: Offset(
                                                              randomNumber(
                                                                  0.8, 0.21),
                                                              0),
                                                          end: Offset(0, 0))
                                                      .animate(
                                                          animationController),
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                      overlayColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                    ),
                                                    onPressed: () async {
                                                      jungleChoose = false;
                                                      rainChoose = false;
                                                      riverChoose = true;
                                                      tibetenChoose = false;
                                                      opacity = 1;
                                                      image = 'asset/river.jpg';
                                                      setState(() {});
                                                      stopFile();
                                                      controller.reset();
                                                      Navigator.pop(
                                                        context,
                                                      );
                                                    },
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .bottomEnd,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10,
                                                          ),
                                                          child: Image.asset(
                                                            'asset/river.jpg',
                                                            fit: BoxFit.cover,
                                                            height: 100,
                                                            width: 400,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            right: 5,
                                                            bottom: 5,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              10,
                                                            ),
                                                            child:
                                                                BackdropFilter(
                                                              filter:
                                                                  ImageFilter
                                                                      .blur(
                                                                sigmaX: 5,
                                                                sigmaY: 5,
                                                              ),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    1,
                                                                  ),
                                                                  color: Colors
                                                                      .grey[600]
                                                                      .withOpacity(
                                                                    0.4,
                                                                  ),
                                                                ),
                                                                height: 35,
                                                                width: 130,
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    "River",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Avenir',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      letterSpacing:
                                                                          1.2,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SlideTransition(
                                                  position: Tween<Offset>(
                                                          begin: Offset(
                                                              randomNumber(
                                                                  0.7, 0.21),
                                                              0),
                                                          end: Offset(0, 0))
                                                      .animate(
                                                          animationController),
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                      overlayColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                    ),
                                                    onPressed: () async {
                                                      jungleChoose = false;
                                                      rainChoose = false;
                                                      riverChoose = false;
                                                      tibetenChoose = true;
                                                      opacity = 1;
                                                      image =
                                                          'asset/tibeteanbowls.jpg';
                                                      setState(() {});
                                                      stopFile();
                                                      controller.reset();
                                                      Navigator.pop(
                                                        context,
                                                      );
                                                    },
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .bottomEnd,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10,
                                                          ),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                  offset:
                                                                      Offset(
                                                                    2.0,
                                                                    3.5,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            child: Image.asset(
                                                              'asset/tibeteanbowls.jpg',
                                                              fit: BoxFit.cover,
                                                              height: 100,
                                                              width: 400,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            right: 5,
                                                            bottom: 5,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              10,
                                                            ),
                                                            child:
                                                                BackdropFilter(
                                                              filter:
                                                                  ImageFilter
                                                                      .blur(
                                                                sigmaX: 5,
                                                                sigmaY: 5,
                                                              ),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    1,
                                                                  ),
                                                                  color: Colors
                                                                      .grey[600]
                                                                      .withOpacity(
                                                                    0.4,
                                                                  ),
                                                                ),
                                                                height: 35,
                                                                width: 130,
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    "Tibetean Bowls",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Avenir',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      letterSpacing:
                                                                          1.2,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            right: -10,
                                            top: -10,
                                            child: SizedBox(
                                              height: 38,
                                              width: 38,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.blueAccent[700],
                                                ),
                                                child: IconButton(
                                                  hoverColor:
                                                      Colors.transparent,
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  icon: Icon(
                                                    MdiIcons.volumeOff,
                                                    size: 22,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () async {
                                                    jungleChoose = false;
                                                    rainChoose = false;
                                                    riverChoose = false;
                                                    tibetenChoose = false;
                                                    image = '';
                                                    setState(() {});
                                                    stopFile();
                                                    controller.reset();
                                                    Navigator.pop(
                                                      context,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                animationController.reset();
                              },
                              child: Text(
                                'Pick Your Sound',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1,
                      width: MediaQuery.of(context).size.width / 1,
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Stack(
                            children: <Widget>[
                              Opacity(
                                opacity: opacity,
                                child: Align(
                                  alignment: FractionalOffset.center,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      140,
                                    ),
                                    child: Opacity(
                                      opacity: .4,
                                      child: Image.asset(
                                        image,
                                        fit: BoxFit.cover,
                                        height: 400,
                                        width: 400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: AnimatedBuilder(
                                  animation: controller,
                                  builder:
                                      (BuildContext context, Widget child) {
                                    return CustomPaint(
                                      painter: TimerPainter(
                                        animation: controller,
                                        backgroundColor: Colors.white,
                                        color: themeData.indicatorColor,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.center,
                                child: AnimatedBuilder(
                                  animation: controller,
                                  builder: (
                                    BuildContext context,
                                    Widget child,
                                  ) {
                                    return isPlaying
                                        ? Text(
                                            timerString,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 70,
                                            ),
                                          )
                                        : Text(
                                            '${minutes.toString()}:00',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 70,
                                            ),
                                          );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 248, 250, 50),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Meditation Time',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                65,
                                      ),
                                      Flexible(
                                        child: Stack(
                                          children: [
                                            NumberPicker(
                                              axis: Axis.horizontal,
                                              itemCount: 3,
                                              itemHeight: 80,
                                              itemWidth: 80,
                                              haptics: true,
                                              step: 5,
                                              minValue: 5,
                                              maxValue: 30,
                                              value: minutes,
                                              selectedTextStyle: TextStyle(
                                                color: Color(0xF5f8fa),
                                                fontSize: 30,
                                              ),
                                              textStyle: TextStyle(
                                                fontSize: 20,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey[300],
                                                    offset: Offset(
                                                      2.0,
                                                      3.5,
                                                    ),
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  15,
                                                ),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 5,
                                                ),
                                              ),
                                              onChanged: (val) {
                                                stopFile();
                                                image = '';
                                                minutes = val;
                                                controller.notifyListeners();
                                                controller.reset();
                                                controller.duration = Duration(
                                                  seconds: val * 60,
                                                );
                                                setState(() {
                                                  jungleChoose = false;
                                                  rainChoose = false;
                                                  riverChoose = false;
                                                  tibetenChoose = false;
                                                });
                                              },
                                            ),
                                            Positioned(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  40,
                                              right: getRight(),
                                              child: Text(
                                                minutes.toString(),
                                                style: TextStyle(
                                                  color: Colors.blue[500],
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                        ),
                                        child: controller.isAnimating
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Container(
                                                  height: 48,
                                                  width: 128,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colors.blueAccent[700],
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 48,
                                                        width: 48,
                                                        child:
                                                            RiveAnimation.asset(
                                                                'asset/play.riv'),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        'Pause',
                                                        style: TextStyle(
                                                          fontSize: 23,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Container(
                                                  height: 48,
                                                  width: 128,
                                                  color: Colors.blueAccent[700],
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 48,
                                                        width: 48,
                                                        child: RiveAnimation.asset(
                                                            'asset/pause.riv'),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        'Play',
                                                        style: TextStyle(
                                                          fontSize: 23,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                        onPressed: () {
                                          setState(
                                            () {
                                              isPlaying = true;
                                            },
                                          );
                                          if (controller.isAnimating) {
                                            controller.stop(canceled: true);
                                            player.pause();
                                          } else {
                                            getBackground();
                                            setState(() {});
                                            controller.reverse(
                                              from: controller.value == 0.0
                                                  ? 1.0
                                                  : controller.value,
                                            );
                                          }
                                          if (isPlaying == false) {
                                            stopFile();
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  banner != null
                      ? Container(
                          height: 50,
                          child: AdWidget(
                            ad: banner,
                          ),
                        )
                      : null,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint paint2 = Paint()
      ..color = Colors.blueAccent[700]
      ..strokeWidth = 17
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = Colors.blueAccent[700];
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint2);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
