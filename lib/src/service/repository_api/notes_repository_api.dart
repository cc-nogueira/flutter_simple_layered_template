import '../model/note_model.dart';

/// CRUD repository for Notes API.
abstract class NotesRepositoryApi {
  /// Returns all notes.
  Future<Iterable<NoteModel>> get all;

  /// Returns a single note by id.
  ///
  /// Returns null if the note is not found by id.
  Future<NoteModel?> note(int id);

  /// Add or update a note in storage.
  ///
  /// Generates a model.id if it does not have a positive value.
  /// Throws [ArgumentError] if a model with a positive id is not found in storage for update.
  Future<NoteModel> addOrUpdate(NoteModel model);
}
