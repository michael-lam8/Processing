class Password {
  String user = "";
  String password = "";

  Password(String tempUser, String tempPassword) {
    user = tempUser;
    saveEncryptedPassword(encryptPassword(tempPassword));
  }

  String encryptPassword (String password) {
    String encryptedPassword = "";
    for (int i = 0; i < password.length(); i++) {
      encryptedPassword += char(password.charAt(i)+6); // Caesar cipher, right shift 6
    }
    return encryptedPassword;
  }

  void saveEncryptedPassword (String password) {
    PrintWriter writePassword;
    writePassword = createWriter("/data/" + user + "Password.txt");
    writePassword.println(password);
    writePassword.flush();
    writePassword.close();
  }

  boolean comparePassword (String password) {
    String[] passwordArray = loadStrings("/data/" + user + "Password.txt");
    return passwordArray[0].equals(encryptPassword(password));
  }
}