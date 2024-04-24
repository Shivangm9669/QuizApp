class QuizQuestion {
  const QuizQuestion(this.ques, this.answers);

  final String ques;
  final List<String> answers;

  List<String> getShuffled() {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();

    return shuffleList;
  }
}
