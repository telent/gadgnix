{
	# os_desc =  {
	#   qw_sign =  "";
	#   b_vendor_code =  "0x00";
	#   use =  "0";
	# };
	strings =  {
		"0x409" = {
		  "serialnumber" =  "0123456789";
		  "product" = "motorola-potter";
		  "manufacturer" = "Mobile NixOS";
		};
	};
	"configs" =  {
		"c.1" =  {
		  "strings" =  {
			  "0x409" = {
			    "configuration" =  "adb,rndis";
			  };
		  };
		  "bmAttributes" =  "0x80";
		  "MaxPower" =  "2";
		};
	};
	"functions" =  {
		"rndis.usb0" =  {
		  # "os_desc" =  {
			#   "interface.rndis" =  {
			#     "sub_compatible_id" =  "";
			#     "compatible_id" =  "";
			#   };
		  # };
		  "protocol" =  "00";
		  "subclass" =  "06";
		  "class" =  "02";
#		  "ifname" =  "usb0";
		  "qmult" =  "5";
		  "host_addr" =  "4e:c8:a3:66:c2:14";
		  "dev_addr" =  "42:6a:50:37:78:48";
		};
	};

	"max_speed" =  "super-speed-plus";
	"bcdUSB" =  "0x0200";
	"bcdDevice" =  "0x0513";
	"idProduct" =  "0xd001";
	"idVendor" =  "0x18d1";
	"bMaxPacketSize0" =  "0x40";
	"bDeviceProtocol" =  "0x00";
	"bDeviceSubClass" =  "0x00";
	"bDeviceClass" =  "0x00";
}
