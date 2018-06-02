// Michael Lam
// May 24, 2018
// This class contains all functions relating to user passwords, including encryption, saving the encrypted password to a file, and password verification when logging in.

// Last updated June 2, 2018
// - Added additional documentation
// - Updated documentation

class Password {
  // Declaring variables
  String user = "";
  String password = "";

  // Empty constructor to allow calling functions
  Password() {
  }

  // Constructor that creates user accounts with variable passwords
  Password (String tempUser, String tempPassword) {
    user = tempUser;
    saveEncryptedPassword(encryptPassword(tempPassword));
  }

  // Encrypts set password using the Caesar cipher (right shift of 6)
  String encryptPassword (String password) {
    String encryptedPassword = "";
    for (int i = 0; i < password.length(); i++) {
      encryptedPassword += char(password.charAt(i)+6);
    }
    return encryptedPassword;
  }

  // Saves the encrypted password to a .txt file
  void saveEncryptedPassword (String password) {
    PrintWriter writePassword;
    writePassword = createWriter("/data/" + user + " Password.txt");
    writePassword.println(password);
    writePassword.flush();
    writePassword.close();
  }

  // Compares encrypted password from .txt file with the user's encrypted input
  boolean comparePassword (String password) {
    String[] passwordArray = loadStrings("/data/" + user + " Password.txt");
    return passwordArray[0].equals(encryptPassword(password));
  }

  // Logs user in if user input corresponds with the correct user and password
  void checkPassword() {
    if (loginScreen == 1) {
      if (userLogin[0].comparePassword(passwordInput)) {
        userLoggedIn = 1;
        menuActive = 1;
      } else {
        incorrectAttempt = true;
      }
    } else if (loginScreen == 2) {
      if (userLogin[1].comparePassword(passwordInput)) {
        userLoggedIn = 2;
        menuActive = 1;
      } else {
        incorrectAttempt = true;
      }
    } else if (loginScreen == 3) {
      if (userLogin[2].comparePassword(passwordInput)) {
        userLoggedIn = 3;
        menuActive = 1;
      } else {
        incorrectAttempt = true;
      }
    }
    passwordInput = "";
    asterisks = "";
    fieldHint = "Password";
  }

  // Resets password variables each time user inputs a password or cancels login operation
  void resetPasswordField() {
    passwordInput = "";
    asterisks = "";
    fieldHint = "Password";
    incorrectAttempt = false;
  }
}