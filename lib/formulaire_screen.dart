import 'package:flutter/material.dart';

class FormulaireScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormulaireScreenState();
}
class FormulaireScreenState extends State<FormulaireScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isObscure = true;
  Color _eyeColor;
  List<bool> checkedList=[false,false,false,false];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Formulaire'),
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                SizedBox(height: 10.0),
                buildEmailTextField(),
                SizedBox(height: 30.0),
                buildPasswordTextField(context),
                SizedBox(height: 30.0),
                buildCheckbox(context),
                SizedBox(height: 60.0),
                buildLoginButton(context),
                SizedBox(height: 20.0),
                buildAnnulerButton(context),
                SizedBox(height: 30.0),

              ],
            )));
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            'Login',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color: Colors.black,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              //TODO
              print('email:$_email , assword:$_password');
            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }
  Align buildAnnulerButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            'Annuler',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color: Colors.black,
          onPressed: () {
            //TODO
            //NOT WORKING
            this._email= null;
            this._password=null;
            //print('email:$_email , assword:$_password');
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter your password';
        }
      },
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              })),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Emall Address',
      ),
      validator: (String value) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(value)) {
          return 'Please enter the correct email address';
        }
      },
      onSaved: (String value) => _email = value,
    );
  }
  Widget buildCheckbox(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text('GENRE',style: TextStyle(fontSize: 20.0,color: Color.fromARGB(255, 150, 150, 150),),),
        new CheckboxListTile(
            controlAffinity:ListTileControlAffinity.leading,
            title:new Text('Action'),
            value: checkedList[0],
            onChanged: (bool)=>updateCheckboxStatus(0,bool)
        ),
        new CheckboxListTile(
            controlAffinity:ListTileControlAffinity.leading,
            title:new Text('Aventure'),
            value: checkedList[1],
            onChanged: (bool)=>updateCheckboxStatus(1,bool)
        ),
        new CheckboxListTile(
            controlAffinity:ListTileControlAffinity.leading,
            title:new Text('Horreur'),
            value: checkedList[2],
            onChanged: (bool)=>updateCheckboxStatus(2,bool)
        ),

      ],
    );
  }
  void updateCheckboxStatus(int position,bool isCheck){
    setState(() {
      checkedList[position]=isCheck;
    });
  }
}
  Padding buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 40.0,
          height: 2.0,
        ),
      ),
    );
  }

 /* Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }*/

