import 'package:flutter/material.dart';
import '../../cubit/driver_cubit.dart';
import '../../cubit/driver_state.dart';
import '../../models/driver_request_model.dart';
import 'driver_request_offer_card.dart';

class DriverRequestDetailsSheet extends StatelessWidget {
  final DriverState state;
  final DriverCubit cubit;

  const DriverRequestDetailsSheet({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final request =
        state.selectedRequest ?? DriverRequestModel.mockRequests.first;

    return DriverRequestOfferCard(
      request: request,
      cubit: cubit,
    );
  }
}
