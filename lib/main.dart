import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}


class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> GetWeatherCubit(),
      child: BlocProvider(
        create: (context)=>GetWeatherCubit(),
        child: Builder(
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeView(),
              theme: ThemeData(
                primaryColor:getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition,
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  MaterialColor? getThemeColor(String? condition){
    if(condition =='sunny'){
      return Colors.orange;
    }else if(condition=='snowy'){
      return Colors.lightBlue;
    }
    return null;
  }
}