part of 'services.dart';

class UserServices {
  static CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserModel user) async {
    String genres = '';

    for (var genre in user.selectedGenre) {
      genres += genre + ((genre != user.selectedGenre.last) ? ',' : '');
    }

    _collectionReference.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenre,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? ''
    });
  }

  static Future<UserModel> getUser(String id) async {
    DocumentSnapshot docSnapshot = await _collectionReference.doc(id).get();

    return UserModel(
      id,
      docSnapshot['email'],
      name: docSnapshot['name'],
      balance: docSnapshot['balance'],
      profilePicture: docSnapshot['profilePicture'],
      selectedGenre: (docSnapshot['selectedGenres'] as List)
          .map((value) => value.toString())
          .toList(growable: false),
      selectedLanguage: docSnapshot['selectedLanguage'],
    );
  }
}
