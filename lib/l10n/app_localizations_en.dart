// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'First Notes App';

  @override
  String get homeTitle => 'My Notes';

  @override
  String get detailsTitle => 'Note Details';

  @override
  String get noteTitle => 'New Note';

  @override
  String get allEmptyMessage => 'No Notes Made Yet';

  @override
  String get highEmptyMessage => 'No High Priority Notes';

  @override
  String get mediumEmptyMessage => 'No Medium Priority Notes';

  @override
  String get lowEmptyMessage => 'No Low Priority Notes';

  @override
  String get fabToolTip => 'Add New Note';

  @override
  String get titleTextField => 'Title';

  @override
  String get descriptionTextField => 'Description';

  @override
  String get createNoteButton => 'Create';

  @override
  String get saveNoteButton => 'Save';

  @override
  String get lowPriority => 'Low';

  @override
  String get mediumPriority => 'Medium';

  @override
  String get highPriority => 'High';

  @override
  String get allTabTitle => 'All';

  @override
  String get highTabTitle => 'High';

  @override
  String get mediumTabTitle => 'Medium';

  @override
  String get lowTabTitle => 'Low';
}
