import 'package:bloc/bloc.dart';
import 'package:booking_pesawat/models/user_destination_model.dart';
import 'package:equatable/equatable.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());
}
