import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:pdfmaker/pdfBuilder/createPdf.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Future createPdfHighestQuality() async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 150,
        enableCamera: true,
      );

      String filePath = await buildPdf(data: resultList, quality: 100);
      print(filePath);
      showSnackBarSucceed();
    } catch (e) {
      showSnackBarFail();
      print(e);
    }
  }

  Future createPdfHighQuality() async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 150,
        enableCamera: true,
      );

      String filePath = await buildPdf(data: resultList, quality: 90);
      print(filePath);
      showSnackBarSucceed();
    } catch (e) {
      showSnackBarFail();
      print(e);
    }
  }

  Future createPdfMediumQuality() async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 150,
        enableCamera: true,
      );

      String filePath = await buildPdf(data: resultList, quality: 70);
      showSnackBarSucceed();
    } catch (e) {
      showSnackBarFail();
      print(e);
    }
  }

  Future createPdfLowQuality() async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 150,
        enableCamera: true,
      );

      String filePath = await buildPdf(data: resultList, quality: 50);
      print(filePath);
      showSnackBarSucceed();
    } catch (e) {
      showSnackBarFail();
      print(e);
    }
  }

  Future createPdfLowestQuality() async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 150,
        enableCamera: true,
      );

      String filePath = await buildPdf(data: resultList, quality: 30);
      print(filePath);
      showSnackBarSucceed();
    } catch (e) {
      showSnackBarFail();
      print(e);
    }
  }

  showSnackBarSucceed() {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Created & Saved"),
      duration: Duration(seconds: 1, milliseconds: 300),
    ));
  }

  showSnackBarFail() {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Not Selected Image"),
      duration: Duration(milliseconds: 800),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Minimalist PDF Maker"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(10),
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
          shrinkWrap: true,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                createPdfHighestQuality();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Highest Quality"),
              ),
            ),
            RaisedButton(
              onPressed: () {
                createPdfHighQuality();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("High Quality"),
              ),
            ),
            RaisedButton(
              onPressed: () {
                createPdfMediumQuality();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Medium Quality"),
              ),
            ),
            RaisedButton(
              onPressed: () {
                createPdfLowQuality();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Low Quality"),
              ),
            ),
            RaisedButton(
              onPressed: () {
                createPdfLowestQuality();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Lowest Quality"),
              ),
            ),
            // RaisedButton(
            //   onPressed: () {
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text("From Camera"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
