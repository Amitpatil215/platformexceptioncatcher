import 'package:flutter/material.dart';
import 'package:platfromexceptioncatcher/platfromexceptioncatcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  PlatfromExceptionCatcher.init(
    () => runApp(const MyApp()),
    url: null,
    onErrorCallBack: ((error, stackTrace) {
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.white,
        textColor: Colors.black,

      );
    }),
    onHttpRequestFailedCallback: (error, stackTrace) {},
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _catcherrorPlugin = PlatfromExceptionCatcher();

  void triggerCustomException() async {
    final isStringSet = await _catcherrorPlugin.generateNullPointerException(null);
    debugPrint("is String set $isStringSet");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: child!,
        );
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Platform Exception Catcher',
          ),
        ),
        body: triggerButton(),
      ),
    );
  }

  Center triggerButton() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Trigger an Exception",
              style: TextStyle(color: Color(0xff2C3333), fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                triggerCustomException();
              },
              child: const Text("Generate Run time Exception"),
            )
          ],
        ),
      );
  }
}
