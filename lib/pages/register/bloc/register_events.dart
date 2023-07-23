abstract class RegisterEvents {
  const RegisterEvents();
}

class UserNameEvent extends RegisterEvents{
  final String usename;
  const UserNameEvent(this.usename);
}

class EmailEvent extends RegisterEvents{
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvents{
  final String password;
  const PasswordEvent(this.password);
}

class RePasswordEvent extends RegisterEvents{
  final String rePassword;
  const RePasswordEvent(this.rePassword);
}