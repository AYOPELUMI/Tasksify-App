import 'package:flutter/material.dart';
import 'package:task_app/AnimatedToggleSwitch.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {


  final _formKey = GlobalKey<FormState>();
  final isLoading = false;
    final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool _obscurePassword = true;

  void _submit(){
    final isValid = _formKey.currentState?.validate();

    if(isValid!){
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 50.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                                  const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const SizedBox(height: 100),
              TextFormField(
                keyboardType: TextInputType.name,
                 controller: _controllerName,
                decoration : InputDecoration( 
                  labelText: "Name",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator:(String? value){
                  if( value == null || value.isEmpty){
                    return "Phone Number should be more than 10";
                  }
                  return null;
                },
                 onEditingComplete: () => _focusNodeEmail.requestFocus(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _controllerEmail,
                focusNode: _focusNodeEmail,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value){
                  if(value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                    return " enter a valid email";
                  }
                  return null;
                },
                onEditingComplete: () => _focusNodePassword.requestFocus(),
              ),
                            const SizedBox(height: 20),
              TextFormField(
                controller: _controllerPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodePassword,
                  keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator:(value){
                  if(value!.isEmpty || value.length <6){
                    return "Password must be at least 6 characters";
                  }
                  return null;
                }
              ),
              Row(
                children:[
                  Text(
                    "Accept Terms and Condition"
                  ),
                  AnimatedToggleSwitch()
                ]
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: (){_submit();},
                 style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(Size(350, 20)),
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                    foregroundColor: WidgetStateProperty.all<Color>(Colors.red),
                    elevation: WidgetStateProperty.all<double>(70),
                    alignment: Alignment.center,
                    padding: WidgetStateProperty.all<EdgeInsets>( EdgeInsets.all(15))
                  ),
                  child: Text("Register",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
              ),
              const SizedBox(height: 25),
                const Center(child: Text("Or register with")),
              const SizedBox(height: 25),
              Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.purple,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:   AssetImage('assets/google.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Text("Google",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 20),

               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Do you already have an account?"),
                    TextButton(
                        onPressed: () {
                        },
                        child: const Text("Login", style: TextStyle(color: Colors.purple),)
                    )
            ],),
        ],
        ),
      ),
      )
    );
  }
}