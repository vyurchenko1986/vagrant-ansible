/beep
#Disable unused services
:log warning "Start Services configured";
:do {
	/ip service {
    set api disabled=yes
    set api-ssl disabled=yes
    set ftp disabled=yes
		set telnet disabled=yes
		set www disabled=yes
    set www-ssl disabled=yes
	};
} on-error={:log error "Error services configured"};

#By default, disable the helper'y
:log warning "Start Service ports configured";
:do {
	/ip firewall service-port {
    set dccp disabled=yes
		set ftp disabled=yes
    set h323 disabled=yes
    set irc disabled=yes
    set pptp disabled=yes
    set sctp disabled=yes
    set sip disabled=yes
		set tftp disabled=yes
		set udplite disabled=yes
	};
} on-error={:log error "Error service ports configured"};

#Create Interface Lista, add interfaces there
:log info "Start Interface list configured";
:do {
	/interface list add name=WAN comment="$CommentPref";
	/interface list add name=LAN comment="$CommentPref";
	/interface list member {
		add interface=bridge1 list=LAN
		add interface=ether1 list=WAN
	};
	:log info "Interface list created";
} on-error={:log error "Error Interface list configured"};

#Configuring default settings
:log info "Start Standart settings configured";
:do {
	/ip firewall connection tracking set tcp-established-timeout=1h;
	/tool mac-server ping set enabled=no;
	/ip neighbor discovery-settings set discover-interface-list=LAN;
	/tool mac-server set allowed-interface-list=LAN;
	/tool mac-server mac-winbox set allowed-interface-list=LAN;
	/ip dns set allow-remote-requests=yes;
	/system identity set name="$SystemIdentity";
	:log info "Standart settings created";
} on-error={:log error "Error Standart configured"};
