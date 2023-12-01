import 'package:equatable/equatable.dart';

enum ViewState { initial, loading, error, success }

extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.loading;

  bool get isInitial => this == ViewState.initial;

  bool get isError => this == ViewState.error;

  bool get isSuccess => this == ViewState.success;
}

class ViewData<T> extends Equatable {
  final ViewState status;
  final T? data;
  final String message;

  const ViewData._({
    required this.status,
    this.data,
    this.message = "",
  });

  factory ViewData.success({T? data}) {
    return ViewData._(status: ViewState.success, data: data);
  }

  factory ViewData.error({required String message}) {
    return ViewData._(status: ViewState.error, message: message);
  }

  factory ViewData.loading({required String message}) {
    return ViewData._(status: ViewState.loading, message: message);
  }

  factory ViewData.initial() {
    return const ViewData._(status: ViewState.initial);
  }

  @override
  List<Object?> get props => [status, data, message];
}
