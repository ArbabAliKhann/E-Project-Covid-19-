<?php include 'header.php'; ?>
   
<main class="page-content">

<div class="container"> <br>
        <h3 class="mt-5">Covid Report</h3> <br>

        <form action="Vac_Crud.php" method="post" enctype="multipart/form-data">

            <div class="row">


                <div class="col-sm-12 col-lg-12" style="margin-top:50px;">

                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Patient Name:</label>
                        <input type="text" class="form-control input1" id="name" placeholder="Enter Your Name"
                            name="name">
                    </div>
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Hospital Name:</label>
                        <input type="text" class="form-control input1" id="name" placeholder="Enter Hospital Name"
                            name="hName">
                    </div>
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Vaccine Name:</label>
                        <input type="text" class="form-control input1" id="name" placeholder="Enter Hospital Name"
                            name="hName">
                    </div>
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Status:</label>
                        <input type="text" class="form-control input1" id="name" placeholder="Enter Status"
                            name="status">
                    </div>
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Date:</label>
                        <input type="text" class="form-control input1" id="name"
                            placeholder="Enter Date" name="date">
                    </div>
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Contact:</label>
                        <input type="text" class="form-control input1" id="name"
                            placeholder="Enter Contact" name="contact">
                    </div>
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">CNIC:</label>
                        <input type="text" class="form-control input1" id="name"
                            placeholder="Enter CNIC" name="cnic">
                    </div>
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Address:</label>
                        <input type="text" class="form-control input1" id="name"
                            placeholder="Enter Address" name="address">
                    </div>
                    <button type="submit" class="btn btn-success" name="ins" style="background-color: #2caee2; border: none;">Send</button>

                </div>
            </div>


        </form>
    </div>

</div>
<!-- Content End -->

</main>