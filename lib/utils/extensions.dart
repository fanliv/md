extension EnumExt on Enum {
  String get text => toString().split('.').last;
}

extension NullSafeString on String? {
  String get safe => this ?? '';
}
