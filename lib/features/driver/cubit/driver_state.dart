import '../models/driver_request_model.dart';

enum DriverStep {
  feed,
  requestDetails,
  customFare,
  waitingForReply,
  tripAccepted,
  tripStarted,
}

class DriverState {
  final bool isOnline;
  final DriverStep step;
  final List<DriverRequestModel> requests;
  final DriverRequestModel? selectedRequest;
  final int counterFare;
  final String fareInputString;

  const DriverState({
    this.isOnline = true,
    this.step = DriverStep.feed,
    this.requests = DriverRequestModel.mockRequests,
    this.selectedRequest,
    this.counterFare = 59,
    this.fareInputString = '59',
  });

  DriverState copyWith({
    bool? isOnline,
    DriverStep? step,
    List<DriverRequestModel>? requests,
    DriverRequestModel? selectedRequest,
    bool clearSelectedRequest = false,
    int? counterFare,
    String? fareInputString,
  }) {
    return DriverState(
      isOnline: isOnline ?? this.isOnline,
      step: step ?? this.step,
      requests: requests ?? this.requests,
      selectedRequest:
          clearSelectedRequest ? null : (selectedRequest ?? this.selectedRequest),
      counterFare: counterFare ?? this.counterFare,
      fareInputString: fareInputString ?? this.fareInputString,
    );
  }
}
