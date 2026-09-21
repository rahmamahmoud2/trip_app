import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app/features/passenger/matching/models/driver_offer_model.dart';
import '../../../core/constants/app_colors.dart';

import '../ride/models/ride_type_model.dart';
import 'passenger_state.dart';

class PassengerCubit extends Cubit<PassengerState> {
  PassengerCubit() : super(const PassengerState());

  Timer? _searchTimer;

  @override
  Future<void> close() {
    _searchTimer?.cancel();
    return super.close();
  }

  void selectCategory(RideCategory category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void setFare(int fare) {
    emit(state.copyWith(fare: fare));
  }

  void increaseFare([int amount = 5]) {
    emit(state.copyWith(fare: state.fare + amount));
  }

  void decreaseFare([int amount = 5]) {
    if (state.fare > amount) {
      emit(state.copyWith(fare: state.fare - amount));
    }
  }

  /// Screen 2/3 -> Screen 4: Confirm ride details, show route on map
  void confirmRide() {
    final effectiveFare = state.fare > 0 ? state.fare : 50;
    emit(
      state.copyWith(
        fare: effectiveFare,
        bookingStep: PassengerBookingStep.routePreview,
      ),
    );
  }

  /// Screen 4 -> Screen 5: Start looking for drivers
  void findRide() {
    _searchTimer?.cancel();
    emit(
      state.copyWith(
        bookingStep: PassengerBookingStep.findingDriver,
        offers: DriverOfferModel.mockOffers,
      ),
    );
  }

  /// Triggered manually or by timer: Screen 5 -> Screen 6
  void showOffers() {
    _searchTimer?.cancel();
    emit(
      state.copyWith(
        bookingStep: PassengerBookingStep.driverOffers,
        offers: DriverOfferModel.mockOffers,
      ),
    );
  }

  /// Decline one of the offers
  void declineOffer(String offerId) {
    final updated = state.offers.where((o) => o.id != offerId).toList();
    if (updated.isEmpty) {
      emit(
        state.copyWith(
          offers: updated,
          bookingStep: PassengerBookingStep.findingDriver,
        ),
      );
    } else {
      emit(state.copyWith(offers: updated));
    }
  }

  /// Accept driver offer
  void acceptOffer(DriverOfferModel offer, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Accepted offer from ${offer.driverName} (${offer.fare} EGP)',
        ),
        backgroundColor: AppColors.accentGreen,
      ),
    );
  }

  /// Cancel current request and reset back to initial state
  void cancelRequest() {
    _searchTimer?.cancel();
    emit(
      state.copyWith(
        bookingStep: PassengerBookingStep.selectRide,
        offers: DriverOfferModel.mockOffers,
      ),
    );
  }
}
