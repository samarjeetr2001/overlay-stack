import 'package:flutter_application/module/data/emi_selection_repository.dart';
import 'package:flutter_application/module/model/emi_selection_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'emi_selection_event.dart';
import 'emi_selection_state.dart';

class EmiSelectionBloc extends Bloc<EmiSelectionEvent, EmiSelectionState> {
  final EmiSelectionRepository _repository;

  EmiSelectionBloc(this._repository) : super(EmiSelectionLoadingState()) {
    on<EmiSelectionErrorEvent>((event, emit) => null);
    on<EmiSelectionInitializedEvent>((event, emit) {
      emit(
        EmiSelectionInitialState(
            emiSelectionDetails: event.emiSelectionDetails),
      );
    });
    on<SaveLoanAmountEvent>((event, emit) {
      final currentState = state as EmiSelectionInitialState;
      emit(
        SaveLoanAmountState(
          emiSelectionDetails: currentState.emiSelectionDetails,
          selectedAmount: event.selectedAmount,
        ),
      );
    });
    on<SaveEmiOptionEvent>((event, emit) {
      final currentState = state as SaveLoanAmountState;
      emit(
        SaveEmiOptionState(
          emiSelectionDetails: currentState.emiSelectionDetails,
          selectedAmount: currentState.selectedAmount,
          selectedEmi: event.selectedEmi,
        ),
      );
    });
    on<SaveBankEvent>((event, emit) {
      final currentState = state as SaveEmiOptionState;
      emit(
        SaveEmiOptionState(
          emiSelectionDetails: currentState.emiSelectionDetails,
          selectedAmount: currentState.selectedAmount,
          selectedEmi: currentState.selectedEmi,
          selectedAccount: event.selectedAccount,
        ),
      );
    });
    on<EditLoanAmountEvent>((event, emit) {
      final currentState = state as EmiSelectionInitialState;
      emit(
        EmiSelectionInitialState(
            emiSelectionDetails: currentState.emiSelectionDetails),
      );
    });
    on<EditEmiOptionEvent>((event, emit) {
      final currentState = state as EmiSelectionInitialState;
      emit(
        SaveLoanAmountState(
          emiSelectionDetails: currentState.emiSelectionDetails,
          selectedAmount: currentState.selectedAmount,
        ),
      );
    });
    on<EditBankEvent>((event, emit) {
      final currentState = state as EmiSelectionInitialState;
      emit(
        SaveEmiOptionState(
          emiSelectionDetails: currentState.emiSelectionDetails,
          selectedAmount: currentState.selectedAmount,
          selectedEmi: currentState.selectedEmi,
          selectedAccount: currentState.selectedAccount,
        ),
      );
    });
  }

  void fetchEmiSelectionData() {
    final data = _repository.getEmiSelectionDetails();
    if (data is EmiSelectionModel) {
      add(EmiSelectionInitializedEvent(data));
    } else {
      add(EmiSelectionErrorEvent());
    }
  }
}
