import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_account_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

void main() async {
  // Futer 의 기념 개본
  /// Future == 미래
  /// 시간이 걸리는 Comutation 작업 또는 응답을 기다리는 상태
  print("start");
  getBankAccount().then((value) {
    print(value.toString());
  });
  print("end");

  /// 해당 코드를 실행해보면, start -> end -> value.toString 이 출력된다.

  print("start");
  final account = await getBankAccount();
  print(account);
  print("end");

  /// 해당 코드를 실행해보면, start -> account -> end 로 출력됨
  /// getBankAccount 의 반환값을 가져올 때 까지 기다렸다가 가져오면 그때 순차적으로 코드 실행
  ///

  getBankAccount()
      .timeout(1.seconds)
      .onError((error, stackTrace) => []); // 반환값을 기다리는 메소드의 반환값과 같은 타입을 에러시에 반환해줘야함.
  /// timeout 날 때에 처리하는 방법이다.

  try {
    await getBankAccount().timeout(1.seconds);
  } catch (e) {
    print(e);
  }

  /// error 가 났다고 그대로 반환값을 해줘야하는 것 보단, error 표시를 하는게 더 일반적인 방법. 그럴 땐 try/catch 문을 사용한다.
  /// try / catch 문에서는 await 키워드와 함께 사용해야한다.


}

Future<List<BankAccount>> getBankAccount() async {
  await sleepAsync(2.seconds);
  return bankAccounts;
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}
