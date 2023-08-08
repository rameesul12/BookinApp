
  bool mailvalidation(String email) {
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

  bool nameValidation(String name){
    if (name.isEmpty) {
      return true;
    }else{
      if (name.length<3) {
        return true;
      }
    }
    return false;
  }

  bool passwordChecking(String pass1,String pass2){
    
    if (pass1.length != pass2.length) {
      return true;
    }else{
      if (!pass1.startsWith(pass2)) {
        return true;
      }
    }
    return false;
  }

  bool phoneValidation(String number){
    if (number.length<10) {
      return true;
    }
    return false;
  }
  bool adharValidation(String adharNumber){
    if (adharNumber.length<14) {
      return true;
    }
    return false;
  }

  bool licenceNumberValidation(String number){
    if (number.length<10 ) {
      return true;
    }
    return false;
  }
  bool locationValidation(String image){
    if (image.isEmpty) {
      return true;
    }
    
    return false;
  }

  bool otpScreenValidation(String numbers){
    if (numbers.length<6) {
      return true;
    
    }
    return false;
  }

  bool screenAdding(String screen){
    if (screen.isEmpty) {
      return true;

    }else{
      return false;
    }
  }