// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'course_bloc.dart';

abstract class CourseState {}

class CourseIndex extends CourseState {
  int index;
  CourseIndex({required this.index});
  factory CourseIndex.initial() {
    return CourseIndex(index: 0);
  }

  CourseIndex copyWith({int? index}) {
    return CourseIndex(index: index ?? this.index);
  }

  List<Object?> get props => [index];
}
