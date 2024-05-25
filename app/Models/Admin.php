<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;

class Admin extends Authenticatable
{
  use Notifiable,HasRoles;

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
    'role_id', 'username', 'email', 'password', 'first_name', 'last_name', 'image', 'status'
  ];


  public function role()
  {
    return $this->belongsTo('App\Models\Role','role_id','id');
  }
  public static function getpermissionsByGroupName($group_name)
    {
        $permissions = \DB::table('permissions')->select('name', 'id')->where('group_name', $group_name);
        if(auth()->guard('admin')->user()->role_id != 1)
        {
            $permissions = $permissions->where('basic', '0');
        }
        $permissions = $permissions->get();
        return $permissions;
    }

    public static function getpermissionGroups()
    {
        $permission_groups = \DB::table('permissions')->select('group_name as name');
        if(auth()->guard('admin')->user()->role_id != 1)
        {
            $permission_groups = $permission_groups->where('basic', '0');
        }
        $permission_groups = $permission_groups->groupBy('group_name')->get();
        
        return $permission_groups;
    }

    public static function roleHasPermissions($role, $permissions)
    {
        $hasPermission = true;
        foreach ($permissions as $permission) {
            if (!$role->hasPermissionTo($permission->name)) {
                $hasPermission = false;
                return $hasPermission;
            }
        }
        return $hasPermission;
    }
}
