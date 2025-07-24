import 'package:equatable/equatable.dart';

class Branch extends Equatable {
  final String? blockId;
  final String? societyId;
  final String? blockName;

  const Branch({this.blockId, this.societyId, this.blockName});

  @override
  List<Object?> get props => [blockId, societyId, blockName];
}
