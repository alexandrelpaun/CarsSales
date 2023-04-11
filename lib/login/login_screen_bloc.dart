import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenInitial()) {
    on<LoginScreenEvent>((event, emit) {
      on<Login>(
        (event, emit) async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          emit(LoginScreenLoading());

          try {
            final credential =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.username ?? '',
              password: event.password ?? '',
            );

            await prefs.setString(
              'auth_token',
              credential.credential?.token as String,
            );
            emit(LoginScreenLoaded());
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              emit(
                LoginScreenError(
                  error: 'User not found!',
                ),
              );
            }
            emit(
              LoginScreenError(
                error: e.code,
              ),
            );
          } catch (e) {
            emit(
              LoginScreenError(
                error: e.toString(),
              ),
            );
          }
        },
      );
      // TODO: implement event handler
    });
  }
}
