import '../entity/note.dart';
import '../service/notes_service.dart';

class NotesUseCase {
  NotesUseCase(this.service);

  final NotesService service;

  Future<List<Note>> getNotes() {
    return service.getNotes();
  }

  Future<Note> getNote(int id) {
    return service.getNote(id);
  }
}
