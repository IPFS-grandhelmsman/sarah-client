-- Application start script
-- @Author  grandhelmsman<desupport@grandhelmsman.com>

local appm = import('app.boot');

argv = [[
{"exe_file":{"value":"go-filecoin","desc":"\u53ef\u6267\u884c\u7a0b\u5e8f\u540d\u79f0"},"bootup":{"value":true,"desc":"\u5f00\u673a\u542f\u52a8"},"monitor":{"value":true,"desc":"\u8fdb\u7a0b\u76d1\u6d4b"},"dynamic":{"value":false,"desc":"\u63a8\u9001\u8fdb\u7a0b\u52a8\u6001"},"base_dir":{"value":"\/opt\/Go-Filecoin","desc":"\u5e94\u7528\u76ee\u5f55"},"log_dir":{"value":"\/data\/Go-Filecoin\/log","desc":"\u65e5\u5fd7\u76ee\u5f55"},"data_dir":{"value":"\/data\/Go-Filecoin\/data","desc":"\u6570\u636e\u76ee\u5f55"},"uninstall_rm_file":{"value":true,"desc":"\u5378\u8f7d\u65f6\u5220\u9664\u5b89\u88c5\u6587\u4ef6"},"uninstall_rm_log":{"value":false,"desc":"\u5378\u8f7d\u65f6\u662f\u5426\u5220\u9664\u65e5\u5fd7"},"uninstall_rm_data":{"value":false,"desc":"\u5378\u8f7d\u65f6\u662f\u5426\u5220\u9664\u6570\u636e(\u8c28\u614e)"},"app_init_cmd":{"value":"${base_dir}\/${exe_file} init --devnet-user --genesisfile=http:\/\/user.kittyhawk.wtf:8020\/genesis.car --repodir=${data_dir}","desc":"\u5e94\u7528\u521d\u59cb\u5316\u547d\u4ee4"},"app_boot_cmd":{"value":"${base_dir}\/${exe_file} daemon --repodir=${data_dir}","desc":"\u5e94\u7528\u542f\u52a8\u547d\u4ee4"}}
]];


local app = appm.new(executor, argv);
if ( app:check_argv() == false ) then
    return false;
end

local lock = app:getLock();
if ( lock:lock() == false ) then
    return false;
end

-- check and stop the running application
app:tryStop();

if ( app:init() == false ) then
    lock:unlock();
    return false;
end

if ( app:bootup() == false ) then
    lock:unlock();
    return false;
end

-- check and to the application monitor
lock:unlock();
app:monitor();
