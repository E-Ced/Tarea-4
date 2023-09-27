import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tip Time',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.attach_money,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Cost of Service', focusColor: Colors.green),
                    onChanged: (value) {
                      print("$value");
                      context.read<HomeProvider>().setRecibo(value);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.food_bank,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("How was the service?"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Radio(
                    value: 0.20,
                    groupValue: context.watch<HomeProvider>().getPorcentaje,
                    onChanged: (value) =>
                        context.read<HomeProvider>().setPorcentaje(value)),
                Text("Amazing 20%")
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 0.18,
                    groupValue: context.watch<HomeProvider>().getPorcentaje,
                    onChanged: (value) =>
                        context.read<HomeProvider>().setPorcentaje(value)),
                Text("Good 18%")
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 0.15,
                    groupValue: context.watch<HomeProvider>().getPorcentaje,
                    onChanged: (value) =>
                        context.read<HomeProvider>().setPorcentaje(value)),
                Text("Okay 15%")
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.credit_card,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Round up tip?"),
                      ],
                    ),
                  ],
                ),
                Switch(
                    value: context.read<HomeProvider>().getRTip,
                    onChanged: (value) {
                      context.read<HomeProvider>().setRTip(value);
                    })
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () =>
                        context.read<HomeProvider>().calcularCuenta(),
                    child: Text("Calculate"))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "Tip amount: \$${context.watch<HomeProvider>().getCuentaFinal.toStringAsFixed(2)}")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
