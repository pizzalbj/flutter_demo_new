void main() {
  DateTime dateTime = new DateTime.now();
  DateTime dateTimeUtc = new DateTime.now().toUtc();
  print(dateTime);
  print(dateTimeUtc);
  print("");
  String dateTimeStr = dateTime.toIso8601String();
  String dateTimeUtcStr = dateTimeUtc.toIso8601String();
  print(dateTimeStr);
  print(dateTimeUtcStr);
  print("");
  DateTime dateTimeNew = DateTime.parse(dateTimeStr);
  DateTime dateTimeUtcNew = DateTime.parse(dateTimeUtcStr);
  print(dateTimeNew);
  print(dateTimeNew.year);
  print(dateTimeUtcNew);
  print(dateTimeUtcNew.year);
  print("");
  print(dateTimeNew.difference(new DateTime(2010)).inDays);
}
