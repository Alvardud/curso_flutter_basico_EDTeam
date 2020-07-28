import 'package:curso_flutter_basico/services/internet_service.dart';
import 'package:http/http.dart' as http;

Future<String> obtenerNoticias() async {
  if(await checkInternet()){
    try{
      var respuesta = await http.get(
          "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=PCag2eaDkX9UVcs7vMEd5lAIWDtXTUt1",
          headers: {'Content-Type': 'application/json'});
      return respuesta.body;
    }catch(e){
      print(e);
      return null;
    }
  }
  return null;
}
