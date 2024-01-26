import 'package:flutter/material.dart';
import 'package:newsapp/core/components/app_bar_with_back_btn.dart';

class SingleNewsScreen extends StatefulWidget {
  const SingleNewsScreen({super.key});

  @override
  State<SingleNewsScreen> createState() => _SingleNewsScreenState();
}

class _SingleNewsScreenState extends State<SingleNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackBtn(title: "Filter"),
      body: Column(
        children: [
          Text(
            "This is the title",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Column(
            children: [
              Text(
                "By Wyre Davise",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                "CNN News | USA",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              divider(),
              Row(
                children: [
                  Text(
                    "nacncnkjanckjnkjacnkjanckjasnkjnaj",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0),
      child: Divider(
        color: Color.fromARGB(255, 228, 228, 228),
        indent: 10,
        endIndent: 10,
      ),
    );
  }
}
