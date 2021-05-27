<!DOCTYPE html>
<html lang="en">

<head>
<title>Cities</title>
<!-- Bootstrap core CSS-->
<?php echo link_tag('assests/vendor/bootstrap/css/bootstrap.min.css'); ?>
<!-- Custom fonts for this template-->
<?php echo link_tag('assests/vendor/fontawesome-free/css/all.min.css'); ?>
<!-- Page level plugin CSS-->
<?php echo link_tag('assests/vendor/datatables/dataTables.bootstrap4.css'); ?>
<!-- Custom styles for this template-->
<?php echo link_tag('assests/css/sb-admin.css'); ?>

  </head>

  <body id="page-top">

   <?php include APPPATH.'views/user/includes/header.php';?>

    <div id="wrapper">

      <!-- Sidebar -->
  <?php include APPPATH.'views/user/includes/sidebar.php';?>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="<?php echo site_url('user/Dashboard'); ?>">User</a>
            </li>
            <li class="breadcrumb-item active">Cities</li>
          </ol>

          <!-- Page Content -->
          <h1>Cities</h1>
          <hr>


<div class="row">

    <div class="col-lg-12 margin-tb">

        <div class="pull-left">
        </div>

        <div class="pull-right">

            <a class="btn btn-success" href="<?php echo base_url('user/City/create') ?>"> Create New City</a>

        </div>

    </div>

</div>



<table class="table table-bordered">



  <thead>

      <tr>

          <th>Country_id</th>

          <th>State_id</th>

          <th>Name</th>

          <th>Status</th>

          <th width="220px">Action</th>

      </tr>

  </thead>



  <tbody>

   <?php foreach ($data as $item) { ?>      

      <tr>

          <td><?php echo $item->country_id; ?></td>

          <td><?php echo $item->state_id; ?></td>

          <td><?php echo $item->name; ?></td>

          <td><?php echo $item->status; ?></td>          

      <td>

        <form method="DELETE" action="<?php echo base_url('user/City/delete/'.$item->id);?>">

          <a class="btn btn-info" href="<?php echo base_url('user/City/show/'.$item->id) ?>"> show</a>

         <a class="btn btn-primary" href="<?php echo base_url('user/City/edit/'.$item->id) ?>"> Edit</a>

          <button type="submit" class="btn btn-danger"> Delete</button>

        </form>

      </td>     

      </tr>

      <?php } ?>

  </tbody>



</table>
</div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
     <?php include APPPATH.'views/user/includes/footer.php';?>

      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>


    <!-- Bootstrap core JavaScript-->
    <script src="<?php echo base_url('assests/vendor/jquery/jquery.min.js'); ?>"></script>
    <script src="<?php echo base_url('assests/vendor/bootstrap/js/bootstrap.bundle.min.js'); ?>"></script>
    <!-- Core plugin JavaScript-->
    <script src="<?php echo base_url('assests/vendor/jquery-easing/jquery.easing.min.js'); ?>"></script>
    <!-- Custom scripts for all pages-->
    <script src="<?php echo base_url('assests/js/sb-admin.min.js '); ?>"></script>

  </body>

</html>

