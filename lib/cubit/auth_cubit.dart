// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:booking_pesawat/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
}
