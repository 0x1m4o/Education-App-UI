// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'course_bloc.dart';

abstract class CourseEvent {}

class ChangeIndex extends CourseEvent {
  int index;
  ChangeIndex({
    required this.index,
  });
}
