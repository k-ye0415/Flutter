import 'package:fast_app_base/screen/main/tab/home/bank_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan, 23498072389540);
final bankAccountShinhan2 = BankAccount(bankShinhan, 23498072389540);
final bankAccountKakao1 = BankAccount(bankKakao, 23498072389540, accountTypeName: "텅~장~");
final bankAccountKakao2 = BankAccount(bankKakao, 3236745, accountTypeName: "데이트 통장");
final bankAccountKakao3 = BankAccount(bankKakao, 6575462199);
final bankAccountKakao4 = BankAccount(bankKakao, 6575462199);
final bankAccountToss1 = BankAccount(bankTtoss, 241);
final bankAccountToss2 = BankAccount(bankTtoss, 241);

final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountKakao1,
  bankAccountKakao2,
  bankAccountKakao3,
  bankAccountKakao4,
  bankAccountToss1,
  bankAccountToss2,
];
