import '../model/note_model.dart';

/// Simple in memory repository
class NotesRepository {
  int _maxId = 7;

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

  Iterable<NoteModel> get all => _notes.values;

  NoteModel? note(int id) => _notes[id];

  void save(NoteModel model) {
    model = _assignId(model);
    _notes[model.id] = model;
  }

  NoteModel _assignId(NoteModel model) {
    if (model.id > 0) {
      return model;
    }
    ++_maxId;
    return model.copyWith(id: _maxId);
  }
}
