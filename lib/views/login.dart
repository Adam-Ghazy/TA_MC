import 'package:flutter/material.dart';
import 'package:masbro_canteen/provider/auth_provider.dart';
import 'package:masbro_canteen/service/auth_future.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var showPassword = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xF8F8F8F8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                // style: GoogleFonts.poppins(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 32),
              ),
              Text(
                'Sign in to your account',
                // style: GoogleFonts.poppins(
                //     color: Colors.black45,
                //     fontWeight: FontWeight.normal,
                //     fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Email',
                // style: GoogleFonts.poppins(
                //     fontWeight: FontWeight.normal,
                //     fontSize: 16),
              ),
              const SizedBox(height: 3),
              TextFormField(
                cursorColor: Colors.redAccent,
                controller: email,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap isi email terlebih dahulu';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Password',
                // style: GoogleFonts.poppins(
                //     fontWeight: FontWeight.normal,
                //     fontSize: 16),
              ),
              const SizedBox(height: 3),
              TextFormField(
                obscureText: showPassword,
                controller: password,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  suffixIcon: showPassword
                      ? IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          onPressed: () => setState(() {
                            showPassword = !showPassword;
                          }),
                        )
                      : IconButton(
                          icon: const Icon(Icons.remove_red_eye_outlined),
                          onPressed: () => setState(() {
                            showPassword = !showPassword;
                          }),
                        ),
                  hintText: 'Your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap isi password terlebih dahulu';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  if (email.text.isEmpty || password.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Harap isi data terlebih dahulu")),
                    );
                  } else {
                    authProvider.login(email.text, password.text);
                  }
                },
                child: Center(
                  child: Container(
                    height: 47,
                    width: 213,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.redAccent),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        // style: GoogleFonts.poppins(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () async {
                    var url = 'whatsapp://send?phone=6285706015892';
                    const text =
                        "Halo Masbro, saya izin meminta akses untuk login ke aplikasi Masbro Canteen";
                    url = '$url&text=$text';

                    // try {
                    //   await launchUrlString(url);
                    // } catch (e) {
                    //   debugPrint(e.toString());
                    // }
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.pink,
                      alignment: Alignment.center),
                  child: Text(
                    'Minta Akses',
                    // style: GoogleFonts.poppins(
                    //     color: Colors.redAccent,
                    //     fontWeight: FontWeight.normal,
                    //     fontSize: 15),
                  ),
                ),
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Tahan tombol")),
          );
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.info_outline, color: Colors.redAccent),
        tooltip:
            'Aplikasi Masbro hanya bisa digunakan oleh beberapa orang yang sudah terdaftar, jika anda ingin mencobanya, klik "Minta Akses"',
      ),
    );
  }
}
