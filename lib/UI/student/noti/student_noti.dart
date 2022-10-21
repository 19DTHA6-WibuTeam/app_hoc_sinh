import 'package:doan_chuyen_nganh/UI/student/noti/autocomplete_prediction.dart';
import 'package:doan_chuyen_nganh/UI/student/noti/location_list_tile.dart';
import 'package:doan_chuyen_nganh/UI/student/noti/network.dart';
import 'package:doan_chuyen_nganh/UI/student/noti/place_auto_complete_response.dart';
import 'package:doan_chuyen_nganh/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudentNoti extends StatefulWidget {
  const StudentNoti({super.key});

  @override
  State<StudentNoti> createState() => _StudentNotiState();
}

class _StudentNotiState extends State<StudentNoti> {
  List<AutocompletePrediction> placePredictions = [];

  void placeAutocomplete(String query) async {
    Uri uri =
        Uri.https("maps.googleapis.com", "maps/api/place/autocomplete/json", {
      "input": query,
      "key": Dimens.apiKey,
    });
    String? response = await Network.fetchUrl(uri);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Form(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            onChanged: ((value) {
              placeAutocomplete(value);
            }),
            textInputAction: TextInputAction.search,
            decoration: const InputDecoration(
                hintText: "Search location",
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Icon(Icons.map),
                )),
          ),
        )),
        Expanded(
          child: ListView.builder(
              itemCount: placePredictions.length,
              itemBuilder: (context, index) => LocationListTile(
                  press: () {},
                  location: placePredictions[index].description!)),
        ),
      ],
    ));
  }
}
