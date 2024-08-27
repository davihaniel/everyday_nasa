import 'package:everyday_nasa/features/presenter/pages/picture_page.dart';
import 'package:everyday_nasa/features/presenter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/round_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'APOD'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Welcome to Astronomy Picture of the Day!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 150,
                ),
                RoundButton(
                  label: "Select datetime",
                  onTap: () async {
                    var datePicked = await showDatePicker(
                      helpText: "Select a datetime",
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1995, 06, 16),
                      lastDate: DateTime.now(),
                    );
                    PicturePage.navigate(datePicked);
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
