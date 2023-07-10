// ignore_for_file: must_be_immutable

import 'package:education_app/application/blocs/course/course_bloc.dart';
import 'package:education_app/presentation/core/constant.dart';
import 'package:education_app/presentation/pages/course/course_page.dart';
import 'package:education_app/presentation/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final constants = Constants();
  HomePage({super.key});

  List categoryNames = [
    'Category',
    'Classes',
    'Free Course',
    'BookStore',
    'Live Course',
    'Leaderboard',
  ];

  List<Color> categoryColors = [
    const Color.fromARGB(255, 255, 78, 47),
    const Color.fromARGB(255, 44, 209, 129),
    const Color.fromARGB(125, 47, 106, 255),
    const Color.fromARGB(255, 179, 47, 255),
    const Color.fromARGB(255, 255, 47, 206),
    const Color.fromARGB(255, 54, 47, 255),
  ];

  List<Icon> catIcons = [
    const Icon(
      Icons.category,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.video_library,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.assignment,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.store,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.play_circle_fill,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.emoji_events,
      color: Colors.white,
      size: 30,
    ),
  ];

  List imgList = [
    'Flutter',
    'Python',
    'React Native',
    'C#',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: constants.theme(context).primaryColor,
          elevation: 0,
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                color: constants.theme(context).primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.dashboard,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications,
                            color: Colors.white))
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Hi Programmer',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextField(
                        style: const TextStyle(fontSize: 18),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search,
                                color: constants.theme(context).primaryColor),
                            border: InputBorder.none)),
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categoryNames.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: categoryColors[index],
                      ),
                      child: Center(
                        child: catIcons[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        categoryNames[index],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Courses',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Courses',
                  style: TextStyle(fontSize: 16, color: Colors.blue.shade500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: imgList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: constants.sizeMQ(context).height *
                      0.1 /
                      constants.sizeMQ(context).width /
                      0.2),
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    context.push(
                      '/${RouteName.coursePage}/${Uri.encodeComponent(imgList[index])}',
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/${imgList[index]}.png',
                          width: constants.sizeMQ(context).width / 0.2,
                          height: 110,
                        ),
                        Text(
                          imgList[index],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '3 Video',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.6)),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
