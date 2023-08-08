

//User validation

bool  usernameValidation(String name){
 if (name.isEmpty) {
   return false;
 }
 return false;
}

bool userpPassWordValidation(String pass1,String pass2){
  if (pass1.length!=pass2.length) {
    return true;
  }else{
    if (!pass1.startsWith(pass2)) {
      return true;
    }
  }
  return false;
}
 bool usermailvalidation(String email) {
    if (!email.contains('@') || !email.contains('.')) {
      return true;
    } else {
      final splitted = email.split('@');
      if (splitted[0].isEmpty) {
        return true;
      } else if (splitted[1].isEmpty) {
        return true;
      }
    }
    return false;
  }