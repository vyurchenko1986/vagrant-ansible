#Create Interface Lista, add interfaces there
:log warning "Start Interface list configured";
:do {
	/interface list add name=WAN comment="TEST";
	/interface list add name=LAN comment="TEST";
	/interface list member {
		add interface=bridge1 list=LAN
		add interface=ether1 list=WAN
	};
	:log warning "Interface list created";
} on-error={:log error "Error Interface list configured"};
