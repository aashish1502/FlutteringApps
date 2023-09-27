class QuizQuestion {

  final String question;
  final List<String> options;

  const QuizQuestion(this.question, this.options);

  List<String> getShuffeledAnswers() {
    final List<String> temp = List.of(options);
    temp.shuffle();
    return temp;
  }

}