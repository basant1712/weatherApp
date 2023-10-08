
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a  City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async{
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.GetWeather(cityName: value);
              Navigator.pop(context);
              },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter city name',
                labelText: 'Search',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                )),
          ),
        ),
      ),
    );
  }
}

