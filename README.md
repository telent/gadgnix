# Configure USB gadgets with Nix (PoC)

I am not sure this is a good idea, but I am presenting it for feedback.

There are a number of tools to create the USB gadget configfs structure
appropriate to a particular application of composite gadgets, and they
all seem to accept a data file which is only a light transformation of the
config directory they output.

Which leads me to wonder whether we could "just" create the config
directory directly from a Nix nested attrset.

## What it does

Given an attrset like [usb-gadget.nix], create a USB composite gadget.
`make-path-tree.nix` is a general-purpose tool which accepts an
attrset and writes a shell script which runs "mkdir" and "echo" to
turn it into filesystem, then `default.nix` calls the resulting script
and does extra time-dependent configuration:

- configfs doesn't allow dangling symlinks, so we can't make the links
  from functions to configs until the functions exist

- the write to `UDC` is apparently the Big Switch that turns the whole
  thing on, so that must be done last

## Demo

    $ nix-build .
	$ cat result   # observe, it is a shell script
	$ sudo bash ./result  # works only on target hardware


## Missing bits

I haven't dealt yet with _removing_ the configuration. The brute force
way to do this is

	# echo "" > UDC
    # find usb_gadget -type l |xargs rm
	# find  usb_gadget -depth -type d |xargs rmdir
