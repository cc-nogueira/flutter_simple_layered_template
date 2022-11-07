import '../../../domain/entity/note.dart';
import '../../../domain/service/notes_service.dart';
import '../mapper/note_mapper.dart';
import '../repository/notes_repository.dart';

class FakeNotesService implements NotesService {
  const FakeNotesService(this.repo);

  final NotesRepository repo;
  final NoteMapper mapper = const NoteMapper();
  final Duration responseDelay = const Duration(seconds: 2);

  @override
  Future<List<Note>> getNotes() async {
    await Future.delayed(responseDelay);
    return mapper.mapEntities(repo.all);
  }

  @override
  Future<Note> getNote(int id) async {
    await Future.delayed(responseDelay);
    final model = repo.note(id);
    if (model == null) {
      throw ArgumentError('Note not found with id $id');
    }
    return mapper.mapEntity(model);
  }

  @override
  Future<void> addNote(Note note) async {
    await Future.delayed(responseDelay);
    final model = mapper.mapModel(note);
    repo.save(model);
  }
}
