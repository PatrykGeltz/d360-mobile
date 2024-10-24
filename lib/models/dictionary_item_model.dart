class DictionaryItemModel {
  const DictionaryItemModel({required this.name});

  final String name;

  copyWith({String? name}) {
    return DictionaryItemModel(
      name: name ?? this.name
    );
  }
}