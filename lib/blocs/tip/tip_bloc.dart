import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wallet/models/tip_model.dart';
import 'package:wallet/services/tip_service.dart';

part 'tip_event.dart';
part 'tip_state.dart';

class TipBloc extends Bloc<TipEvent, TipState> {
  TipBloc() : super(TipInitial()) {
    on<TipEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is TipGet) {
        try {
          emit(TipLoading());

          final tip = await TipService().getTips();

          emit(TipSuccess(tip));
        } catch (e) {
          emit(TipFailed(e.toString()));
        }
      }
    });
  }
}
