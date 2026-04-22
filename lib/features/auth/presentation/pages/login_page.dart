import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoginSelected = true;

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0B0B0B), Color(0xFF282828)],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'WASTE',
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 76,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [const Color(0xFFFFFFFF), const Color(0xFFEEEEEE).withValues(alpha: 0.8)],
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 32,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildToggleSwitch(),
                        const SizedBox(height: 30),

                        _buildTextField(
                          hintText: 'Usuario',
                          controller: _userController,
                          obscureText: false,
                        ),
                        const SizedBox(height: 30),

                        _buildTextField(
                          hintText: 'Contraseña',
                          controller: _passwordController,
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),

                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black87,
                            overlayColor: Colors.transparent,
                          ),
                          onPressed: () {
                            // TODO Navegar a recuperación
                          },
                          child: const Text(
                            '¿Olvidaste tu Usuario/Contraseña?',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Container(
                          width: 230,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF0B0B0B),
                                Color(0xFF62676D),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                              ),
                            ),
                            onPressed: () {
                              print("Iniciando sesión con Firebase...");
                            },
                            child: Text(
                              isLoginSelected ? 'Ingresar' : 'Registrar',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
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

  // --- WIDGETS REUTILIZABLES ---

  Widget _buildToggleSwitch() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B0B),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isLoginSelected = true),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: isLoginSelected
                      ? const LinearGradient(
                          colors: [Color(0xFFF6C90E), Color(0xFFFFD57E)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )
                      : const LinearGradient(
                          colors: [Color(0xFFD9D9D9), Color(0xFF999898)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Ingresar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 6),

          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isLoginSelected = false),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: isLoginSelected
                      ? const LinearGradient(
                          colors: [Color(0xFFD9D9D9), Color(0xFF999898)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )
                      : const LinearGradient(
                          colors: [Color(0xFFF6C90E), Color(0xFFFFD57E)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Registrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    required bool obscureText,
  }) {
    return Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
