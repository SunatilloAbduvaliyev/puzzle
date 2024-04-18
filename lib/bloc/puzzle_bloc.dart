import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzle/bloc/puzzle_event.dart';

import '../data/model/puzzle_model.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc() : super(PuzzleState(tiles: _generateInitialTiles())) {
    on<InitializePuzzle>(_onInitializePuzzle);
    on<TileTapped>(_onTileTapped);
  }

  static List<int?> _generateInitialTiles() {
    List<int?> tiles = List<int>.generate(15, (index) => index + 1)..shuffle();
    tiles.add(null); // Bo'sh joy qo'shish.
    return tiles;
  }

  void _onInitializePuzzle(InitializePuzzle event, Emitter<PuzzleState> emit) {
    emit(state.copyWith(tiles: _generateInitialTiles(), moves: 0, stopwatch: Stopwatch()..reset()));
  }

  void _onTileTapped(TileTapped event, Emitter<PuzzleState> emit) {
    int index = event.index;
    List<int?> newTiles = List<int?>.from(state.tiles);
    int? emptyIndex = newTiles.indexOf(null);
    if ((index % 4 != 0 && index - 1 == emptyIndex) ||
        ((index + 1) % 4 != 0 && index + 1 == emptyIndex) ||
        (index - 4 == emptyIndex) ||
        (index + 4 == emptyIndex)) {
      newTiles[emptyIndex] = newTiles[index];
      newTiles[index] = null;
      emit(state.copyWith(tiles: newTiles, moves: state.moves + 1));
    }
  }
}
