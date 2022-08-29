import 'package:flutter/material.dart';
import 'package:weather/presentation/widgets/custom_search.dart';

class AddLocationInitially extends StatefulWidget {
  const AddLocationInitially({Key? key}) : super(key: key);

  @override
  State<AddLocationInitially> createState() => _AddLocationInitiallyState();
}

class _AddLocationInitiallyState extends State<AddLocationInitially> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
            400,
            100,
          ),
          child: CustomSearch()),
    );
  }
}
