abstract class NewsEvent {}

class FetchNewsEvent extends NewsEvent {
  final int page;

  FetchNewsEvent(this.page);
}
