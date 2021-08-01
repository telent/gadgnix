with (import <nixpkgs> {}) ;

let
  prefix = "/sys/kernel/config/usb_gadget/g1";
  makePathTree = callPackage ./make-path-tree.nix {
    tree = import ./usb-gadget.nix;
    inherit prefix;
  }; in

writeScript "configure-usb-gadget.sh" ''
#! ${pkgs.bash}/bin/bash
modprobe libcomposite
${makePathTree}
ln -s ${prefix}/functions/rndis.usb0 ${prefix}/configs/c.1/

read udc  <<<"$(cd /sys/class/udc ; ls)"
echo $udc > ${prefix}/UDC
''
