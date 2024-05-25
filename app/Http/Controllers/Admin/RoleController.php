<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Admin;
use Validator;
use Session, Auth;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use DB;
use Artisan;

class RoleController extends Controller
{
    public function index() {
      $role = Auth::user()->role;
      $role_id = isset($role['id']) ? $role['id'] : '';
      if(empty($role_id) || $role_id == 1)
      {
        $data['roles'] = Role::all();
      }else{
        $data['roles'] = Role::where('id','!=',1)->get();
      }
      return view('admin.role.index', $data);
    }

    public function store(Request $request) {

      $rules = [
        'name' => 'required|max:255',
      ];

      $validator = Validator::make($request->all(), $rules);
      if ($validator->fails()) {
        $errmsgs = $validator->getMessageBag()->add('error', 'true');
        return response()->json($validator->errors());
      }

      $role = new Role;
      $role->name = $request->name;
      $role->save();

      Session::flash('success', 'Role added successfully!');
      return "success";
    }

    public function update(Request $request) {
      $rules = [
        'name' => 'required|max:255',
      ];

      $validator = Validator::make($request->all(), $rules);
      if ($validator->fails()) {
        $errmsgs = $validator->getMessageBag()->add('error', 'true');
        return response()->json($validator->errors());
      }

      $role = Role::findOrFail($request->role_id);
      $role->name = $request->name;
      $role->save();

      Session::flash('success', 'Role updated successfully!');
      return "success";
    }

    public function delete(Request $request) {

      $role = Role::findOrFail($request->role_id);
      if ($role->admins()->count() > 0) {
        Session::flash('warning', 'Please delete the users under this role first.');
        return back();
      }
      $role->delete();

      Session::flash('success', 'Role deleted successfully!');
      return back();
    }

    public function managePermissions($id) 
    {
        $role = Auth::user()->role;
        $role_id = isset($role['id']) ? $role['id'] : '';
        if($role_id != 1 && $id == 1)
        {
          return redirect()->route('admin.role.index');
        }
        $data['role'] = Role::find($id);
        $data['permissionByGroupNames'] = Permission::select('group_name')->where('status','1');
        if(auth()->guard('admin')->user()->role_id != 1)
        {
          $data['permissionByGroupNames'] = $data['permissionByGroupNames']->where('basic','0');
        }
        $data['permissionByGroupNames'] = $data['permissionByGroupNames']->groupBy('group_name')->get();


        $data['rolePermissions'] = DB::table("role_has_permissions")->where("role_has_permissions.role_id",$id)
            ->pluck('role_has_permissions.permission_id','role_has_permissions.permission_id')
            ->all();
      return view('admin.role.permission.manage', $data);
    }

    public function updatePermissions(Request $request) 
    {
      DB::beginTransaction();
      try{
          
          \Artisan::call('cache:forget spatie.permission.cache');
          $role = Role::find($request->role_id);
          $role->syncPermissions($request->input('permission'));
          DB::commit();
          Session::flash('success', "Permissions updated successfully for '$role->name' role");
          return redirect()->back();
      }catch(\Exception $e){
          DB::rollback();
          Session::flash('error', $e->getMessage());
          return redirect()->back();
      }


      // $permission = $request->permissions;
      // if(!in_array('Dashboard',$permission))
      // {
      //     array_push($permission, 'Dashboard');
      // }
      // $permissions = json_encode($permission);
      // $role = Role::find($request->role_id);
      // $role->permissions = $permissions;
      // $role->save();

      // Session::flash('success', "Permissions updated successfully for '$role->name' role");
      // return back();
    }
}
