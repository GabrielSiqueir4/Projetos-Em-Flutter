import 'package:atividade01/COMPONENTS/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  bool enviadoEmail = false; // foi enviado email de confirmação ?

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recuperar a senha",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: !enviadoEmail,
                  child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe o email corretamente';
                          }
                          return null;
                        },
                      )),
                ),
                Visibility(
                  visible: !enviadoEmail,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<AuthService>()
                            .resetPassword(email.text, context);

                        setState(() {
                          enviadoEmail = true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(Icons.check),
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: const Text(
                              "Enviar email",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: enviadoEmail,
                    child: Text(
                      "Foi enviado um email de redefinição de senha para " +
                          this.email.text,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
