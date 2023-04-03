class PostApiUrl{
  static const url = 'https://api.allout.ae/api/v1/';
  static const loginUrl = "${PostApiUrl.url}auth/signIn";
  static const signupUrl = '${PostApiUrl.url}auth';
  static const forgetPasswordUrl = '${PostApiUrl.url}auth/forgotPassword';
}

class GetApiUrl{
static const url = 'https://api.allout.ae/api/v1/';
static const interest = "${GetApiUrl.url}interests";
static const home = "${GetApiUrl.url}home";
}