import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class BarChartSample3 extends StatefulWidget {
  final Pokemon pokemon;

  BarChartSample3({
    required this.pokemon,
  });

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  double maior = 200;

  retornaMaior(Pokemon pokemon) {
    int maiorStat = 0;

    for (int i = 0; i < pokemon.pokemon_model.stats.length; i++) {
      if (pokemon.pokemon_model.stats[i].baseStat > maiorStat) {
        maiorStat = pokemon.pokemon_model.stats[i].baseStat;
      }
    }

    setState(() {
      maior = maiorStat.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    retornaMaior(widget.pokemon);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      color: Colors.transparent,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maior,
          barTouchData: BarTouchData(
            enabled: false,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              tooltipPadding: const EdgeInsets.all(0),
              tooltipMargin: 8,
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                return BarTooltipItem(
                  rod.y.round().toString(),
                  TextStyle(
                    color: Colors.redAccent.shade400,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              getTextStyles: (value) {
                const textStyle = const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16);
                return textStyle;
              },
              margin: 20,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return 'HP';
                  case 1:
                    return 'ATK';
                  case 2:
                    return 'DEF';
                  case 3:
                    return 'SP.Atk';
                  case 4:
                    return 'SP.Def';
                  case 5:
                    return 'SPD';
                  default:
                    return '';
                }
              },
            ),
            leftTitles: SideTitles(showTitles: false),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                    y: widget.pokemon.pokemon_model.stats[0].baseStat
                        .toDouble(),
                    colors: [
                      Colors.redAccent.shade400,
                      Colors.indigo.shade900,
                    ])
              ],
              showingTooltipIndicators: [0],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                    y: widget.pokemon.pokemon_model.stats[1].baseStat
                        .toDouble(),
                    colors: [
                      Colors.redAccent.shade400,
                      Colors.indigo.shade900,
                    ])
              ],
              showingTooltipIndicators: [0],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                    y: widget.pokemon.pokemon_model.stats[2].baseStat
                        .toDouble(),
                    colors: [
                      Colors.redAccent.shade400,
                      Colors.indigo.shade900,
                    ])
              ],
              showingTooltipIndicators: [0],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                    y: widget.pokemon.pokemon_model.stats[3].baseStat
                        .toDouble(),
                    colors: [
                      Colors.redAccent.shade400,
                      Colors.indigo.shade900,
                    ])
              ],
              showingTooltipIndicators: [0],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                    y: widget.pokemon.pokemon_model.stats[4].baseStat
                        .toDouble(),
                    colors: [
                      Colors.redAccent.shade400,
                      Colors.indigo.shade900,
                    ])
              ],
              showingTooltipIndicators: [0],
            ),
            BarChartGroupData(
              x: 5,
              barRods: [
                BarChartRodData(
                    y: widget.pokemon.pokemon_model.stats[5].baseStat
                        .toDouble(),
                    colors: [
                      Colors.redAccent.shade400,
                      Colors.indigo.shade900,
                    ])
              ],
              showingTooltipIndicators: [0],
            ),
          ],
        ),
      ),
    );
  }
}
