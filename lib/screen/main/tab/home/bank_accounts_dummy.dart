import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan = BankAccount(bankShinhan, 3000000);
final bankAccountKakao1 = BankAccount(bankKakao, 30021240000);
final bankAccountKakao2 = BankAccount(bankKakao, 32342675369, accountTypeName: "경조사 통장");
final bankAccountKakao3 = BankAccount(bankKakao, 3002128237240000, accountTypeName: "데이트 통장");
final bankAccountTtoss = BankAccount(bankTtoss, 3000025600);

final bankAccounts = [
  bankShinhan,
  bankAccountKakao1,
  bankAccountKakao2,
  bankAccountKakao3,
  bankAccountTtoss,
];
