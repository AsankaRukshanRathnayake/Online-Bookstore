<?php
   include 'connection.php';

   if(isset($_POST['submit'])){

      $name = mysqli_real_escape_string($connection, $_POST['name']);
      $email = mysqli_real_escape_string($connection, $_POST['email']);
      $pass = mysqli_real_escape_string($connection, md5($_POST['password']));
      $cpass = mysqli_real_escape_string($connection, md5($_POST['cpassword']));
      $user_type = 'user';

      $select_users = mysqli_query($connection, "SELECT * FROM `users` WHERE email = '$email' AND password = '$pass'") or die('query failed');

      if(mysqli_num_rows($select_users) > 0){
         $message[] = 'user already exist!';
      }else{
         if($pass != $cpass){
            $message[] = 'confirm password not matched!';
         }else{
            mysqli_query($connection, "INSERT INTO `users`(name, email, password, user_type) VALUES('$name', '$email', '$cpass', '$user_type')") or die('query failed');
            $message[] = 'registered successfully!';
            header('location:login.php');
         }
      }

   }

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>register</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link type="text/css" rel="stylesheet" href="css/styles.css">
   <link type="text/css" rel="stylesheet" href="css/header.css">
   <link type="text/css" rel="stylesheet" href="css/footer.css">
   <link rel="stylesheet" type="text/css" href="css/register.css">

</head>
<body>

   <?php include 'header.php'; ?>

   <?php
if(isset($message)){
   foreach($message as $message){
      echo '
      <div class="message">
         <span>'.$message.'</span>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
      ';
   }
}
?>
   
   <div class="register_form_container">

      <form action="" method="post">
         <h3>Register</h3>
         
         <input type="text" name="name" placeholder="enter your name" required class="registerfield">
         <input type="email" name="email" placeholder="enter your email" required class="registerfield">
         <input type="password" name="password" placeholder="enter your password" required class="registerfield">
         <input type="password" name="cpassword" placeholder="confirm your password" required class="registerfield">

         <input type="submit" name="submit" value="Register Now" class="registerbutton">
         
         <p>
            Already have an account?<br> 
            <a href="login.php">Click here to Login</a></p>
      </form>

   </div>

   <?php include 'footer.php'; ?>

</body>
</html>