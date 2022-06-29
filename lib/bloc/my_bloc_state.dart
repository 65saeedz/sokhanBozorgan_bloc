part of 'my_bloc_bloc.dart';

enum Status { initial, loading, loaded, error }

class MyBlocState extends Equatable {
  final String error;
  final String sokhan;
  final String author;
  final Status stateStatus;
  MyBlocState({
    required this.error,
    required this.sokhan,
    required this.author,
    required this.stateStatus,
  });

  factory MyBlocState.initial() {
    return MyBlocState(
        error: '', sokhan: '', author: '', stateStatus: Status.initial);
  }

  @override
  String toString() {
    return 'MyBlocState(error: $error, sokhan: $sokhan, author: $author, stateStatus: $stateStatus)';
  }

  MyBlocState copyWith({
    String? error,
    String? sokhan,
    String? author,
    Status? stateStatus,
  }) {
    return MyBlocState(
      error: error ?? this.error,
      sokhan: sokhan ?? this.sokhan,
      author: author ?? this.author,
      stateStatus: stateStatus ?? this.stateStatus,
    );
  }

  @override
  List<Object?> get props => [stateStatus, error, sokhan, author];
}
