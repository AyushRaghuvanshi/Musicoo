import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicoo/MainViews/dashboard.dart';
import 'package:musicoo/desgins.dart';
import 'package:musicoo/providers.dart';

class RegisterView extends ConsumerWidget {
  bool passsame = false;

  RegisterView({super.key});
  String emails = "";
  String passwords = "";
  String firsts = "";
  String lasts = "";
  bool passok = true;

  bool emailok = true;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/Bg.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      child: Row(children: [
                        IconButton(
                            onPressed: (() {
                              context.go('/Auth');
                            }),
                            icon: Icon(Icons.arrow_back))
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 88.0),
                    child: Image.asset('assets/LOGO.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 32),
                    child: Text(
                      'Please enter your email address and\n password',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                                child: CTextField(
                                  onChanged: (v) {
                                    // submitSearch(ref);
                                    firsts = v ?? "";
                                  },
                                  validator: (value) {
                                    if (value?.isEmpty ?? false) {
                                      return 'Invalid First Name';
                                    }
                                    return null;
                                  },
                                  hinttext: 'First Name',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: SizedBox(
                                  width: 149,
                                  child: CTextField(
                                    onChanged: (v) {
                                      // submitSearch(ref);
                                      lasts = v ?? "";
                                    },
                                    validator: (value) {
                                      if (value?.isEmpty ?? false) {
                                        return 'Invalid Last Name';
                                      }
                                      return null;
                                    },
                                    hinttext: 'Last Name',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: CTextField(
                          onChanged: (v) {
                            // submitSearch(ref);
                            emails = v ?? "";
                          },
                          validator: (value) {
                            bool emailerror = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);

                            if (!emailerror) {
                              emailok = false;
                              return 'Invalid Email';
                            } else {
                              emailok = true;
                            }
                            return null;
                          },
                          hinttext: 'Email',
                          icon: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: CTextField(
                          onChanged: ((p0) {
                            passwords = p0 ?? "";
                          }),
                          validator: (value) {
                            bool passValid = RegExp(
                                    r"^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[0-9]){1,})(?=(.*[!@#$%^&*()\-__+.]){1,}).{8,}$")
                                .hasMatch(value!);
                            if (!passValid) {
                              passok = false;
                              return 'Password needs to be more than 8 characters, \ncontains at least 1 uppercase , 1 lowercase, 1 number and \n1 special character';
                            } else {
                              passok = true;
                              return null;
                            }
                          },
                          hinttext: 'Password',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: CTextField(
                          onChanged: ((p0) {}),
                          validator: (value) {
                            log(value ?? "" + passwords);
                            if (value != passwords) {
                              passsame = false;
                              return 'Passwords not Matching';
                            }
                            passsame = true;
                          },
                          hinttext: 'Confirm Password',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    // log(passok.toString());
                                    if (!emailok) {
                                      return;
                                    }
                                    if (!passok) {
                                      return;
                                    }
                                    if (!passsame) {
                                      return;
                                    }

                                    ref.watch(email.notifier).state =
                                        emails.trim().toLowerCase();
                                    ref.watch(password.notifier).state =
                                        passwords;
                                    ref.watch(first.notifier).state = firsts;
                                    ref.watch(last.notifier).state = lasts;
                                    ref.watch(loader.notifier).state =
                                        !ref.watch(loader.notifier).state;
                                    if (ref.refresh(login).value == 'Success') {
                                      context.go('/home');
                                    }
                                  },
                                  child: SizedBox(
                                    height: 48,
                                    width: 280,
                                    child: Center(
                                        child: Text(
                                      'Sign up',
                                      style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  )),
                            ],
                          )),
                      Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.go('/Auth/login');
                                },
                                child: Text(
                                  'Log in',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 2,
                                width: 96,
                                color: Colors.white,
                              ),
                            ),
                            Text('Or'),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 2,
                                width: 96,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 42),
                        child: TextButton(
                            onPressed: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              height: 48,
                              width: 345,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Image.network(
                                          'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png'),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Text(
                                        'Continue with Google',
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ]),
          ),
          // SizedBox(
          //   child: (!ref.watch(loader))
          //       ? null
          //       : Container(
          //           color: Color.fromARGB(199, 0, 0, 0),
          //           child: Center(child: CircularProgressIndicator()),
          //         ),
          // )
        ],
      ),
    ));
  }
}
