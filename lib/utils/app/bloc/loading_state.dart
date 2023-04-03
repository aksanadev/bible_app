class LoadingState {
  bool isLoading;

  LoadingState({required this.isLoading});

  LoadingState copywith({
    bool? isLoading,
  }) =>
      LoadingState(isLoading: isLoading ?? this.isLoading);
}
