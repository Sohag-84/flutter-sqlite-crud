import 'package:flutter/material.dart';
import 'package:flutter_sqlite/models/contact.dart';


const darkBlue = Color(0xFF486579);
const appName = "SQLite crud app";

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();

  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();
  final Contact _contact = Contact(1,"sohag","123445");
  final TextEditingController _nameController =  TextEditingController();
  final TextEditingController _numberController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(appName),
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              _form(),
              _list()
            ],
          ),
        ),
      ),
    );
  }

  _form(){
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (val)=>setState(()=>_contact.mobile= val! ),//for get user value
              //controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Enter your full name"
              ),
            ),
            TextFormField(
              onSaved: (val)=>setState(()=>_contact.mobile= val! ),
              //controller: _numberController,
              decoration: const InputDecoration(
                  hintText: "Enter your mobile number"
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  return _onAddButton();
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: Text("Add".toUpperCase()),
              )
            )
          ],
        ),
      ),
    );
  }
  _list(){
    return Container(

    );
  }
  _onAddButton() {
    var form = _formKey.currentState;
    form!.save();
    print("skdfsd = ${_contact.mobile}");/
  }
}


