// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
  bool isSwitched = false;
   bool isSwitchedValidated = true;
  String errorText = " ";

  void _submit(){
    final isValid = _formKey.currentState?.validate();

    if(isValid! && isSwitched == true){
      setState(()=>errorText = " ");
       _formKey.currentState?.save();
     Navigator.pushNamed(context, '/dashboard');
      return;
    }
    else{
      setState(()=>isSwitchedValidated = false);
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 50.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                                  const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const SizedBox(height: 50),
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
              SizedBox(height:20),
                SwitchListTile(
                    title:  Row( 
                      children:[
                        Text("Accept",
                        style: TextStyle(
                          fontSize:15,
                        fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                    Text("Terms & Conditions",
                      style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6C63FF),
                      )
                      )
                      ]),
                    value: isSwitched,
                    onChanged: (val) {
                      setState(()=>isSwitched = val);
                      if (isSwitched== true){
                        setState(()=> isSwitchedValidated = true);
                      }
                    },
                  ),
                  isSwitchedValidated? const Text("") : const Text("this field is required", style: TextStyle(
                    color: Colors.red,
                  ),),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: (){_submit();},
                 style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6C63FF),
                    minimumSize: const Size(350, 20),
                    foregroundColor: Colors.red,
                    elevation:10,
                    alignment: Alignment.center,
                    padding:  const EdgeInsets.all(15)
                  ),
                  child: const Text("Register",
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
                      color: Colors.white,
                    ),

                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.grey)
                        )
                      ),
                      backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                    ),
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
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
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