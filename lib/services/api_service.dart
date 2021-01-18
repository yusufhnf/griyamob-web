import 'package:http/http.dart' as http;

class APIService {
  static String url = "http://127.0.0.1";

  static String _baseURL = url + ':3000/griyatest/admin';

  Future loginUser(String email, String password) async {
    var request = {"email": email, "password": password};
    final response = http.post("$_baseURL/login", body: request);
    return response;
  }

  Future createUser(
      String email, String position, String fullname, String password) async {
    var request = {
      "email": email,
      "position": position,
      "fullname": fullname,
      "password": password
    };
    final response = http.post("$_baseURL/register", body: request);
    return response;
  }

  Future getNotification() {
    final response = http.get("$_baseURL/notification");
    return response;
  }

  Future getUnconfirmTopup() {
    final response = http.get("$_baseURL/allunconfirm");
    return response;
  }

  Future getConfirmTopup() {
    final response = http.get("$_baseURL/allconfirm");
    return response;
  }

  Future acceptTopup(
      String adminid, String topupid, String userid, String nominal) {
    var request = {
      "adminid": adminid,
      "topupid": topupid,
      "userid": userid,
      "nominal": nominal
    };
    final response = http.post("$_baseURL/accepttopup", body: request);
    return response;
  }

  Future cancelTopup(String adminid, String topupid) {
    var request = {"adminid": adminid, "topupid": topupid};
    final response = http.post("$_baseURL/canceltopup", body: request);
    return response;
  }

  Future addHistory(String jumlah, String iduser, String action, String noref,
      String detail, String sumbertarget) {
    var request = {
      "iduser": iduser,
      "jumlah": jumlah,
      "action": action,
      "noref": noref,
      "detail": detail,
      "sumbertarget": sumbertarget
    };
    var response = http.post("$_baseURL/savehistory", body: request);
    return response;
  }

  Future getPromo() {
    final response = http.get("$_baseURL/promo");
    return response;
  }

  Future getAllHistory() {
    final response = http.get("$_baseURL/history");
    return response;
  }

  Future getAllSummaryHistory() {
    final response = http.get("$_baseURL/summaryhistory");
    return response;
  }

  Future postAnnouncement(String title, String detail, String adminid) {
    var request = {
      "title": title,
      "detail": detail,
      "adminid": adminid,
    };
    final response = http.post("$_baseURL/postannouncement", body: request);
    return response;
  }

  Future postPromo(String title, String detail) {
    var request = {"judul": title, "detail": detail};
    final response = http.post("$_baseURL/postpromo", body: request);
    return response;
  }

  Future getAdmin(String id) {
    var request = {"adminid": id};
    final response = http.post("$_baseURL/summary", body: request);
    return response;
  }

  Future statistik() {
    var response = http.get("$_baseURL/statistik");
    return response;
  }
}
