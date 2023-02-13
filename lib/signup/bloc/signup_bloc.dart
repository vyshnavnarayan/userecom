import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ecommerce_user/signup/repository/signup_repo.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState>{
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async{
      // TODO: implement event handler
      if (event is UserSignupEvent){
       try {
        await createUser(event);
         emit(SignupSucess());
       } catch (e) {
         emit(SignupFailed());
       }
      }
    });
  }
}

