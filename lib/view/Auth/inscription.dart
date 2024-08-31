import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rtek/Service/Auth.dart';
import 'package:rtek/view/Pages/Accueil.dart';
import 'package:rtek/view/Pages/navbar.dart';

class inscription extends StatefulWidget {
  const inscription({super.key});

  @override
  State<inscription> createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {
  bool _secureText = true;
  //bool _ischecked = false;

  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String prenom = "prenomParDefaut";
  String email = "Email@gmail.com";

  void _signin() async {
    if (_formKey.currentState!.validate()) {
      var result = await AuthService.register(
        userNameController.text,
        prenom,
        email,
        confirmPasswordController.text,
        phoneNumberController.text,
      );
      if (result['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Bienvenue ' + userNameController.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        Navigator.push(
            context, PageRouteBuilder(pageBuilder: (_, __, ___) => navbar()));
      } else {
        print(result);
        var errors = result["errors"];
        errors.forEach((key, value) {
          for (var error in value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  error,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
            print(error);
          }
        });
      }

      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              //height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/profil_inscription.png",
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ],
                  ),
                  const Text(
                    "S'INSCRIRE",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: "Sahitya",
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(12.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset(
                                      "assets/icones/User.png"), // User icon
                                  hintText: 'Nom utilisateur',
                                  hintStyle: const TextStyle(
                                      color:
                                          Color(0xFFB0AFAF)), // Hint text style
                                  filled: true,
                                  fillColor:
                                      Colors.transparent, // Background color
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF748CDF),
                                        width: 1.5), // Border color and width
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF748CDF), width: 1.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF748CDF), width: 2.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer un nom utilisateur';
                                  }
                                  return null;
                                },
                                controller: userNameController,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(12.0),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter
                                      .digitsOnly, // N'autorise que les chiffres
                                ],
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset(
                                      "assets/icones/Phone.png"), // User icon
                                  hintText: 'Numéro de téléphone',
                                  hintStyle:
                                      const TextStyle(color: Color(0xFFB0AFAF)),

                                  filled: true,
                                  fillColor:
                                      Colors.transparent, // Background color
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF748CDF),
                                        width: 1.5), // Border color and width
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF748CDF), width: 1.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF748CDF), width: 2.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer votre mot de passe';
                                  }
                                  return null;
                                },
                                controller: phoneNumberController,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(12.0),
                              child: TextFormField(
                                obscureText: _secureText,
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset(
                                      "assets/icones/Lock.png"), // User icon
                                  hintText: 'Mot de passe',
                                  hintStyle:
                                      const TextStyle(color: Color(0xFFB0AFAF)),
                                  suffixIcon: IconButton(
                                    color: Color(0xFF748CDF),
                                    icon: Icon(_secureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _secureText = !_secureText;
                                      });
                                    },
                                  ), // Hint text style
                                  filled: true,
                                  fillColor:
                                      Colors.transparent, // Background color
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF748CDF),
                                        width: 1.5), // Border color and width
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF748CDF), width: 1.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF748CDF), width: 2.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer votre mot de passe';
                                  }
                                  return null;
                                },
                                controller: passwordController,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(12.0),
                              child: TextFormField(
                                obscureText: _secureText,
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset(
                                      "assets/icones/Lock.png"), // User icon
                                  hintText: 'Confirmer mot de passe',
                                  hintStyle:
                                      const TextStyle(color: Color(0xFFB0AFAF)),
                                  suffixIcon: IconButton(
                                    color: Color(0xFF748CDF),
                                    icon: Icon(_secureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _secureText = !_secureText;
                                      });
                                    },
                                  ), // Hint text style
                                  filled: true,
                                  fillColor:
                                      Colors.transparent, // Background color
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF748CDF),
                                        width: 1.5), // Border color and width
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF748CDF), width: 1.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF748CDF), width: 2.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer votre mot de passe';
                                  }
                                  return null;
                                },
                                controller: confirmPasswordController,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    minimumSize: Size(175, 40),
                                    backgroundColor: Color(0xFF748CDF),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: _signin,
                                child: Text(
                                  "S'inscrire",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "inter"),
                                )),
                            SizedBox(height: 40),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'ou',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(
                                          0xFF748CDF), // Adjust color as needed
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                      color: Color(0xFF748CDF),
                                      width: 2,
                                    ),
                                    minimumSize: Size(175, 40),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icones/google_13170545.png",
                                      width: 24,
                                      height: 24,
                                    ),
                                    Text(
                                      "Connectez vous avec google",
                                      style: TextStyle(
                                          fontSize: 13, fontFamily: "poppins"),
                                    ),
                                  ],
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                      color: Color(0xFF748CDF),
                                      width: 2,
                                    ),
                                    minimumSize: Size(175, 40),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icones/social_12942327.png",
                                      width: 24,
                                      height: 24,
                                    ),
                                    Text(
                                      "Connectez vous avec google",
                                      style: TextStyle(
                                          fontSize: 13, fontFamily: "poppins"),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
