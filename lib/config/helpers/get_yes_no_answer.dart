import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getYesNoAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final data = response.data;
    final yesNoModel = YesNoModel.fromJsonMap(data);
    return yesNoModel.toMessageEntity();
  }
}
