part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupSucess extends SignupState{}

class SignupFailed extends SignupState{}
