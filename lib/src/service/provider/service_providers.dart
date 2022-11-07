import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/service/notes_service.dart';
import '../fake/impl/fake_notes_service.dart';
import '../fake/repository/notes_repository.dart';

/// NotesService implementation
final notesServiceProvider = Provider<NotesService>((_) => FakeNotesService(NotesRepository()));
