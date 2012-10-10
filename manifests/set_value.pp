define sysctl::set_value(
	$value
){

 	exec { "exec_sysctl_${name}":
 		command => "/sbin/sysctl ${name}=${value}",
 		refreshonly => true,
 	}

 	sysctl { $name:
 		value  => "$value",
 		notify => Exec["exec_sysctl_${name}"],
 	}
}
