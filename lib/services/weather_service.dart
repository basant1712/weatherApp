import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_models.dart';

class WeatherService {
  final Dio dio;

  final String baseURL='http://api.weatherapi.com/v1';
  final String apiKey='6997fb5774d545d88e1205452230710';
  WeatherService(this.dio);
  Future<WeatherModel?> getCurrentWeather({required String cityName}) async{
    try {
      Response response=await dio.get('$baseURL/forecast.json?key=$apiKey&q=$cityName');
      WeatherModel weatherModel=WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage=e.response?.data['error']['message']??'oops,there is an error,try later';
      throw Exception(errMessage);
    }
    catch(e){
      throw Exception('oops,there is an error,try later');
    }
  }
}
