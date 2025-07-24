import 'package:equatable/equatable.dart';

class BranchResponseEntity extends Equatable {
  final List<BranchEntity>? blocks;
  final String? message;
  final String? status;

  const BranchResponseEntity({
    this.blocks,
    this.message,
    this.status,
  });

  @override
  List<Object?> get props => [blocks, message, status];
}

class BranchEntity extends Equatable {
  final String? blockId;
  final String? societyId;
  final String? blockName;
  final String? blockStatus;

  const BranchEntity({
    this.blockId,
    this.societyId,
    this.blockName,
    this.blockStatus,
  });

  @override
  List<Object?> get props => [blockId, societyId, blockName, blockStatus];
}
