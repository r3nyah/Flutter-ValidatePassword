import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  bool Success = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          backgroundColor: Success?Colors.green[500] : Colors.red[500],
          centerTitle: true,
          title: Column(
            children: const[
              Text('Password Validate'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 12.5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                  Success?Icons.lock_open_sharp : Icons.lock_clock_sharp,
                  color: Success? Colors.green:Colors.red,
                  size: 100,
                ),
//                  Image.network(
//                   ),
//                Image.asset(
//                   Success?'assets/Xiao1.png':'assets/Xiao2.png',
//                   width: 100,
//                   height: 100,
//                 ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    Success?'https://pbs.twimg.com/media/Ewx3JtPXEAY2RoP?format=png&name=240x240':'https://pbs.twimg.com/media/Ewx2-DnWEAgDwRD?format=png&name=240x240',
                    height: 100,
                    width: 100,
                  ),
                ),
                ],
              ),
              SizedBox(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2
                      ),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(
                                255,207,207,207
                              ),
                              width: 2
                            ),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Success?Colors.green:Colors.red,
                              width: 2
                            ),
                          ),
                          hintText: 'Password',
                          border: const OutlineInputBorder(
                              borderSide: BorderSide()
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FlutterPwValidator(
                      controller: controller,
                      minLength: 10,
                      uppercaseCharCount: 1,
                      numericCharCount: 1,
                      specialCharCount: 1,
                      normalCharCount: 3,
                      width: 400,
                      height: 150,
                      onSuccess: (){
                        setState((){
                          Success = true;
                        });
                        print('OBISA!');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Password Accepted"))
                        );
                      },
                      onFail: (){
                        setState((){
                          Success=false;
                        });
                        print('Password Decline');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
