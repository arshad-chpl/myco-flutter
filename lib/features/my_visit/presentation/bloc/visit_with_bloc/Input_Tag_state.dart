class InputTagState {
  final List<String> Departmenttags;
  final List<String> Branchtags;
  const InputTagState({
    this.Departmenttags = const [],
    this.Branchtags = const [],
  });

  InputTagState copyWith({List<String>? Departmenttags ,List<String>? Branchtags  }) => InputTagState(
    Departmenttags: Departmenttags ?? this.Departmenttags,
    Branchtags: Branchtags ?? this.Branchtags,
  );
}
