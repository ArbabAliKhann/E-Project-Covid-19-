<?php include 'header.php'; ?>
<?php include '../includes/patient_authorized.php'; ?>
<?php include '../includes/connection.php'; ?>


<script type="text/javascript">
function fetch_select(val)
{
 $.ajax({
 type: 'post',
 url: 'fetchVaccPricedata.php',
 data: {
  get_option:val
 },
 success: function (response) {
  document.getElementById("new_select").value=response; 
 }
 });
}

</script>
<main class="page-content">



<div class="container"> <br>
        <h3 class="mt-5">Add Appointment</h3> <br>

        <form action="appointment.php" method="post" enctype="multipart/form-data" name = "formid">

            <div class="row">

                <div class="col-sm-12 col-lg-12" style="margin-top:50px;">

                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Patient Name:</label>
                        <input type="text" class="form-control input1" id="name" placeholder="Enter Your Name"
                            name="name" value = "<?= $_SESSION['db_Name'] ?>">
                    </div>
                    <?php $Date = date('Y-m-d'); ?>
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Date/Time:</label>
                        <input type="text" class="form-control input1" id="name"
                            name="dates" value = "<?= $Date ?>" readonly>
                    </div>
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Address:</label>
                        <input type="text" class="form-control input1" id="name" placeholder="Enter Your Address"
                            name="address">
                    </div>

                    <div class="form-group wrap-input1">
                        <label for="name">Select Hospital:</label>
                        <select class="form-control wrap-input1" id="cat" name="hospital">
                        <option value="" disabled selected>--Select--</option>
                            <!-- Get dropdown data code -->
                            <?php
                            $query = 'select * from hospitaldetail';
                            $rs = mysqli_query($con, $query);
                            if (mysqli_num_rows($rs) > 0) {
                                while ($data = mysqli_fetch_array($rs)) { ?>
                            <option value="<?= $data['Hosid'] ?>"><?= $data[
    'Name'
] ?></option>
                            <?php }
                            } else {
                                 ?>
                            <option>NO records Found</option>
                            <?php
                            }
                            ?>

                        </select>
                    </div>

                    <div class="form-group wrap-input1">
                        <label for="name">Select Vaccines:</label>
                        <select id="myDropDown" class="form-control wrap-input1" name="Vacc" class = "vacc"
                        onchange="fetch_select(this.value);">
                        <option value=""  disabled selected>--Select--</option>
                            <!-- Get dropdown data code -->
                            <?php
                            $query = 'select * from vaccination';
                            $res = mysqli_query($con, $query);
                            if (mysqli_num_rows($res) > 0) {
                                while ($data = mysqli_fetch_array($res)) { ?>
                            <option value="<?= $data['Vacid'] ?>"><?= $data[
    'NameVac'
] ?></option>
                            <?php }
                            } else {
                                 ?>
                            <option>NO records Found</option>
                            <?php
                            }
                            ?>

                        </select>
                    </div>
                            
                   <!-- <label id="new_select"></label> -->
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Fees:</label>
                        <input type="text" class="form-control input1" id="new_select"
                             name="Fees"  readonly>
                    </div>

                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Contact:</label>
                        <input type="text" class="form-control input1" id="name"
                            placeholder="Enter Your Contact" name="contact">
                    </div>

                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">CNIC:</label>
                        <input type="text" class="form-control input1" id="name"
                            placeholder="Enter Your Product CNIC" name="cnic">
                    </div>
                    <button type="submit" class="btn btn-success" name="ins" style="background-color: #2caee2; border: none;">Submit</button>
                </div>
            </div>


        </form>
    </div>

</div>
<!-- Content End -->

</main>


<?php if (isset($_POST['ins'])) {
    $PatName = $_POST['name'];
    $Dates = $_POST['dates'];
    $Addres = $_POST['address'];
    $Hosid = $_POST['hospital'];
    $Fee = $_POST['Fees'];
    $Vaccid = $_POST['Vacc'];
    $Contact = $_POST['contact'];
    $cnic = $_POST['cnic'];
    $query = "insert into appointment(Hosid,Patid,Date,Fee,Vacid,cnic,contact) values ('$Hosid','$PatName','$Dates','$Fee','$Vaccid','$cnic','$Contact')";
    $res = mysqli_query($con, $query);
    if ($res) {
        echo "<script>alert('Data Inserted Successfully');window.location.href = 'viewAppointment.php';</script>";
    } else {
        echo "<script>alert('Data Insertion Failed')</script>";
    }
} ?>
