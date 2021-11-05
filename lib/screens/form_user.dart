import 'package:flutter/material.dart';

class FormUser extends StatefulWidget {
  FormUser({Key? key}) : super(key: key);

  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cadastrar Cliente',
          style: TextStyle(
              color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomTextField(
                    label: 'Nome',
                    icon: Icons.account_circle,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Campo obrigatório'
                        : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    label: 'telefone',
                    icon: Icons.phone,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    label: 'CPF',
                    icon: Icons.assignment_late,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    label: 'E-mail',
                    icon: Icons.mail,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    label: 'Genero',
                    icon: Icons.all_inclusive,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    label: 'Código',
                    icon: Icons.vpn_key,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 100,
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        }
                      },
                      child: Text(
                        'Salvar',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;

  const CustomTextField({
    Key? key,
    required this.label,
    this.icon,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
      onSaved: (text) {},
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black, fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        prefixIcon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
