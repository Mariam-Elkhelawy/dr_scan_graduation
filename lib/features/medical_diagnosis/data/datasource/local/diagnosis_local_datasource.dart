import 'dart:convert';
import 'package:flutter/services.dart';

import '../../models/question_model.dart';
import '../../models/symptoms_model.dart';

abstract class DiagnosisLocalDataSource {
  Future<List<SymptomModel>> getSymptomsList();
  Future<List<QuestionModel>> getQuestionList();
}

class DiagnosisLocalDataSourceImpl extends DiagnosisLocalDataSource {
  @override
  Future<List<SymptomModel>> getSymptomsList() async {
    final String response =
        await rootBundle.loadString('assets/data/symptoms.json');
    final data = await json.decode(response);
    return (data as List).map((e) => SymptomModel.fromJson(e)).toList();
  }

  @override
  Future<List<QuestionModel>> getQuestionList() async {
    final String response =
        await rootBundle.loadString('assets/data/questions.json');
    final data = json.decode(response);
    return (data as List).map((e) => QuestionModel.fromJson(e)).toList();
  }
}
