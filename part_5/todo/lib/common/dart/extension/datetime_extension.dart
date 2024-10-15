import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate => DateFormat('yyyy/MM/dd').format(this);

  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDateTime => DateFormat('dd/MM/yyyy HH:mm').format(this);

  String get relativeDays {
    final diffDays = difference(DateTime
        .now()
        .onlyDate).inDays;
    /// 현재 시간을 가져와서, `onlyDate`라는 getter 를 이용하여 날짜만 가져온 후, `inDays` 를 통해 차이가 나는 일 수를 계산한다.
    /// 그래서 diffDays 의 타입은 int 가 된다.
    final inNegative = diffDays.isNegative;
    /// int 의 값이 음수인지 양수인지 확인 하는 boolean 값.

    final checkCondition = (diffDays, inNegative);
    return switch(checkCondition) {
      (0, _) => _tillToday,
      (1, _) => _tillTomorrow,
      (_, true) => _dayPassed,
      _ => _dayLeft,
    };
  }

  DateTime get onlyDate => DateTime(year, month, day);

  String get _dayLeft =>
      'daysLeft'
          .tr(namedArgs: {"daysCount": difference(DateTime
      ///                 해당 값을 : -> 이후 값을 변환해줌 / android 의 fommater 같은 그런 느낌이쥬
          .now()
          .onlyDate).inDays.toString()});

  String get _dayPassed =>
      'daysPassed'
          .tr(namedArgs: {"daysCount": difference(DateTime
          .now()
          .onlyDate).inDays.abs().toString()});

  String get _tillToday => 'tillToday'.tr();

  String get _tillTomorrow => 'tillTomorrow'.tr();
}
