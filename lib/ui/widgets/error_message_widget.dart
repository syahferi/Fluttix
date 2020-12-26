part of 'widgets.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String errorMessage;

  ErrorMessageWidget(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
