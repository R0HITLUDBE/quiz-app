class QuizQuestion {
  const QuizQuestion(this.text, this.answers); // constructor
  final String text;
  final List<String> answers;

  List<String> getShuffleAnswer() {
    final shuffledlist = List.of(answers);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}
