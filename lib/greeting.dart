class Greeting {
  static String getGreeting(int age) {
    if (age < 12) {
      return 'Child';
    } else if (age < 20) {
      return 'Teenager';
    } else {
      return 'Adult';
    }
  }
}
