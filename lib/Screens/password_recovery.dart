import 'package:flutter/material.dart';
import 'package:login_register/Screens/login.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  TextEditingController _emailCtrl = TextEditingController();
  String emailValidatonMsgPrefix = '';
  Color emailValidatonMsgColor = Color.fromARGB(255, 162, 162, 160);
  String emailVAlidationMsg = 'Email format';
  void validateEmail (String value){
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    setState(() {
      if(regex.hasMatch(value)){
        emailValidatonMsgColor = Colors.green;
        emailValidatonMsgPrefix = '\u2713 ';
      }else{
        emailValidatonMsgColor = Color.fromARGB(255, 162, 162, 160);
        emailValidatonMsgPrefix = '';
      }
    });
  }

  void submit(){
    setState(() {
      if (emailValidatonMsgColor !=Colors.green){
        emailValidatonMsgColor = Colors.red;
        emailValidatonMsgPrefix = "\u2715 ";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Login()),
          (Route<dynamic> route) => false,
        );
      },
      child: Scaffold(
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
                    Text("Password Recovery",style: TextStyle(color: Color(0xFFffeba7),fontSize: 30),),
                    SizedBox(height:30,),
                    
      
      
      
                    TextField(
                      cursorColor:Color.fromARGB(255, 253, 253, 247) ,
                      keyboardType: TextInputType.name,
                      style: TextStyle(color:Color.fromARGB(255, 253, 253, 247) ),
                      controller: _emailCtrl,
                      decoration: InputDecoration(
                        contentPadding:EdgeInsets.fromLTRB(10, 0, 10, 0) ,
                        prefixIcon: Icon(Icons.mail,color: Color(0xFFffeba7),),
                        labelText: "email", 
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
                        validateEmail(value);
                      },
                      maxLength: 30,
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
                                text: emailValidatonMsgPrefix+emailVAlidationMsg,
                                style: TextStyle(
                                  color: emailValidatonMsgColor,
                                  fontSize: 10
                                ),
                              ),
                            ],
                          ),),
                          Text("${_emailCtrl.text.length}/30",style: TextStyle(
                            color: Color.fromARGB(255, 162, 162, 160),
                            fontSize: 10
                          ),),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      height: 20,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                            (Route<dynamic> route) => false,
                          );
                        }, 
                        child: Text("         return",style: TextStyle(color: Color(0xFFffeba7),fontSize: 13),),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(0,0,0,0)
                        )
                      ),
                    ),
      
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: (){
                        submit();
                      }, child: Text("Submit",style: TextStyle(color: Colors.black,fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Color(0xFFffeba7),
                      ),
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