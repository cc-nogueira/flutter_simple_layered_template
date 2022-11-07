import '../../../domain/entity/note.dart';
import '../model/note_model.dart';
import 'entity_mapper.dart';

class NoteMapper extends EntityMapper<Note, NoteModel> {
  const NoteMapper();

  @override
  Note mapEntity(NoteModel model) => Note(
        id: model.id,
        title: model.title,
        text: model.content,
      );

  @override
  NoteModel mapModel(Note entity) => NoteModel(
        id: entity.id,
        title: entity.title,
        content: entity.text,
      );
}
