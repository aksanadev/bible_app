class LoadingState {
  bool isLoading;

  LoadingState({required this.isLoading});

  LoadingState copyWith({bool? isLoading}) {
    return LoadingState(isLoading: isLoading ?? this.isLoading);
  }
}
