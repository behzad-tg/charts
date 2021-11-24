import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project8/animations.dart';
import 'package:project8/consts.dart';
import 'package:transparent_image/transparent_image.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  bool _isLoaded = false;
  List<dynamic> watchlist = [
    {
      'logo':
          'https://i.pinimg.com/564x/d7/18/3f/d7183f72078df410f83279c1b7bbc191.jpg',
      'currency': 'DIS-USD.SW',
      'comp': 'Walt Disnay Co.',
      'percent': '+0.018%',
      'status': true,
    },
    {
      'logo':
          'https://i.pinimg.com/564x/4f/7e/7d/4f7e7d0f2096fad08802899827da92a5.jpg',
      'currency': 'NIKE',
      'comp': 'Nike Inc.',
      'percent': '-2.6%',
      'status': false,
    },
    {
      'logo':
          'https://i.pinimg.com/564x/72/0d/6c/720d6c777bfc6095244807c90eee7014.jpg',
      'currency': 'TSLA',
      'comp': 'Tesla Motors Inc',
      'percent': '+5.1%',
      'status': true,
    },
    {
      'logo':
          'https://i.pinimg.com/564x/db/89/56/db8956274c664edad28399ce99482351.jpg',
      'currency': 'AAPL',
      'comp': 'Apple Inc.',
      'percent': '+0.18%',
      'status': true,
    },
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 80, right: 20, top: 20),
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              RightToleftAnimation(
                0,
                Container(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 20, bottom: 10),
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Flutter-Tg.IRI',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Flutter_tg',
                        style: TextStyle(fontSize: 15, color: Colors.white24),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: mainData(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              RightToleftAnimation(
                0.1,
                AnimatedFlipCounter(
                  value: _isLoaded ? 108.16 : 0,
                  fractionDigits: 2,
                  wholeDigits: 3,
                  suffix: 'T',
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.fastOutSlowIn,
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              const RightToleftAnimation(
                0.2,
                Text(
                  '+ 0.19 (0.18%)',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              const SizedBox(height: 40),
              const RightToleftAnimation(
                0.3,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Statistics:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 130,
                child: GridView.count(
                  crossAxisCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 40,
                  children: [
                    _gridItem('Open', 106.93, 0.0),
                    _gridItem('High', 108.40, 0.1),
                    _gridItem('Low', 106.81, 0.2),
                    _gridItem('Volume', 106.93, 0.0),
                    _gridItem('Avg Vol', 108.40, 0.1),
                    _gridItem('Max', 106.81, 0.2),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const RightToleftAnimation(
                0.7,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Watch List:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RightToleftAnimation(
                0.8,
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: watchlist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100)),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: watchlist[index]['logo'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    watchlist[index]['currency'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    watchlist[index]['comp'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white24),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            watchlist[index]['percent'],
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: watchlist[index]['status']
                                    ? Colors.green
                                    : Colors.red[400]),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: CircleAvatar(
                        backgroundColor: Colors.white10,
                        child: Icon(
                          Icons.add,
                          size: 25,
                          color: Colors.white24,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'ADD',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _gridItem(String label, double value, double index) {
    return RightToleftAnimation(
      0.4 + index,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white24),
          ),
          const SizedBox(height: 5),
          AnimatedFlipCounter(
            value: _isLoaded ? value : 0,
            fractionDigits: 2,
            wholeDigits: 3,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn,
            textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
        ],
      ),
    );
  }

  LineChart mainData() {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
          show: false,
        ),
        gridData: FlGridData(
            show: true,
            horizontalInterval: 1.6,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                dashArray: const [3, 3],
                color: Colors.white.withOpacity(0),
                strokeWidth: 2,
              );
            },
            drawVerticalLine: false),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
          leftTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval: 1,
            getTextStyles: (context, value) => const TextStyle(
                color: Colors.white24,
                fontWeight: FontWeight.bold,
                fontSize: 13),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '1D';
                case 3:
                  return '5D';
                case 5:
                  return '3M';
                case 7:
                  return '6M';
                case 9:
                  return '1Y';
                case 11:
                  return 'MAX';
              }
              return '';
            },
            margin: 0,
          ),
        ),
        minX: 0,
        maxX: 12,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: _isLoaded
                ? const [
                    FlSpot(0, 1),
                    FlSpot(1, 2.5),
                    FlSpot(3, 1.5),
                    FlSpot(5, 3),
                    FlSpot(7, 2.5),
                    FlSpot(9, 4.5),
                    FlSpot(11, 3.5),
                    FlSpot(12, 4),
                  ]
                : const [
                    FlSpot(0, 0),
                    FlSpot(1, 0),
                    FlSpot(3, 0),
                    FlSpot(5, 0),
                    FlSpot(7, 0),
                    FlSpot(9, 0),
                    FlSpot(11, 0),
                    FlSpot(12, 0),
                  ],
            isCurved: true,
            colors: [Colors.red, lightprimaryColor],
            barWidth: 4,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
                show: true,
                gradientFrom: const Offset(0, 0),
                gradientTo: const Offset(0, 1),
                colors: [
                  lightprimaryColor.withOpacity(0.2),
                  lightprimaryColor.withOpacity(0),
                ]),
          ),
        ],
      ),
      swapAnimationDuration: const Duration(milliseconds: 500), // Optional
      swapAnimationCurve: Curves.linear,
    );
  }
}
