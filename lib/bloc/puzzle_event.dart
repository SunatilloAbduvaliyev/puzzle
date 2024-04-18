
import 'package:equatable/equatable.dart';

abstract class PuzzleEvent extends Equatable {
  const PuzzleEvent();

  @override
  List<Object?> get props => [];
}

class InitializePuzzle extends PuzzleEvent {}

class TileTapped extends PuzzleEvent {
  final int index;

  const TileTapped(this.index);

  @override
  List<Object?> get props => [index];
}
