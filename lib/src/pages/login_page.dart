import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsumitabe_frontend/src/clients/authenticate_api_client.dart';
import 'package:tsumitabe_frontend/src/common/cache.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    const debugImageSrc = "https://picsum.photos/1280/960";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tsumitabe App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.black, Colors.black12],
              ).createShader(bounds);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(debugImageSrc),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white60.withOpacity(0.2),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 6, left: 12, right: 12),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        hintText: 'hogehoge@qmail.com',
                        labelText: 'Email Address',
                      ),
                      onChanged: (String value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 6, left: 12, right: 12),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      final client = AuthenticateAPIClient();
                      final future = client.login(email, password);
                      future.then((authentication) async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString("token", authentication.token);
                        CacheClass().token = authentication.token;
                        return client.me(authentication.token);
                      }).then((user) async {
                        if (user == null) throw NullThrownError();
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setInt("user", user.id);
                        CacheClass().user = user;
                        Navigator.of(context).pushNamed("/dashboard");
                      });
                      future.catchError((error) {
                        print("Error: ${error}");
                      }, test: (error) {
                        return error is int && error >= 400;
                      });
                    },
                    child: const Text('Login'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
