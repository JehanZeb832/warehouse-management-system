<!-- Content Wrapper. Contains page content  -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark"><!-- Dashboard v2 --></h1>
          </div><!-- /.col -->
          <div class="col-sm-6 mt-5">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
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
                      <h3>Edit User</h3>
                    </div>
                     <div class="card-body">
                      <?php 
                        if (isset($_GET['edit_id'])) {
                           $edit_id = $_GET['edit_id'];
                           $user_data = $obj->find('user','id',$edit_id);
                           if ($user_data) {
                             ?>
                        <form id="edituserfForm">
                          <div class="form-group">
                            <label for="name">User Name *:</label>
                            <input type="text" class="form-control" id="username" placeholder="User name" name="username" value="<?=$user_data->username;?>">
                            <input type="text" hidden name="user_id" value="<?=$user_data->id;?>">
                          </div>
                          <div class="form-group">
                                <label for="password">new password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="New password">
                              </div>
                              <div class="form-group">
                                <label for="c_password">Confirm password</label>
                                <input type="password" class="form-control" id="c_password" name="c_password" placeholder="Confirm password">
                              </div>
                          <div class="form-group">
                                <label for="user_role">User Role * :</label>
                                <select name="user_role" id="user_role" class="form-control select2">
                                  <?php
                                    $selected = 'selected';
                                  ?>
                                  <option <?php echo $selected;?> value="<?=$user_data->user_role;?>"><?=$user_data->user_role;?></option>
                                  <option value="admin">Admin</option>
                                  <option value="guest">Guest</option>
                                  <option value="allowRights">Allow Rights</option>
                                </select>
                          </div>
                          
                          <button type="submit" class="btn btn-primary btn-block rounded-0">update User</button>
                         </form>
                             <?php 
                           }
                        }
                       ?>
                        
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