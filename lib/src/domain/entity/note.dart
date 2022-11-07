import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const factory Note({
    @Default(-1) int id,
    @Default('') String title,
    @Default('') String text,
  }) = _Note;
}
