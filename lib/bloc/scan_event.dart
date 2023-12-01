import 'package:equatable/equatable.dart';

abstract class ScanEvent extends Equatable {}

class ScanIdCard extends ScanEvent {
  @override
  List<Object?> get props => [];
}
