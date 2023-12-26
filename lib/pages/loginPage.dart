// ignore: file_names
import 'package:demoappblackcoffer/pages/otpVerifyPage.dart';
import 'package:flutter/material.dart';

class MobileAuthPage extends StatefulWidget {
  const MobileAuthPage({super.key});

  @override
  _MobileAuthPageState createState() => _MobileAuthPageState();
}

class _MobileAuthPageState extends State<MobileAuthPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/otp.jpg",
                height: 400,
                width: 400,
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            "assets/India.png",
                            width: 40,
                            height: 40,
                          ),

                          const SizedBox(width: 10),
                          const VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          const SizedBox(
                            width: 10,
                          ), // Add some spacing
                          const Text(
                            "भारत",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "+91",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: 'Phone Number',
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mobile number cannot be empty';
                                }
                                // You can add more validation logic here.
                                return null; // Return null for valid input.
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              _isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 130, 124, 243),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            )),
                        onPressed: _authenticateUser,
                        child: const Text(
                          'Authenticate',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _authenticateUser() {
    // Add your authentication logic here.
    // You may want to verify the phone number using OTP or other methods.
    // Set _isLoading to true during the authentication process.
    setState(() {
      _isLoading = true;
    });

    // Simulate authentication for 2 seconds.
    Future.delayed(const Duration(seconds: 2), () {
      // After authentication, set _isLoading to false and navigate to the next screen.
      setState(() {
        _isLoading = false;
      });

      // You can add navigation logic here to move to the next screen upon successful authentication.
      // For example, you can use Navigator.push.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVerificationPage(),
        ),
      );
    });
  }
}
