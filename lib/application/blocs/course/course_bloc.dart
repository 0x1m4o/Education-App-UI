import 'package:flutter_bloc/flutter_bloc.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseIndex> {
  CourseBloc() : super(CourseIndex.initial()) {
    on<ChangeIndex>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}
