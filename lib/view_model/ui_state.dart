enum ViewStatus { initial, loading, success, empty, error }

class UIState<T> {
  final ViewStatus status;
  final T? data;
  final String? errorMessage;

  UIState._({required this.status, this.data, this.errorMessage});

  factory UIState.initial() => UIState._(status: ViewStatus.initial);
  factory UIState.loading() => UIState._(status: ViewStatus.loading);
  factory UIState.success(T data) => UIState._(status: ViewStatus.success, data: data);
  factory UIState.empty() => UIState._(status: ViewStatus.empty);
  factory UIState.error(String message) => UIState._(status: ViewStatus.error, errorMessage: message);
}