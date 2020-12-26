part of "services.dart";

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignOutResult> signUp(
      String email,
      String password,
      String name,
      List<String> selectedGenres,
      String selectedLanguages) async {
    try {
      //input data to auth firebase
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //get result from auth firebase, and then convert to userModel
      UserModel user = result.user.convertToUser(
        name: name,
        selectedGenre: selectedGenres,
        selectedLanguage: selectedLanguages,
      );

      //save to fireStore
      await UserServices.updateUser(user);

      return SignInSignOutResult(user: user);
    } catch (e) {
      return SignInSignOutResult(message: e.toString().split(',')[0]);
    }
  }

  static Future<SignInSignOutResult> signIn(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = await userCredential.user.fromFireStore();

      return SignInSignOutResult(user: userModel);
    } catch (e) {
      return SignInSignOutResult(message: e.toString().split(',')[0]);
    }
  }

  static Future<void> signOut() async => await _auth.signOut();
}

class SignInSignOutResult {
  final UserModel user;
  final String message;

  SignInSignOutResult({this.user, this.message});
}
