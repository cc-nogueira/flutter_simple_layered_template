import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../service/notes_service.dart';
import '../entity/note.dart';
import '../service_api/notes_service_api.dart';

part 'notes_use_case.g.dart';

/// [NotesUseCase] provider.
@riverpod
NotesUseCase notesUseCase(NotesUseCaseRef ref) => NotesUseCase(ref.watch(notesServiceProvider));

/// All notes provider.
@riverpod
Future<List<Note>> notes(NotesRef ref) {
  final NotesUseCase usecase = ref.watch(notesUseCaseProvider);
  return usecase.getNotes();
}

/// Use cases for notes.
///
/// Give access to notes services enforcing business rules.
class NotesUseCase {
  /// Const constructor.
  const NotesUseCase(this.service);

  /// Injected service.
  final NotesServiceApi service;

  /// Return all notes.
  ///
  /// Business rules:
  /// - Returns all notes from the service.
  /// - Returns an empty list if the service has no notes.
  ///
  /// Expects:
  /// - Service should throw [TimeoutException] if the remote service does not respond.
  Future<List<Note>> getNotes() {
    return service.getNotes();
  }

  /// Return a single note.
  ///
  /// Business rules:
  /// - Returns a note with the given positive id.
  ///
  /// Validations:
  /// - Throws [ArgumentError] if the given id is not positive.
  ///
  /// Expects:
  /// - Service should throw [ArgumentError] if no notes are found with the given id.
  /// - Service should throw [TimeoutException] if the remote service does not respond.
  Future<Note> getNote(int id) {
    if (id <= 0) throw ArgumentError('Id should be a positive value');
    return service.getNote(id);
  }

  /// Add a new note.
  ///
  /// Business rules:
  /// - New note should have a non positive id (usually -1).
  /// - Will return a new note with a generated positive id.
  ///
  /// Validations:
  /// - Throws [ArgumentError] if a positive id is already assigned to the note.
  ///
  /// Expects:
  /// - Service should throw [TimeoutException] if the remote service does not respond.
  Future<Note> addNote(Note note) {
    if (note.id > 0) throw ArgumentError('Note id should not be positive for new notes');
    return service.addNote(note);
  }

  /// Update an existing note.
  ///
  /// Business rules:
  /// - Note should have a positive id.
  ///
  /// Validations:
  /// - Throws [ArgumentError] if the note does not have a positive id or if the
  ///
  /// Expects:
  /// - Service should throw an [ArgumentError] if the note with the given id is not found.
  /// - Service should throw [TimeoutException] if the remote service does not respond.
  Future<void> updateNote(Note note) {
    if (note.id <= 0) throw ArgumentError('Note should have a positive id');
    return service.updateNote(note);
  }
}
