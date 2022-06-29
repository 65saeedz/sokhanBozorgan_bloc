import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sokhan_bozorgan/Data/repository.dart';

part 'my_bloc_event.dart';
part 'my_bloc_state.dart';

class MyBlocBloc extends Bloc<MyBlocEvent, MyBlocState> {
  Repository repository;
  MyBlocBloc({required this.repository}) : super(MyBlocState.initial()) {
    on<MyBlocEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: Status.loading));
      var newSokhan = await repository.getNewSokhan();
      emit(state.copyWith(
          author: newSokhan.author,
          error: '',
          sokhan: newSokhan.content,
          stateStatus: Status.loaded));
    });
  }
}
