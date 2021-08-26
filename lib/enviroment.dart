class Enviroment {
  String url_local = "http://192.168.1.50:300/api";
  String url_qa = "http://192.168.1.50:3000/api";

  String get _url_qa => url_qa;
  String get _url_local => url_local;
}
