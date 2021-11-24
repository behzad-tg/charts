import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project8/consts.dart';

import '../animations.dart';

class Tab2Page extends StatefulWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> {
  bool _isLoaded = false;

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
                  padding: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  height: 150,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: 200,
                          height: 100,
                          child: Image.asset('assets/images/work-vector.png'),
                        ),
                      ),
                      const Positioned(
                          top: 0,
                          right: 10,
                          child: Text(
                            'Follow Flutter_tg',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          )),
                      const Positioned(
                          top: 25,
                          right: 10,
                          child: Text('for more App like this',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600))),
                      Positioned(
                          bottom: 25,
                          right: 10,
                          child: Text('@Flutter_Tg',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red[300])))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              RightToleftAnimation(
                0.1,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Statiscs - Monthly',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          const Text(
                            '2020 Sales',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.circle,
                            color: lightprimaryColor,
                            size: 13,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              RightToleftAnimation(
                0.2,
                 Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 250,
                  child: barChart(),
                ),
              ),
              RightToleftAnimation(
                0.3,
                 Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          color: boxColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(100),
                          ),
                        ),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Products',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Sales',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'june 01',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue),
                            ),
                            const Text(
                              'june 30 2020',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                Icon(
                                  Icons.circle,
                                  color: Colors.blue,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Profit',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: const [
                                Icon(
                                  Icons.circle,
                                  color: Colors.deepOrange,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.deepOrange),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -20,
                        right: -20,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: backGroundColor),
                          child: aspectRatio(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const RightToleftAnimation(
                0.4,
                 Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Chart - Wikipedia',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const RightToleftAnimation(
                0.5,
                 Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Charts are often used to ease understanding of large quantities of data and the relationships between parts of the data. Charts can usually be read more quickly than the raw data. They are used in a wide variety of fields, and can be created by hand (often on graph paper) or by computer using a charting application. Certain types of charts are more useful for presenting a given data set than others. For example,',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  BarChart barChart() {
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          enabled: false,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.transparent,
            tooltipPadding: const EdgeInsets.all(0),
            tooltipMargin: 5,
            getTooltipItem: (
              BarChartGroupData group,
              int groupIndex,
              BarChartRodData rod,
              int rodIndex,
            ) {
              return BarTooltipItem(
                "${rod.y.round().toString()}%",
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) => TextStyle(
              color: lightprimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            margin: 10,
            getTitles: (double value) {
              switch (value.toInt()) {
                case 0:
                  return 'Mn';
                case 1:
                  return 'Te';
                case 2:
                  return 'Wd';
                case 3:
                  return 'Tu';
                case 4:
                  return 'Fr';
                case 5:
                  return 'St';
                case 6:
                  return 'Sn';
                default:
                  return '';
              }
            },
          ),
          leftTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(showTitles: false),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                  y: _isLoaded?40:10, colors: [Colors.blue.shade900, lightprimaryColor], width: 30)
            ],
            showingTooltipIndicators: [0],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                  y: _isLoaded?70:10, colors: [Colors.blue.shade900, lightprimaryColor], width: 30)
            ],
            showingTooltipIndicators: [0],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                  y: _isLoaded?30:10, colors: [Colors.blue.shade900, lightprimaryColor], width: 30)
            ],
            showingTooltipIndicators: [0],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                  y: _isLoaded?50:10, colors: [Colors.blue.shade900, lightprimaryColor], width: 30)
            ],
            showingTooltipIndicators: [0],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                  y: _isLoaded?90:10, colors: [Colors.blue.shade900, lightprimaryColor], width: 30)
            ],
            showingTooltipIndicators: [0],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                  y: _isLoaded?80:10, colors: [Colors.blue.shade900, lightprimaryColor], width: 30)
            ],
            showingTooltipIndicators: [0],
          ),
        ],
        alignment: BarChartAlignment.spaceAround,
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
      ),
      swapAnimationDuration: const Duration(milliseconds: 500),
      swapAnimationCurve: Curves.linear,
    );
  }

  AspectRatio aspectRatio() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(enabled: false),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 10,
                  centerSpaceRadius: 50,
                  sections: List.generate(
                    2,
                    (i) {
                      const fontSize = 16.0;
                      const radius = 30.0;
                      switch (i) {
                        case 0:
                          return PieChartSectionData(
                            color: Colors.blue,
                            value: _isLoaded?40:99,
                            title: _isLoaded?'40%':'99%',
                            radius: radius,
                            titleStyle: const TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          );
                        case 1:
                          return PieChartSectionData(
                            color: Colors.deepOrange,
                            value: _isLoaded?60:1,
                            title: _isLoaded?'60%':'1%',
                            radius: radius,
                            titleStyle: const TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          );
                        default:
                          throw Error();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
