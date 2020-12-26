part of "models.dart";

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenre;
  final String selectedLanguage;
  final int balance;

  UserModel(this.id, this.email,
      {this.name,
      this.profilePicture,
      this.selectedGenre,
      this.selectedLanguage,
      this.balance});

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedLanguage,
        selectedGenre,
        balance,
      ];

  @override
  String toString() =>
      '[$id] - $name, $email, $profilePicture, $selectedLanguage, $selectedGenre, $balance,';
}
