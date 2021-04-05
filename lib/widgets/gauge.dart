import 'package:iot_flutter_project/util/globals.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

class GaugeWidget extends StatelessWidget {
  const GaugeWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: size.height * 0.15,
      width: size.width * 0.1,
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
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: Text('24.0 °C',
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: GlobalVal.orange))),
                    angle: 90,
                    positionFactor: 0.9)
              ],
              showLabels: false,
              interval: 10,
              minimum: -10,
              maximum: 40,
              axisLineStyle: AxisLineStyle(thickness: 10),
              pointers: <GaugePointer>[
                NeedlePointer(
                    value: 24,
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
                    value: 24,
                    width: 10,
                    enableAnimation: true,
                    animationDuration: 2000,
                    color: Colors.orangeAccent)
              ])
        ],
      ),
    );
  }
}
