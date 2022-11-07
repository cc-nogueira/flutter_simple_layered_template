import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/provider/service_providers.dart';
import '../usecase/notes_use_case.dart';

final notesUseCaseProvider = Provider((ref) {
  final service = ref.watch(notesServiceProvider);
  return NotesUseCase(service);
});
