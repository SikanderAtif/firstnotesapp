// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تطبيق الملاحظات الأول';

  @override
  String get homeTitle => 'ملاحظاتي';

  @override
  String get detailsTitle => 'تفاصيل الملاحظة';

  @override
  String get noteTitle => 'ملاحظة جديدة';

  @override
  String get allEmptyMessage => 'لم يتم تدوين أي ملاحظات بعد';

  @override
  String get highEmptyMessage => 'لا توجد ملاحظات ذات أولوية عالية';

  @override
  String get mediumEmptyMessage => 'لا توجد ملاحظات ذات أولوية متوسطة';

  @override
  String get lowEmptyMessage => 'لا توجد ملاحظات منخفضة الأولوية';

  @override
  String get fabToolTip => 'إضافة ملاحظة جديدة';

  @override
  String get titleTextField => 'عنوان';

  @override
  String get descriptionTextField => 'تفصيل';

  @override
  String get createNoteButton => 'يخلق';

  @override
  String get saveNoteButton => 'يحفظ';

  @override
  String get lowPriority => 'منخفضة';

  @override
  String get mediumPriority => 'متوسطة';

  @override
  String get highPriority => 'قصوى';

  @override
  String get allTabTitle => 'الجميع';

  @override
  String get highTabTitle => 'قصوى';

  @override
  String get mediumTabTitle => 'متوسطة';

  @override
  String get lowTabTitle => 'منخفضة';
}
