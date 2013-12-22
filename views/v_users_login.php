<!-- This is the login page content -->

<form method='POST' action='/users/p_login'>

    Email:<br>
    <input type='text' name='email'>

    <br><br>

    Password:<br>
    <input type='password' name='password'>

    <br>
    <!-- error checking for blank fields and wrong userid/password -->
	<?php if(isset($error)): ?>
        <div class='error'>
            <h5>Operation failed! Please double check your email and password. </h5>
        </div>
        <br>
    <?php endif; ?>


    <input type='submit' value='Login'>

</form>
