part of "extension.dart";

extension FirebaseUserExtension on User {
  UserModel convertToUser(
          {String name = 'no name',
          List<String> selectedGenre = const [],
          String selectedLanguage = 'english',
          int balance = 50000}) =>
      UserModel(
        this.uid,
        this.email,
        name: name,
        selectedGenre: selectedGenre,
        selectedLanguage: selectedLanguage,
        balance: balance,
      );

  Future<UserModel> fromFireStore() async =>
      await UserServices.getUser(this.uid);
}
