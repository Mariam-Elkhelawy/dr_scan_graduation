import 'package:dr_scan_app/features/medical_diagnosis/data/repository/diagnosis_repository.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/error_handler.dart';
import '../../data/models/question_model.dart';

class QuestionsViewModel extends GetxController {
  QuestionsViewModel(this.diagnosisRepository);
  final DiagnosisRepository diagnosisRepository;

  final _questions = Rx<List<QuestionModel>>([]);
  List<QuestionModel> get questions => _questions.value;

  getQuestions() async {
    final result = await diagnosisRepository.getQuestionList();
    result.fold(
      (error) => ErrorHandler.handleError(error),
      (questions) => _questions.value = questions,
    );
    // _questions.value = await diagnosisRepository.getQuestionList();
    update();
  }

  @override
  void onInit() async {
    getQuestions();
    super.onInit();
  }
}
