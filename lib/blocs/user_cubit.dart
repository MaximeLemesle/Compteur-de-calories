import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<Map<String, dynamic>> {
  UserCubit() : super({});

  void updateUserInformation(Map<String, dynamic> userInfo) {
    emit(userInfo);
  }

  Map<String, dynamic> getUserInformation({
    String gender = 'Homme',
    double weight = 74.0,
    int height = 174,
    int age = 22,
    String goal = 'Perte de poids',
  }) {
    return <String, dynamic>{
      'gender': gender,
      'weight': weight,
      'height': height,
      'age': age,
      'goal': goal,
    };
  }
}