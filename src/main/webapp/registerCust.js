/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// Main function to validating password
let validatePWD = () => {
  // Using the same logic as the submit function, we'll check the password
  console.log("Trying to validate password")
  if (validatePWDlength() && validatePWDnumber() && validatePWDcharacter()) {
    $("#validPassword").show();
    return true;
  } else {
    return false;
  }
};
// validate if the length meets the minimum requiremnet
let validatePWDlength = () => {
  let pass1 = document.getElementById('password').value;
  if (pass1.length < 8) {
    document.getElementById("password").setCustomValidity("Passwords is not long enough!");
    console.log("Length failed");
    $("#invalidPasswordLength").show();
    $("#validPassword").hide();
    return false;
  } else {
    console.log("Length Success");
    $("#invalidPasswordLength").hide();
    return true;
  }
};

// Validate if there is a number in the password
let validatePWDnumber = () => {
  let pass1 = document.getElementById('password').value;
  // then lets check for a number
  console.log("Password is " + pass1);
  let n = pass1.search(/0|1|2|3|4|5|6|7|8|9/);
  console.log("Number search gets " + n);
  if (n < 0){
    console.log("It got " + pass1.search(/0|1|2|3|4|5|6|7|8|9/));
    document.getElementById("password").setCustomValidity("Passwords does not have a number!");
    console.log("Number failed");
    $("#invalidPasswordNumber").show();
    $("#validPassword").hide();
    return false;
  } else {
    console.log("Number Success");
    $("#invalidPasswordNumber").hide();
    return true;
  }
};

// Validate if theere is a special character in the password
let validatePWDcharacter = () => {
  let pass1 = document.getElementById('password').value;
  //Check for special character
  let m = pass1.search(/!|#|%|&|@/);
  console.log("Special character search get " + m);
  if (m < 0){
    document.getElementById("password").setCustomValidity("Passwords needs a special character!");
    console.log("Special Character failed");
    $("#invalidPasswordCharacter").show();
    $("#validPassword").hide();
    return false;
  } else {
    document.getElementById("password").setCustomValidity("");
    console.log("Special Character Success");
    $("#invalidPasswordCharacter").hide();
    return true;
  }
};


// Validate That the two passwords match
let validatePWD2 = () => {
  let pass1 = document.getElementById('password').value;
  let pass2 = document.getElementById('password2').value;
  if (pass1 !== pass2)
  {
    document.getElementById('password2').setCustomValidity("Passwords do not match!");
    console.log("Matching Passwords failed");
    $("#invalidPassword2").show();
    $("#validPassword2").hide();
    return false;
  } else {
    document.getElementById('password2').setCustomValidity("");
    console.log("Matching Passwords Success");
    $("#invalidPassword2").hide();
    $("#validPassword2").show();
    return true;
  }
};

// Validates if the email is an actual email by looking for a @ symbol
let validateEmail = () => {
  var email = document.register.email.value;
  var position = email.search("@");
  console.log('This is the email position: ' + position);
  if (position > -1) {
    document.getElementById("email").setCustomValidity("");
    console.log("Email Account Success");
    $("#invalidEmail").hide();
    $("#validEmail").show();
    return true;
  } else {
    document.getElementById("email").setCustomValidity("Not a valid email account!");
    console.log("Email account failed");
    $("#invalidEmail").show();
    $("#validEmail").hide();
    return false;
  }
};

// Validates if both the emails match
let validateEmail2 = () => {
  var email = document.register.email.value;
  var email2 = document.register.email2.value;
  if (email !== email2)
  {
    document.getElementById("email2").setCustomValidity("Emails do not match!");
    console.log("Emails matching failed");
    $("#invalidEmail2").show();
    $("#validEmail2").hide();
    return false;
  } else {
    document.getElementById("email2").setCustomValidity("");
    console.log("Emails Matching Success");
    $("#invalidEmail2").hide();
    $("#validEmail2").show();
    return true;
  }
};

// FUnction validates if there is a name inputted
let validateName = () => {
  var name = document.register.businessName;
  if (name.value === ""){
    $("#invalidName").show();
    $("#validName").hide();
    console.log("Name not filled out");
    return false;
  } else {
    $("#validName").show();
    $("#invalidName").hide();
    return true;
  }
  
};

// Validate the length of the username
let validateUsernameLength = () => {
  var user = document.register.username;
  if (user.value.length >= 6){
    console.log(user.value.length + ' is the username length');
    console.log("Username Passes length check");
    $("#invalidUsernameLength").hide();
    return true;
  } else {
    console.log("Username does not pass length check");
    console.log(user.value.length + ' is the username length');
    $("#invalidUsernameLength").show();
    $("#validUsername").hide();
    return false;
  }
  
};

// Validate if the username has to be a number
let validateUsernameNumber = () => {
  var user = $("#username").val();
  let n = user.search(/0|1|2|3|4|5|6|7|8|9/);
  console.log("Username Number search gets " + n);
  if (n < 0){
    console.log("Username Number failed");
    $("#invalidUsernameNumber").show();
    $("#validUsername").hide();
    return false;
  } else {
    console.log("Username Number Success");
    $("#invalidUsernameNumber").hide();
    return true;
  } 
};

// Final Step to Validate a username
let validateUsername = () => {
  if (validateUsernameLength() && validateUsernameNumber()){
    console.log("This is a valid username");
    $("#invalidUsernameLength").hide();
    $("#invalidUsernameNumber").hide();
    $("#validUsername").show();
    console.log("Return true")
    return true;
  } else {
    console.log("Not a valid username");
    $("#validUsername").hide();
    return false;
  }
};


// Final validate function used in form
let validate = () => {
  if (validateName() && validateEmail() && validateEmail2() && validateUsername() && validatePWD() && validatePWD2()) {
    console.log("Register Success");
    document.register.submit();
  } else {
    console.log("Register Failed");
  }
};
