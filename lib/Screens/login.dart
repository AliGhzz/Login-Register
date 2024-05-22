import 'package:flutter/material.dart';
import 'package:login_register/Screens/password_recovery.dart';
import 'package:login_register/Screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _usernameCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  var valid=true;

  List<String> userNameValidatonMsgPrefix = ['',''];
  List<Color> userNameValidatonMsgColor = [Color.fromARGB(255, 162, 162, 160),Color.fromARGB(255, 162, 162, 160)];
  List<String> userNameVAlidationMsg = ['At least 4 characters', 'It can includes letters, numbers, . and  _'];
  void validateUserName (String value){
    RegExp regex = RegExp(r'^[a-zA-Z0-9._]+$');
    setState(() {
      if(value.length>3 && regex.hasMatch(value)){
        userNameValidatonMsgColor = [Colors.green,Colors.green];
        userNameValidatonMsgPrefix = ['\u2713 ','\u2713 '];
      }else if(value.length<4 && !regex.hasMatch(value)){
        userNameValidatonMsgColor = [Color.fromARGB(255, 162, 162, 160),Color.fromARGB(255, 162, 162, 160)];
        userNameValidatonMsgPrefix = ['',''];

      }else if(value.length<4){
        userNameValidatonMsgColor = [Color.fromARGB(255, 162, 162, 160),Colors.green];
        userNameValidatonMsgPrefix = ['','\u2713 '];

      }else{
        userNameValidatonMsgColor = [Colors.green,Color.fromARGB(255, 162, 162, 160)];
        userNameValidatonMsgPrefix = ['\u2713 ',''];
      }
    });
  }


  List<String> passwordValidatonMsgPrefix = ['',''];
  List<Color> passwordValidatonMsgColor = [Color.fromARGB(255, 162, 162, 160),Color.fromARGB(255, 162, 162, 160)];
  List<String> passwordVAlidationMsg = ['At least 8 characters', 'Contains small & capital letters, numbers and !@#\$&*~'];
  void validatePassword ( String value){
    RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    setState(() {
      if(value.length>7 && regex.hasMatch(value)){
        passwordValidatonMsgColor = [Colors.green,Colors.green];
        passwordValidatonMsgPrefix = ['\u2713 ','\u2713 '];
      }else if(value.length<8 && !regex.hasMatch(value)){
        passwordValidatonMsgColor = [Color.fromARGB(255, 162, 162, 160),Color.fromARGB(255, 162, 162, 160)];
        passwordValidatonMsgPrefix = ['',''];

      }else if(value.length<8){
        passwordValidatonMsgColor = [Color.fromARGB(255, 162, 162, 160),Colors.green];
        passwordValidatonMsgPrefix = ['','\u2713 '];

      }else{
        passwordValidatonMsgColor = [Colors.green,Color.fromARGB(255, 162, 162, 160)];
        passwordValidatonMsgPrefix = ['\u2713 ',''];
      }
    });
  }

  IconData _showPassIcon = Icons.visibility_off;
  bool _showPass = false;
  void changePasswordVisibility(){
    setState(() {
      _showPass = !_showPass;
      if (_showPassIcon==Icons.visibility_off){
        _showPassIcon=Icons.visibility;
      }
      else{
        _showPassIcon=Icons.visibility_off;
      }
    });
  }

  void submit(){
    setState(() {
      if (userNameValidatonMsgColor[0]!=Colors.green){
        userNameValidatonMsgPrefix[0] = "\u2715 ";
        userNameValidatonMsgColor[0] = Colors.red;
      }
      if (userNameValidatonMsgColor[1]!=Colors.green){
        userNameValidatonMsgPrefix[1] = "\u2715 ";
        userNameValidatonMsgColor[1] = Colors.red;
      }
      if (passwordValidatonMsgColor[0]!=Colors.green){
        passwordValidatonMsgPrefix[0] = "\u2715 ";
        passwordValidatonMsgColor[0] = Colors.red;
      }
      if (passwordValidatonMsgColor[1]!=Colors.green){
        passwordValidatonMsgPrefix[1] = "\u2715 ";
        passwordValidatonMsgColor[1] = Colors.red;
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        Navigator.pop(context);
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center ,
      
              colors: [
                Color(0xFF1b2735),
                Color(0xFF12141d), 
              ],
            ),
          ),
          child: Center(
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.all(20),
                width: 500, 
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width*0.9,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF2B2E38),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text("Login",style: TextStyle(color: Color(0xFFffeba7),fontSize: 30),),
                    SizedBox(height:20,),
                    TextField(
                      cursorColor:Color.fromARGB(255, 253, 253, 247) ,
                      keyboardType: TextInputType.name,
                      style: TextStyle(color:Color.fromARGB(255, 253, 253, 247) ),
                      controller: _usernameCtrl,
                      decoration: InputDecoration(
                        contentPadding:EdgeInsets.fromLTRB(10, 0, 10, 0) ,
                        prefixIcon: Icon(Icons.account_circle_outlined,color: Color(0xFFffeba7),),
                        labelText: "username",
                        labelStyle: TextStyle(color: Color.fromARGB(255, 162, 162, 160),fontSize: 15),
                        filled: true,
                        fillColor: Color(0xff1f2029),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 208, 196, 20), width: 1),
                        ),
                        
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 5,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color.fromARGB(255, 208, 196, 20),width:1)
                        ),
                        disabledBorder: InputBorder.none,
                        focusColor: Colors.red,
                        helperMaxLines: 2,
                        counterText: ""
                      ),
                      onChanged: (value) {
                        validateUserName(value);
                      },
                      maxLength: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,5,5,0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: userNameValidatonMsgPrefix[0]+userNameVAlidationMsg[0]+'\n',
                                style: TextStyle(
                                  color: userNameValidatonMsgColor[0],
                                  fontSize: 10
                                ),
                              ),
                              TextSpan(
                                text: userNameValidatonMsgPrefix[1]+userNameVAlidationMsg[1],
                                style: TextStyle(
                                  color: userNameValidatonMsgColor[1],
                                  fontSize: 10
                                ),
                              ),
                            ],
                          ),),
                          Text("${_usernameCtrl.text.length}/20",style: TextStyle(
                            color: Color.fromARGB(255, 162, 162, 160),
                            fontSize: 10
                          ),),
                        ],
                      ),
                    ),
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    SizedBox(height: 15,),
                    TextField(
                      cursorColor:Color.fromARGB(255, 253, 253, 247) ,
                      keyboardType: TextInputType.name,
                      style: TextStyle(color:Color.fromARGB(255, 253, 253, 247) ),
                      controller: _passwordCtrl,
                      decoration: InputDecoration(
                        contentPadding:EdgeInsets.fromLTRB(10, 0, 10, 0) ,
                        prefixIcon: Icon(Icons.lock,color: Color(0xFFffeba7),),
                        suffixIcon: IconButton(
                          onPressed: () {
                            changePasswordVisibility();
                          }, 
                          icon: Icon(_showPassIcon,color: Color(0xFFffeba7)),
                        ),
                        labelText: "password",
                        labelStyle: TextStyle(color: Color.fromARGB(255, 162, 162, 160),fontSize: 15),
                        filled: true,
                        fillColor: Color(0xff1f2029),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 208, 196, 20), width: 1),
                        ),
                        
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 5,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color.fromARGB(255, 208, 196, 20),width:1)
                        ),
                        disabledBorder: InputBorder.none,
                        focusColor: Colors.red,
                        counterText: "",
                    
                      ),
                      obscureText: _showPass,
                      maxLength: 30,
                      
                      
                      onChanged: (value) {
                        validatePassword(value);
                      },
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,5,5,0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                        children: [
                          Text.rich(
                            TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: passwordValidatonMsgPrefix[0]+passwordVAlidationMsg[0]+'\n',
                                style: TextStyle(
                                  color: passwordValidatonMsgColor[0],
                                  fontSize: 10
                                ),
                              ),
                              TextSpan(
                                text: passwordValidatonMsgPrefix[1]+passwordVAlidationMsg[1],
                                style: TextStyle(
                                  color: passwordValidatonMsgColor[1],
                                  fontSize: 10
                                ),
                              ),
                            ],
                          ),),
                          
                          Text(
                            "${_passwordCtrl.text.length}/30",style: TextStyle(
                            color: Color.fromARGB(255, 162, 162, 160),
                            fontSize: 10
                          ),),
                        ],
                      ),
                    ),
                    
                    
                    
                    
                    Container(
                      padding: EdgeInsets.fromLTRB(0,5,0,0),
                      height: 25,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => PasswordRecovery()),
                            (Route<dynamic> route) => route.isFirst,
                          );
                          }, 
                        child: Text("forgot password?",style: TextStyle(color: Color(0xFFffeba7),fontSize: 13)),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(0,0,0,0)
                        )
                        ),
                    ),
      
                    SizedBox(height:10,),
                    ElevatedButton(
                      onPressed: (){
                        submit();
                      }, child: Text("Submit",style: TextStyle(color: Colors.black,fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Color(0xFFffeba7)
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Divider(endIndent: 5,)),
                          Text("OR" , style: TextStyle(color: Colors.white),),
                          Expanded(child: Divider(indent: 5,)),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: (){print("Login with Google");},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/google.webp",height: 30,),
                              Text(" Login with Google",style: TextStyle(color: Color(0xFFffeba7),fontSize: 16),)
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black54,
                            padding: EdgeInsets.fromLTRB(8,10,8,10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                          )
                        ),
                      )
                    ),
                      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                            style: TextStyle(color: Color(0xffb3b3b3))
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                            (Route<dynamic> route) => route.isFirst,
                          );
                          }, 
                          child: Text("Sign up now",
                            style: TextStyle(color: Color(0xff30c1c6)),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(5)
                          ),
                        )
                      ],
                    ),
                    
                  ],
                ),
              ),
            )
          ),
        )
      ),
    );
  }
}