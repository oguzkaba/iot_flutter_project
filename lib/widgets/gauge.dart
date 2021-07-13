import 'package:iot_flutter_project/util/globals.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

class GaugeWidget extends StatelessWidget {
  const GaugeWidget({
    Key key,
    @required this.size,
    @required this.value,
  }) : super(key: key);

  final Size size;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: size.height * 0.12,
      width: size.width * 0.2,
      decoration: BoxDecoration(
        color: GlobalVal.box_orange,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 30,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: SfRadialGauge(
        title: GaugeTitle(
            text: "Temp", textStyle: TextStyle(fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(
              startAngle: 160,
              endAngle: 20,
              centerY: 0.5,
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: Text(value.toString() + '°C',
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: GlobalVal.orange))),
                    angle: 90,
                    positionFactor: 0.95)
              ],
              showLabels: false,
              interval: 10,
              minimum: -10,
              maximum: 40,
              axisLineStyle: AxisLineStyle(thickness: 8),
              pointers: <GaugePointer>[
                NeedlePointer(
                    value: value ?? 20,
                    enableAnimation: true,
                    animationDuration: 2000,
                    needleStartWidth: 0,
                    needleEndWidth: 2,
                    needleColor: Color(0xff222222),
                    knobStyle: KnobStyle(
                        color: Colors.redAccent,
                        borderColor: Color(0xff222222),
                        knobRadius: 0.06,
                        borderWidth: 0.04),
                    tailStyle: TailStyle(
                        color: Color(0xff222222), width: 2, length: 0.15)),
                RangePointer(
                    value: value ?? 20,
                    width: 8,
                    enableAnimation: true,
                    animationDuration: 2000,
                    color: Colors.orangeAccent)
              ])
        ],
      ),
    );
  }
}
