<?php include 'header.php'; ?>
   
<main class="page-content">

<div class="container"> <br>
        <h3 class="mt-5">Add Vaccines</h3> <br>

        <form action="Vac_Crud.php" method="post" enctype="multipart/form-data">

            <div class="row">


                <div class="col-sm-12 col-lg-6" style="margin-top:50px;">

                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Vaccine Name:</label>
                        <input type="text" class="form-control input1" id="name" placeholder="Enter Vaccine Name"
                            name="name">
                    </div>
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Hospital Name:</label>
                        <input type="text" class="form-control input1" id="name" placeholder="Enter Hospital Name Price"
                            name="cName" value="<?= $_SESSION['db_Name'] ?>" readonly>
                    </div>
                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Vaccine Price:</label>
                        <input type="text" class="form-control input1" id="name" placeholder="Enter Price"
                            name="price">
                    </div>

                    <div class="form-group wrap-input1">
                        <label for="name">Select Status:</label>
                        <select class="form-control wrap-input1" id="cat" name="vacStatus">
                        <option value="">--Select--</option>
                            <option value="Available">Available</option>
                            <option value="Unavailable">Unavailable</option>
                        </select>
                    </div>

          

                    <div class="form-group wrap-input1" style="margin: 20px 0;">
                        <label for="name">Vaccine Description:</label>
                        <input type="text" class="form-control input1" id="name"
                            placeholder="Enter Your Product Description" name="Proddesc">
                    </div>
                    <button type="submit" class="btn btn-success" name="ins" style="background-color: #2caee2; border: none;">Submit</button>

                </div>

                <div class="col-sm-12 col-lg-4 ">
                    <div class="d-flex flex-column align-items-center text-center  user-profile-image">

                        <input class="form-control hidden" type="file" id="Pro_Image" name="uploaded"
                            style="visibility: hidden;" />

                        <img class="mt-5" style="width:250px;" src="assets/images/No_Image_Available.jpg" id="UserImage">
                        <div class="upload-photo text-center ">
                            <br />
                            <button type="button" class="btn btn-success" style="background-color: #2caee2; border: none;"
                                onclick="document.getElementById('Pro_Image').click(); return false;">
                                <i class="fas fa-download"></i> Upload Image
                            </button>
                        </div>
                    </div>

                </div>
            </div>


        </form>
    </div>

</div>
<!-- Content End -->

</main>




<script>
$(document).ready(function() {


    //$("#upload-photos").click(function () {
    //    $("#BrowseImage").trigger('click')
    //})

    $("#UserImage").click(function() {
        $("#Pro_Image").trigger('click')
    })


    $("#Pro_Image").change(function() {
        if (this.files && this.files[0]) {
            var fileReader = new FileReader();
            fileReader.readAsDataURL(this.files[0]);
            fileReader.onload = function(x) {

                $("#UserImage").attr('src', x.target.result);
            }
        }
    })
})
</script>