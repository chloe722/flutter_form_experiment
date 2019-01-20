import 'package:flutter/material.dart';

void main() => runApp(ContactCollection());

class ContactCollection extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Fill the form'),
        backgroundColor: Colors.cyan,
      ),
      body: CreateBusinessCardForm(),
    ));
  }
}

class CreateBusinessCardForm extends StatefulWidget {
  @override
  BusinessCardFormState createState() {
    return BusinessCardFormState();
  }
}

class _Info {
  String name;
  String jobTitle;
  String phone;
  String email;
}

class BusinessCardFormState extends State<CreateBusinessCardForm> {
  final _formKey = GlobalKey<FormState>();
  _Info infoData = new _Info();

  void submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing data')));
      print('name: ${infoData.name}');
      print('email: ${infoData.email}');
      print('jobTitle: ${infoData.jobTitle}');
      print('phone: ${infoData.phone}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formKey,
        child: Container(
            margin: EdgeInsets.all(40.0),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You forgot to enter the name';
                    }
                  },
                  onSaved: (String value) {
                    infoData.name = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Job Title',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter job title';
                    }
                  },
                  onSaved: (String value) {
                    infoData.jobTitle = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'example@example.com',
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter email';
                    } else if (!value.contains('@')) {
                      return 'Invalide email format';
                    }
                  },
                  onSaved: (String value) {
                    infoData.email = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter phone number';
                    } else if (value.length < 10) {
                      return 'At least 10 digits';
                    }
                  },
                  onSaved: (String value) {
                    infoData.phone = value;
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    color: Colors.cyan[300],
                    textColor: Colors.white,
                    onPressed: this.submit,
                    child: Text('Submit'),
                  ),
                )
              ],
            )));
  }
}
