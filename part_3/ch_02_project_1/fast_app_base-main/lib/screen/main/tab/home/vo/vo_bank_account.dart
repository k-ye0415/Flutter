import 'package:fast_app_base/screen/main/tab/home/vo/vo_back.dart';

class BankAccount {
  final Bank bank;
  int balance;
  final String? accountTypeName;

  BankAccount(
    this.bank,
    this.balance, {
    this.accountTypeName,

    /// 옵셔널한 파라미터 값은 {} 로 감싸서 넣고싶음 넣고 말음말고, 즉, 그래서 변수도 nullable 로 선언함.
  });
}
