import 'package:economizafy/screens/authentication/widgets/authentication_actions.dart';
import 'package:economizafy/screens/authentication/widgets/confirm_password_input_form.dart';
import 'package:economizafy/screens/authentication/widgets/email_input_form.dart';
import 'package:economizafy/screens/authentication/widgets/name_input_form.dart';
import 'package:economizafy/screens/authentication/widgets/other_method_login_user.dart';
import 'package:economizafy/screens/authentication/widgets/password_input_form.dart';
import 'package:economizafy/services/authentication_service.dart';
import 'package:economizafy/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// TODO: realizar testes
// TODO: resolver problemas do _formKey

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  //---------------------------------------------------------
  // Services & Controllers
  //---------------------------------------------------------
  final AuthenticationService _authenticationService = AuthenticationService();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _resetPasswordController =
      TextEditingController();

  //---------------------------------------------------------
  // State Variables
  //---------------------------------------------------------
  bool isLoading = false;
  bool showLoginPage = true;
  bool forgotPassword = false;
  bool _isSendingResetEmail = false;

  //---------------------------------------------------------
  // Lifecycle Methods
  //---------------------------------------------------------
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _resetPasswordController.dispose();
    super.dispose();
  }

  //---------------------------------------------------------
  // Authentication Methods
  //---------------------------------------------------------
  Future<void> loginUser() async {
    // if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
    //   return;
    // }
    setState(() => isLoading = true);

    try {
      await _authenticationService.loginUser(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } catch (e) {
      _showErrorSnackbar(e.toString());
    } finally {
      _resetLoadingState();
    }
  }

  Future<void> registerUser() async {
    // if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
    //   return;
    // }
    setState(() => isLoading = true);

    try {
      await _authenticationService.registerUser(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      _showSuccessSnackbar("Cadastro realizado com sucesso!");
    } catch (e) {
      _showErrorSnackbar(e.toString());
    } finally {
      _resetLoadingState();
    }
  }

  Future<void> _sendPasswordResetEmail() async {
    if (_resetPasswordController.text.isEmpty) {
      _showErrorSnackbar("Digite um e-mail válido");
      return;
    }

    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSendingResetEmail = true);

    try {
      await _authenticationService.sendPasswordResetEmail(
        _resetPasswordController.text.trim(),
      );
      _showSuccessSnackbar(
        "E-mail de redefinição enviado para ${_resetPasswordController.text}",
      );
      _toggleForgotPassword();
    } catch (e) {
      _showErrorSnackbar(e.toString());
    } finally {
      if (mounted) setState(() => _isSendingResetEmail = false);
    }
  }

  //---------------------------------------------------------
  // Helper Methods
  //---------------------------------------------------------
  void _toggleForgotPassword() {
    setState(() {
      forgotPassword = !forgotPassword;
      _resetPasswordController.clear();
    });
  }

  List<String> textsOfButtons() {
    if (showLoginPage) return ["Entrar", "Ir para Cadastro"];
    if (forgotPassword) return ["Solicitar Troca de Senha", "Cancelar"];
    return ["Cadastrar", "Ir para Login"];
  }

  void _resetLoadingState() {
    if (mounted) setState(() => isLoading = false);
  }

  void _showErrorSnackbar(String message) {
    if (mounted) {
      showAwesomeSnackbar(
        context: context,
        title: "Erro",
        message: message,
        isError: true,
      );
    }
  }

  void _showSuccessSnackbar(String message) {
    if (mounted) {
      showAwesomeSnackbar(
        context: context,
        title: "Sucesso!",
        message: message,
      );
    }
  }

  //---------------------------------------------------------
  // UI Components
  //---------------------------------------------------------
  Widget _buildLogo() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 150,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/icon.png", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAuthContent() {
    return [
      _buildLogo(),
      NameInputForm(showLoginPage: showLoginPage, controller: _nameController),
      EmailInputForm(controller: _emailController),
      PasswordInputForm(
        controller: _passwordController,
        showLoginPage: showLoginPage,
        onForgotPasswordPressed: _toggleForgotPassword,
      ),
      ConfirmPasswordInputForm(
        showLoginPage: showLoginPage,
        controller: _confirmPasswordController,
      ),
      AuthenticationActions(
        showLoginPage: showLoginPage,
        loginUser: loginUser,
        registerUser: registerUser,
        isLoading: isLoading,
        textsOfButtons: textsOfButtons,
        onToggleAuthMode: () => setState(() => showLoginPage = !showLoginPage),
      ),
      OtherMethodLoginUser(showLoginPage: showLoginPage),
    ];
  }

  List<Widget> _buildResetPasswordContent() {
    return [
      const SizedBox(height: 40),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: _resetPasswordController,
          validator: (value) {
            if (value == null || value.isEmpty) return 'Digite seu e-mail';
            if (!value.contains('@')) return 'E-mail inválido';
            return null;
          },
          decoration: InputDecoration(
            labelText: 'E-mail cadastrado',
            prefixIcon: Icon(Icons.email),
          ),
        ),
      ),
      const SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: _isSendingResetEmail ? null : _sendPasswordResetEmail,
          child:
              _isSendingResetEmail
                  ? const CircularProgressIndicator()
                  : const Text('Enviar Link de Redefinição'),
        ),
      ),
      TextButton(
        onPressed: _toggleForgotPassword,
        child: const Text('Voltar para Login'),
      ),
    ];
  }

  //---------------------------------------------------------
  // Main Build Method
  //---------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    List<Widget> contentPage =
        forgotPassword ? _buildResetPasswordContent() : _buildAuthContent();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          forgotPassword
              ? "Redefinir Senha"
              : showLoginPage
              ? "Login"
              : "Cadastro",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FormBuilder(
          key: _formKey,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: contentPage.length,
            itemBuilder: (context, index) => contentPage[index],
            separatorBuilder: (_, __) => SizedBox(height: 25),
          ),
        ),
      ),
    );
  }
}
