import 'package:education_app/presentation/core/constant.dart';
import 'package:education_app/presentation/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  final constants = Constants();
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.5),
          child: AppBar(
              backgroundColor: constants.theme(context).primaryColor,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(70))),
              bottom: PreferredSize(
                  preferredSize:
                      Size.fromHeight(MediaQuery.of(context).size.height * 0.5),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.asset(
                      'assets/images/books.png',
                      scale: 0.8,
                    ),
                  ))),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: constants.theme(context).primaryColor,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
              ),
              child: Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      padding: const EdgeInsets.all(30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: const Text(
                                    'Learning is everything',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Text(
                                  'Enjoy and Focus learning with Educify. Wherever you are',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              margin: const EdgeInsets.only(top: 40),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 80),
                                      backgroundColor: constants
                                          .theme(context)
                                          .primaryColor),
                                  onPressed: () {
                                    context.go('/${RouteName.homePage}');
                                  },
                                  child: const Text(
                                    'Get Start',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ]))),
            ),
          ],
        ));
  }
}
