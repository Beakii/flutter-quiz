import 'package:flutter/material.dart';
import 'dart:async';
import './pages/landing_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() {
  runApp(MaterialApp(
    home: LandingPage()
  ));
}
