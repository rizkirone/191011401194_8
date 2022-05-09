import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomScrollView(
          slivers: [
            _AppBarSection(),
            _BodySection()
          ],
        ));
  }
}

class _AppBarSection extends StatelessWidget {
  const _AppBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350.0,
      title: const Text(
        "Pamulang",
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0.3,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.9],
                colors: [
                  Color.fromARGB(255, 63, 243, 78),
                  Color.fromARGB(255, 64, 137, 233),
                ],
              )),
        ),
      ),
      leading: const Icon(
        Icons.sort,
        color: Colors.white,
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      actions: const [
        Icon(
          Icons.more_vert_sharp,
          color: Colors.white,
        )
      ],
    );
  }
}


class _BodySection extends StatelessWidget {
  const _BodySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (_, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _first(),
                const SizedBox(height: 18.0,),

                _second(),
                const SizedBox(height: 64.0,),

                const CloudHour(),
                const SizedBox(height: 32.0,),

                _third(),
                const SizedBox(height: 32,),

                const Text(
                  "Ramalan cuaca ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF0066FF), fontSize: 14.0),
                ),
                const SizedBox(height: 32,),

                _fourth()
              ],
            ),
          );
        },
        childCount: 1,
      ),
    );
  }

  Widget _first() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Sebagian\nBerawan",
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
  Widget _second() {
    return Row(
      children: const [
        Text(
          "22°C/14°C",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 18.0,
        ),
        Text(
          "senin",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
  Widget _third() {
    return Column(
      children: const [
        Text(
          "Laporan Cuaca",
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 8.0,
        ),
        WeatherReport(),
      ],
    );
  }
  Widget _fourth() {
    return Column(
      children: [
        const Text(
          "Rincian cuaca",
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 10,
          children: const [
            WeatherDetails(title: "15", subtitle: "Suhu Terasa"),
            WeatherDetails(title: "16", subtitle: "Visibilitas"),
            WeatherDetails(title: "1.021", subtitle: "Tekanan Udara"),
            WeatherDetails(title: "Sangat Luas", subtitle: "UV"),
            WeatherDetails(title: "50%", subtitle: "Kelembaban"),
            WeatherDetails(title: "18 km/j", subtitle: "Angin Barat"),
          ],
        )
      ],
    );
  }
}


//class unutk menampilkan hari dan cuaca
class DummyData {
  static List<WeatherModel> weatherData() {
    final List<WeatherModel> list = [
      WeatherModel(
          date: "9 mei",
          day: "Hari ini",
          icon: Icons.wb_sunny_outlined,
          weather: "Hujan",
          temperature: "20°C"),
      WeatherModel(
          date: "10 mei",
          day: "selasa",
          icon: Icons.wb_sunny_outlined,
          weather: "cerah",
          temperature: "35°C"),

    ];
    return list;
  }

  static List<CloudModel> cloudData() {
    final List<CloudModel> list = [];
    return list;
  }
}

class WeatherModel {
  final String date;
  final String day;
  final IconData icon;
  final String weather;
  final String temperature;

  WeatherModel(
      {required this.date,
      required this.day,
      required this.icon,
      required this.weather,
      required this.temperature});
}

class CloudModel {
  final String hour;
  final IconData icon;
  final String cloud;
  final String temperature;

  CloudModel(
      {required this.hour,
      required this.icon,
      required this.cloud,
      required this.temperature});
}

class CloudHour extends StatelessWidget {
  const CloudHour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cloudData = DummyData.cloudData();
    return ListView.builder(
      shrinkWrap: true,
        itemCount: cloudData.length,
        itemBuilder: (context, index) {
          return CloudHourItem(cloudModel: cloudData[index]);
        }
    );
  }
}


//class model jam tampilan
class CloudHourItem extends StatelessWidget {
  final CloudModel cloudModel;

  const CloudHourItem({Key? key, required this.cloudModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(cloudModel.hour,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),),
          const SizedBox(height: 8.0,),

          Icon(cloudModel.icon, size: 30,),
          const SizedBox(height: 8.0,),

          Text(cloudModel.cloud,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),),
          const SizedBox(height: 8.0,),

          Text(cloudModel.temperature,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),),
        ],
      ),
    );
  }
}

//class unutk menampilkan detail cuaca
class WeatherDetails extends StatelessWidget {
  final String title;
  final String subtitle;

  const WeatherDetails({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 26.0),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}

//class report cuaca
class WeatherReport extends StatelessWidget {
  const WeatherReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherData = DummyData.weatherData();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          return WeatherReportItem(weatherModel: weatherData[index]);
        });
  }
}

class WeatherReportItem extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherReportItem({Key? key, required this.weatherModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            weatherModel.date,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),
          ),
          Text(
            weatherModel.day,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),
          ),
          Icon(weatherModel.icon),
          Text(
            weatherModel.weather,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),
          ),
          Text(
            weatherModel.temperature,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}