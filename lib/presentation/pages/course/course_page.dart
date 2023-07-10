// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:education_app/application/blocs/course/course_bloc.dart';
import 'package:education_app/presentation/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursePage extends StatelessWidget {
  String? name;
  CoursePage({Key? key, this.name}) : super(key: key);

  Map<String, dynamic> videos = {
    'flutter': {
      'videos': [
        'Introduction To Flutter',
        'Setup Flutter Projects',
        'Start to Build and Finish the Project'
      ],
      'description':
          'Consequat deserunt aliqua fugiat incididunt. Ut quis occaecat labore aliqua. Irure anim mollit officia occaecat magna. Non labore qui aliquip duis.'
    },
    'python': {
      'videos': [
        'Introduction To Python',
        'Setup Python Projects',
        'Start to Build and Finish the Python Project'
      ],
      'description':
          'Consequat deserunt aliqua fugiat incididunt. Ut quis occaecat labore aliqua. Irure anim mollit officia occaecat magna. Non labore qui aliquip duis.'
    },
    'react_native': {
      'videos': [
        'Introduction To React Native',
        'Setup React Native Projects',
        'Start to Build and Finish the React Native Project'
      ],
      'description':
          'Consequat deserunt aliqua fugiat incididunt. Ut quis occaecat labore aliqua. Irure anim mollit officia occaecat magna. Non labore qui aliquip duis.'
    },
    'c#': {
      'videos': [
        'Introduction To C#',
        'Setup C# Projects',
        'Start to Build and Finish the C# Project'
      ],
      'description':
          'Consequat deserunt aliqua fugiat incididunt. Ut quis occaecat labore aliqua. Irure anim mollit officia occaecat magna. Non labore qui aliquip duis.'
    }
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CourseBloc(),
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.black,
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.notifications,
                ),
              )
            ],
            title: Text(
              name!,
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('assets/images/$name.png'))),
                  width: Constants().sizeMQ(context).width,
                  height: 200,
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(Icons.play_arrow_rounded,
                          size: 40, color: Colors.black.withOpacity(0.7)),
                    ),
                  ),
                ),
              ),
              BlocBuilder<CourseBloc, CourseIndex>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<CourseBloc>()
                                        .add(ChangeIndex(index: 0));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: state.index == 0
                                          ? Constants()
                                              .theme(context)
                                              .primaryColor
                                          : Constants()
                                              .theme(context)
                                              .primaryColor
                                              .withOpacity(0.5)),
                                  child: const Text('Videos'),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<CourseBloc>()
                                          .add(ChangeIndex(index: 1));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: state.index == 1
                                            ? Constants()
                                                .theme(context)
                                                .primaryColor
                                            : Constants()
                                                .theme(context)
                                                .primaryColor
                                                .withOpacity(0.5)),
                                    child: const Text('Description')),
                              )
                            ],
                          ),
                        ),
                        context.watch<CourseBloc>().state.index == 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  List videosFromList = videos[name
                                      .toString()
                                      .replaceAll(' ', '_')
                                      .toLowerCase()]['videos'];
                                  return ListTile(
                                    leading: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Constants()
                                              .theme(context)
                                              .primaryColor),
                                      child: const Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: Text(
                                      videosFromList[index],
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  );
                                },
                                itemCount: videos.length - 1,
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Text(
                                  videos[name
                                      .toString()
                                      .replaceAll(' ', '_')
                                      .toLowerCase()]['description'],
                                  textAlign: TextAlign.start,
                                ),
                              )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
