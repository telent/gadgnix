{ lib
, writeScript
, bash

, prefix
, tree
}:
let
  mkPathTree = prefix : attrs :
    builtins.concatStringsSep "\n"
      (lib.mapAttrsToList
        (n: v:
          let pathname = "${prefix}/${n}";
          in
            if builtins.isAttrs v
            then "mkdir -p ${pathname}\n${mkPathTree pathname v}"
            else "echo ${builtins.toJSON v} > ${pathname}")
        attrs) ;
in writeScript "make-file-tree.sh" ''
#! ${bash}/bin/bash
set -xe
mkdir -p ${prefix}
${mkPathTree prefix tree}
''
