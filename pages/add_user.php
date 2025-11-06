<!-- Content Wrapper. Contains page content  -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark"><!-- Dashboard v2 --></h1>
          </div><!-- /.col -->
          <div class="col-sm-6 mt-4">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Add User</li>
            </ol>
            </div><!-- /.col -->
            </div><!-- /.row -->
            </div><!-- /.container-fluid -->
          </div>
          <!-- /.content-header -->
          <!-- Main content -->
          <section class="content">
            <div class="container-fluid">
              <!-- /.card-header -->
               <div class="row">
                 <div class="col-md-8 offset-md-2 col-lg-8 offset-lg-2 mt-3">
                   <div class="card">
                    <div class="card-header">
                      <h3>Add a new user</h3>
                    </div>
                     <div class="card-body">
                         <form id="adduserForm">
                          <div class="form-group">
                            <label for="username">User Name *:</label>
                            <input type="text" class="form-control" id="username" placeholder="username" name="username">
                          </div>
                          <div class="form-group">
                            <label for="password">Password *:</label>
                            <input type="password" class="form-control" id="password" placeholder="password" name="password">
                          </div>
                          <div class="form-group">
                                <label for="user_role">User Role * :</label>
                                <select name="user_role" id="user_role" class="form-control select2">
                                  <option disabled selected>Select User Role</option>
                                  <option value="admin">Admin</option>
                                  <option value="allowRights">Allow User</option>                                </select>
                             </div>
                          <button type="submit" class="btn btn-primary btn-block rounded-0">Add User</button>
                         </form>
                    </div>
                  </div>
                 </div>
               </div>
            </div>
            <!-- /.card-body -->
            <!-- /.row -->
            </div><!--/. container-fluid -->
          </section>
          <!-- /.content -->
        </div>
        <!-- /.content-wrapper