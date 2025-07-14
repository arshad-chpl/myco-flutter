class BranchModel {
  final String blockId;
  final String blockName;

  BranchModel({required this.blockId, required this.blockName});

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      blockId: json['block_id'].toString(),
      blockName: json['block_name'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BranchModel &&
              runtimeType == other.runtimeType &&
              blockId == other.blockId;

  @override
  int get hashCode => blockId.hashCode;

  @override
  String toString() => 'BranchModel(blockId: $blockId, blockName: $blockName)';

  factory BranchModel.empty() {
    return BranchModel(
      blockId: '',
      blockName: '',
    );
  }

}
