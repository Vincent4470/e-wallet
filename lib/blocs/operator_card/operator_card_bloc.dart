import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wallet/models/operator_card_model.dart';
import 'package:wallet/services/operator_card_service.dart';

part 'operator_card_event.dart';
part 'operator_card_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is OperatorCardGet) {
        try {
          emit(OperatorCardLoading());

          final operatorCards = await OperatorCardService().getOperatorCards();

          emit(OperatorCardSuccess(operatorCards));
        } catch (e) {
          emit(OperatorCardFaild(e: toString()));
        }
      }
    });
  }
}
