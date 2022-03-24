<!DOCTYPE html>
<html>
<head>
      <link rel="icon"  href="#" type="img/logo1.jpg">

	<meta charset="utf-8">
	<title>form pendaftaran</title>
        <?php  include 'boostrap.php'; ?>

      <link rel="stylesheet" type="text/css" href="styledaftar.css">

</head>
<body style="background:url(img/img_3.jpg); background-size: cover;" >
        

	  <div class="container bg-transparant">
        
        <h1 class="alert alert-primary text-center">REGISTRATION!</h1>

 
    <form action="simpan.php" method="post">
         <div class="form-group" class="mb-3">
             <label style="width:100%;">
                 Full Name
                 <input type="text" name="nama" class="form-control" required="required" placeholder="Enter your full name">
             </label>
         </div>   
          <div class="form-group">
             <label style="width:100%;">
                Email Address
                 <input type="Email" name="mail" class="form-control" required="required" placeholder="@gmail.com">
             </label>
         </div> 
           <div class="form-group">
             <label style="width:100%;">
                 Phone
                 <input type="number" name="notelp" required="required" class="form-control" placeholder="Enter your phone">
             </label>
         </div> 

          <div class="row">
              <div class="col-md">
               <div class="form-group">
                 <label style="width:100%;">
                Username
                    <input type="text" name="username" class="form-control" required="required" placeholder="add username">
             </label>
         </div> 

              </div>

              <div class="col-md-6">
                  
                   <div class="form-group">
             <label style="width:100%;">
                Password
                 <input type="password" name="password"required="required" class="form-control" placeholder="add password">
             </label>
         </div> 
              </div>
          </div>
           
          
            <br>
                        <br>

         <button type="submit" class="btn btn-primary">SIGN UP</button>
        <button type="reset" class=" btn btn-info">RESET</button>
    </form>
</div>

    
    			
</form>

</body>
</html>