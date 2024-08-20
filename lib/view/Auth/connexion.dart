import 'package:flutter/material.dart';
import 'package:rtek/view/Pages/Accueil.dart';

class connexion extends StatefulWidget {
  const connexion({super.key});

  @override
  State<connexion> createState() => _connexionState();
}

class _connexionState extends State<connexion> {
  bool _secureText = true;
  bool _ischecked = false;

  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void _connect() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Bienvenue ' + userNameController.text,
              style: TextStyle(color: Colors.white),
            )),
      );
      FocusScope.of(context).requestFocus(FocusNode());

      Navigator.push(
          context, PageRouteBuilder(pageBuilder: (_, __, ___) => accueil()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Nom d\'utilisateur ou mot de passe incorrect',
              style: TextStyle(color: Colors.white),
            )),
      );
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
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 10,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/profil_connecter.png",
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ],
                ),
                const Text(
                  "Content de vous revoir !",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: "poppins",
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Connectez-vous",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: "poppins",
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
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
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Checkbox(
                                  activeColor: Colors.black,
                                  value: _ischecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _ischecked = value ?? false;
                                    });
                                  },
                                ),
                                const Text(
                                  "Se souvenir de moi",
                                  style: TextStyle(fontSize: 13),
                                )
                              ]),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Mot de passe oublié ?",
                                    style: TextStyle(
                                        color: Color(0xFF748CDF),
                                        fontFamily: "Sorts Mill Goudy",
                                        fontSize: 13),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  minimumSize: Size(175, 40),
                                  backgroundColor: Color(0xFF748CDF),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: _connect,
                              child: Text(
                                "Connexion",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "inter"),
                              )),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
