import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entity/note.dart';
import '../domain/service_api/notes_service_api.dart';
import 'mapper/note_mapper.dart';
import 'repository/in_memory_notes_repository.dart';
import 'repository_api/notes_repository_api.dart';

part 'notes_service.g.dart';

/// Singleton provider for a [NotesServiceApi].
@Riverpod(keepAlive: true)
NotesServiceApi notesService(NotesServiceRef ref) =>
    NotesService(ref.watch(notesRepositoryProvider));

/// Service for notes stored in a repository.
///
/// Responsible for mapping service models to domain entities
/// and responding with domain exceptions when required.
class NotesService implements NotesServiceApi {
  /// Const constructor.
  const NotesService(this.repo);

  /// Injected repository.
  final NotesRepositoryApi repo;

  /// Notes mapper.
  final NoteMapper mapper = const NoteMapper();

  @override
  Future<List<Note>> getNotes() async {
    final models = await repo.all;
    return mapper.mapEntities(models);
  }

  @override
  Future<Note> getNote(int id) async {
    final model = await repo.note(id);
    if (model == null) {
      throw ArgumentError('Note not found with id $id');
    }
    return mapper.mapEntity(model);
  }

  @override
  Future<Note> addNote(Note note) async {
    if (note.id > 0) throw ArgumentError('A new note should not have a positive id');
    final model = mapper.mapModel(note);
    final saved = await repo.addOrUpdate(model);
    return mapper.mapEntity(saved);
  }

  @override
  Future<void> updateNote(Note note) async {
    if (note.id <= 0) throw ArgumentError('A note should have a positive id');
    final model = mapper.mapModel(note);
    await repo.addOrUpdate(model);
  }
}
