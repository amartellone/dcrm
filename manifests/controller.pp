class dcrm::controller {
    
    exec { "update_novadb":
        command => "python manage.py upgrade ${sql_connection}",
        path => "/usr/bin:/usr/sbin:/bin:/sbin"
    }

    exec { "echo \"# START PIVOT \n\" >> /etc/nova/nova.conf" :
            subscribe=> Service["nova-api"],
            path => '/bin'
    }	

    exec { "echo \"pivot_address=127.0.1.1 \n\" >> /etc/nova/nova.conf" :
            path => '/bin'
    }

    exec { "echo \"scheduler_ongoing_enabled=TRUE \n\" >> /etc/nova/nova.conf" :
            path => '/bin'
    }	

    exec { "echo \"scheduler_ongoing_tick=10 \n\" >> /etc/nova/nova.conf" :
            path => '/bin'
    }
 	
    exec { "echo \"# STOP PIVOT \n\" >> /etc/nova/nova.conf" :
            path => '/bin'
    }
}