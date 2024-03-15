import 'package:http/http.dart';
import '../../../global/constants/inerceptor/interceptor.dart';

class GetPoductService {
  Future<Response> getProducts() async {
    return await httpRequests(
      headers: {'content-type': 'application/json'},
      url: '${baseUrl}products',
      httpType: HttpMethods.get,
    );
  }
}
