import 'package:flutter/material.dart';
import 'package:form/LoginFormPojo.dart';
import 'login_form.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-stone Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _name_text_controller = TextEditingController();
  final TextEditingController _email_text_controller = TextEditingController();
  String _selectedGender = 'male';
  ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20));
  bool english = false;
  bool hindi = false;
  bool marathi = false;
  String selectedLanguage = '';
  String selectvaliddata = '';
  String dropdownvalue = 'Select Country';
  var items = [
    'Select Country',
    'India',
    'UK',
    'Germany',
    'Japan',
    'America',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Tutorial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    " Full Name",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),

                  TextFormField(
                    controller: _name_text_controller,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your name'),


                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    " Email",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  TextFormField(
                    controller: _email_text_controller,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your email'),

                  ),

                ],
              ),
              const SizedBox(height: 25.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 1.0,
                    child: const Text(
                      "Country",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              Column
                (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Language",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CheckboxListTile(
                    value: english,
                    onChanged: (val) {
                      setState(() {
                        english = val!;
                        english ? setLanguageValue(english) : null;
                      });
                    },
                    activeColor: Colors.blue,
                    title: const Text('English'),
                  ),
                  CheckboxListTile(
                    value: hindi,
                    onChanged: (val) {
                      setState(() {
                        hindi = val!;
                        hindi ? setLanguageValue(hindi) : null;
                      });
                    },
                    activeColor: Colors.blue,
                    title: const Text('Hindi'),
                  ),
                  CheckboxListTile(
                    value: marathi,
                    onChanged: (val) {
                      setState(() {
                        marathi = val!;
                        marathi ? setLanguageValue(marathi) : null;
                      });
                    },
                    activeColor: Colors.blue,
                    title: const Text('Marathi'),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gender',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  ListTile(
                    leading: Radio<String>(
                      value: 'male',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    title: const Text('Male'),
                  ),
                  ListTile(
                    leading: Radio<String>(
                      value: 'female',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    title: const Text('Female'),
                  ),
                  const SizedBox(height: 25),
                  const SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: ElevatedButton(
                    style: style,
                    child: const Text('Submit'),
                    onPressed: () {

                      setValidatation();

                      if (_name_text_controller.text.isNotEmpty &&
                          RegExp(r'^[a-z A-Z]+$').hasMatch(
                              _name_text_controller.text) &&
                          _email_text_controller.text.isNotEmpty &&
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(
                              _email_text_controller.text) &&
                          selectedLanguage.isNotEmpty) {
                        LoginFormPojo formPojo = LoginFormPojo(
                            name: _name_text_controller.text,
                            email: _email_text_controller.text,
                            country: dropdownvalue,
                            gender: _selectedGender,
                            language: selectedLanguage);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LoginForm(formPojo),
                          ),
                        );
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(selectvaliddata)));
                      }
                    },
                  )),
            ],
          ),
        ),
      ),

    );
  }

  void setLanguageValue(bool) {
    selectedLanguage = '';
    if (english == true) {
      selectedLanguage = selectedLanguage + ' English ';
    }
    if (hindi == true) {
      selectedLanguage = selectedLanguage + ' Hindi ';
    }
    if (marathi == true) {
      selectedLanguage = selectedLanguage + ' Marathi ';
    }
  }

  void setValidatation() {
    selectvaliddata = '';
    if(_name_text_controller.text.isEmpty && RegExp(r'^[a-z A-Z]+$').hasMatch(_name_text_controller.text)==false) {
      selectvaliddata = selectvaliddata + 'Enter valid name\n';
    }
    if(_email_text_controller.text.isEmpty && RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(_email_text_controller.text)==false) {
      selectvaliddata = selectvaliddata + 'Enter valid email\n';
    }
    if(english==false && hindi==false && marathi==false){
      selectvaliddata = selectvaliddata + 'Select Language';
    }
  }
}