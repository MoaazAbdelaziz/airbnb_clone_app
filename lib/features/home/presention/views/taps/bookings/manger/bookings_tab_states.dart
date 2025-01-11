sealed class BookingsTabStates {}

final class BookingsTabCubitInitial extends BookingsTabStates {}

final class BookingsTabCubitLoading extends BookingsTabStates {}

final class BookingsTabCubitSuccess extends BookingsTabStates {}

final class BookingsTabCubitError extends BookingsTabStates {
  final String message;
  BookingsTabCubitError(this.message);
}
