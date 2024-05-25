@extends('admin.layout')

@section('content')
  <div class="page-header">
    <h4 class="page-title">Roles</h4>
    <ul class="breadcrumbs">
      <li class="nav-home">
        <a href="{{route('admin.dashboard')}}">
          <i class="flaticon-home"></i>
        </a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="javascript:void(0)">{{$role->name}}</a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="javascript:void(0)">Permissions Management</a>
      </li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">

      <div class="card">
        <div class="card-header">
          <div class="card-title d-inline-block">Permissions Management</div>
          <a class="btn btn-info btn-sm float-right d-inline-block" href="{{route('admin.role.index')}}">
            <span class="btn-label">
              <i class="fas fa-backward" style="font-size: 12px;"></i>
            </span>
            Back
          </a>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-lg-10 offset-lg-2">
              {{--  onsubmit="return false;" --}}
			  <form id="permissionsForm" class="" action="{{route('admin.role.permissions.update')}}" method="post">
                {{csrf_field()}}
                <input type="hidden" name="role_id" value="{{Request::route('id')}}">

                @php
                  $permissions = $role->permissions;
                  if (!empty($role->permissions)) {
                    $permissions = json_decode($permissions, true);
                    // dd($permissions);
                  }
                @endphp
                  @if ($errors->has('permission'))
                  <span class="help-block">
                    <p class="text-danger">{{ $errors->first('permission') }}</p>
                  </span>
                  @endif                                    
                <div class="row">
                  <?php $i = 0; ?>
                  @foreach($permissionByGroupNames as $groupName)
                <div class="col-md-3 mg-t-14 mg-md-t-0 listing_check_group">
                  @php
                  $permissions = App\Models\Admin::getpermissionsByGroupName($groupName->group_name);
                  $j = 1;
                  @endphp
                  </br>
                  <label style="margin-top: 10px;"><b>{{ucfirst($groupName->group_name)}}</b></label> </br>  
                  @php
                  $permissions = App\Models\Admin::getpermissionsByGroupName($groupName->group_name);
                  @endphp
                  @foreach($permissions as $res)
                  <label>
                  {{ Form::checkbox('permission[]', $res->id, in_array($res->id, $rolePermissions) ? true : false, array('class' => 'permission_list_'.$i, 'style'=>'margin-right: 8px;' ,'id'=>'permission'.$res->id)) }}
                  {{$res->name}}
                  </label>
                  @endforeach
                </div>
                  <?php
                    $i++;
                    ?>
                  @endforeach
              </div>
              </form>
            </div>
          </div>
        </div>
        <div class="card-footer">
          <div class="form">
            <div class="form-group from-show-notify row">
              <div class="col-12 text-center">
                <button type="submit" id="submitBtn" class="btn btn-success" onclick="document.getElementById('permissionsForm').submit();">Update</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

@endsection
