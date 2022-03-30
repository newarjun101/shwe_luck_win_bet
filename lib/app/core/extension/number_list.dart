List<String> threeDNumberGenerate = List<String>.generate(1000, (counter) {
  String numbers = counter.toString();
  if (numbers.length < 2) {
    return "00" + numbers;
  }
  if (numbers.length < 3) {
    return "0" + numbers;
  }
  return numbers;
});
