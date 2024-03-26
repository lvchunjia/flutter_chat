import 'login_dao.dart';

hiHeaders() {
  Map<String, String> headers = {
    "auth-token": 'ZmEtMjAyMS0wNC0xMaiAyMToyddMjoyddMC1mYQ==fg',
    "course-flag": 'fg',
    'boarding-pass': LoginDao.getBoardingPass() ?? ""
  };
  return headers;
}
