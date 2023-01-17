import 'package:flutter/material.dart';
import 'package:kids/Pages/Components/text_form_field.dart';
import 'package:intl/intl.dart';

class OnlineAdmission extends StatefulWidget {
  const OnlineAdmission({super.key});

  @override
  State<OnlineAdmission> createState() => _OnlineAdmissionState();
}

class _OnlineAdmissionState extends State<OnlineAdmission> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController mobileC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController dobC = TextEditingController();
  TextEditingController genderC = TextEditingController();
  TextEditingController guardianC = TextEditingController();

  //focusnode is used to move to next textfield
  //when user press enter
  //and also to move to previous textfield
  FocusNode nameF = FocusNode();
  FocusNode emailF = FocusNode();
  FocusNode mobileF = FocusNode();
  FocusNode addressF = FocusNode();
  FocusNode dobF = FocusNode();
  FocusNode genderF = FocusNode();
  FocusNode guardianF = FocusNode();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameC = TextEditingController();
    emailC = TextEditingController();
    mobileC = TextEditingController();
    addressC = TextEditingController();
    dobC = TextEditingController();
    genderC = TextEditingController();
    guardianC = TextEditingController();
  }

  @override
  void dispose() {
    nameC.dispose();
    emailC.dispose();
    mobileC.dispose();
    addressC.dispose();
    dobC.dispose();
    genderC.dispose();
    guardianC.dispose();
    super.dispose();
  }

  void submit(Map data) async {
    if (formKey.currentState!.validate()) {
      print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 255, 205),
      resizeToAvoidBottomInset:
          false, // it will not resize when keyboard appear
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 20,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20,
                  offset: Offset(0, 5),
                ),
              ],
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Column(
                children: <Widget>[
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      children: [
                        const Text("Online Admission",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 16, 255, 171),
                              fontWeight: FontWeight.bold,
                            )),
                        TextEnterArea(
                          controller: nameC,
                          textInputAction: TextInputAction.next,
                          focusNode: nameF,
                          hintText: 'Enter Name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please Enter Name";
                            }
                            return null;
                          },
                        ),
                        TextEnterArea(
                          controller: emailC,
                          textInputAction: TextInputAction.next,
                          focusNode: emailF,
                          hintText: 'Enter Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Please Enter Email";
                            } else if (!p0.contains('@')) {
                              return "Please Enter Valid Email";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextEnterArea(
                          controller: guardianC,
                          focusNode: guardianF,
                          textInputAction: TextInputAction.next,
                          hintText: 'Enter Guardian Name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Please Enter Guardian Name";
                            }
                            return null;
                          },
                        ),
                        TextEnterArea(
                          controller: mobileC,
                          focusNode: mobileF,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          hintText: 'Enter Mobile Number',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Please Enter Mobile Number";
                            } else if (p0.length != 10) {
                              return "Please Enter Valid Mobile Number";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextEnterArea(
                          controller: addressC,
                          focusNode: addressF,
                          textInputAction: TextInputAction.next,
                          onChanged: (p0) {},
                          hintText: 'Enter Address',
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Please Enter Address";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(87, 134, 134, 134),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              readOnly: true,
                              controller: dobC,
                              focusNode: dobF,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'Date of Birth',
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Choose Date';
                                }
                                return null;
                              },
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                  errorFormatText: 'Enter valid date',
                                );
                                if (picked != null) {
                                  setState(() {
                                    dobC.text =
                                        DateFormat('dd-MM-yyyy').format(picked);
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Map<String, dynamic> data = {
                              'name': nameC.text,
                              'email': emailC.text,
                              'guardian': guardianC.text,
                              'mobile': mobileC.text,
                              'address': addressC.text,
                              'dob': dobC.text,
                            };
                            submit(data);
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 0, 167, 109),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: const Text(
                            'Apply Now',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ),
          const Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'By continuing, you agree to our Terms of Service and Privacy Policy',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(145, 16, 255, 171),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
