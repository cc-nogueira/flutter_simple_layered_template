import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/note_model.dart';
import '../repository_api/notes_repository_api.dart';

part 'in_memory_notes_repository.g.dart';

/// Singleton provider for [InMemoryNotesRepository].
/// The repository holds state "in memory", thus the keepAlive requirement.
@Riverpod(keepAlive: true)
NotesRepositoryApi notesRepository(NotesRepositoryRef ref) => InMemoryNotesRepository();

/// Simple in memory repository implementation.
///
/// This class should be managed as a persitent singleton.
/// State is kept in memory and won't be persited between executions.
///
/// Fakes remote access with fixed delays for all API implementations.
class InMemoryNotesRepository implements NotesRepositoryApi {
  /// Response delay to emulate remote access delay.
  final Duration responseDelay = const Duration(seconds: 2);

  /// Current value for id generation.
  int _maxId = 7;

  /// Internal storage.
  final _notes = {
    1: const NoteModel(id: 1, title: 'First note', content: 'Just a test.'),
    2: const NoteModel(id: 2, title: 'Second note'),
    5: const NoteModel(id: 7, title: 'Another note', content: 'It feels good!'),
    7: const NoteModel(
      id: 7,
      title: 'Long note',
      content: 'When things go on and on...\n\n'
          'It sometimes becomes repetitive\n'
          'repetitive\nrepetitive\nrepetitive\nrepetitive\nrepetitive\n\n'
          'repetitive\nrepetitive\nrepetitive\nrepetitive\nrepetitive\n\n'
          'repetitive\nrepetitive\nrepetitive\nrepetitive\nrepetitive\n\n'
          'repetitive\nrepetitive\nrepetitive\nrepetitive\nrepetitive\n\n'
          'repetitive\nrepetitive\nrepetitive\nrepetitive\nrepetitive\n\n'
          'repetitive\nrepetitive\nrepetitive\nrepetitive\nrepetitive\n\n'
          'repetitive\nrepetitive\nrepetitive\nrepetitive\nrepetitive\n'
          '...',
    ),
  };

  /// Returns all notes after a fixed delay
  @override
  Future<Iterable<NoteModel>> get all async {
    await Future.delayed(responseDelay);
    return _notes.values;
  }

  /// Returns a single note by id after a fixed delay.
  ///
  /// Returns null if the note is not found by id.
  @override
  Future<NoteModel?> note(int id) async {
    await Future.delayed(responseDelay);
    return _notes[id];
  }

  /// Add or update a note in local storage after a fixed delay.
  ///
  /// Generates a model.id if it does not have a positive value.
  @override
  Future<NoteModel> addOrUpdate(NoteModel model) async {
    await Future.delayed(responseDelay);
    model = _garanteeId(model);
    _notes[model.id] = model;
    return model;
  }

  /// Id generation  garantee.
  ///
  /// Assigns a new id to new models otherwise validates the id exists.
  NoteModel _garanteeId(NoteModel model) {
    if (model.id > 0) {
      if (!_notes.containsKey(model.id)) {
        throw ArgumentError('Note not found with the given id');
      }
      return model;
    }
    ++_maxId;
    return model.copyWith(id: _maxId);
  }
}
