abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangeVisibilityState extends LoginStates {}

class ResetPasswordLoadingPassword extends LoginStates {}

class ResetPasswordSuccessPassword extends LoginStates {}

class SignInWithGoogleLoadingState extends LoginStates {}

class SignInWithGoogleSuccessState extends LoginStates {}

class SignInWithGoogleErrorState extends LoginStates {}

class SignInWithGmailAndPasswordSuccessState extends LoginStates {}

class SignInWithEmailAndPasswordLoadingState extends LoginStates {}

class SignInWithEmailAndPasswordSuccessState extends LoginStates {}

class SignInWithEmailAndPasswordErrorState extends LoginStates {}

class SignOutSuccessState extends LoginStates {}
