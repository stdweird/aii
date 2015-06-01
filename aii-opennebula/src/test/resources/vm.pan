template vm;

prefix "/hardware";
"bios" = nlist(
    "releasedate", "01/01/2007",
    "version", "0.5.1",
);
"cards" = nlist(
    "bmc", list(nlist("console", "ttyS0,115200")),
    "nic", nlist(
        "eth0", nlist("boot", "true", "hwaddr", "AA:00:00:80:01:00", "pxe", "true"),
        "eth1", nlist("boot", "false", "hwaddr", "AA:00:00:80:01:01", "pxe", "true"),
        "eth2", nlist("boot", "false", "pxe", "true"),
    ),
);

"cpu" = list(
    nlist(
        "arch", "x86_64",
        "cores", 2,
        "manufacturer", "Intel",
        "model", "Intel(R) Xeon(R) E5520 2.27GHz",
        "speed", 2260,
        "vendor", "Intel",
    ),
    nlist(
        "arch", "x86_64",
        "cores", 2,
        "manufacturer", "Intel",
        "model", "Intel(R) Xeon(R) E5520 2.27GHz",
        "speed", 2260,
        "vendor", "Intel",
    )
);
"harddisks" = nlist(
    "vda", nlist(
        "capacity", 20480,
        "interface", "sas",
        "model", "Generic SAS disk",
        "part_prefix", ""
    ),
    "vdb", nlist(
        "capacity", 10480,
        "interface", "sas",
        "model", "Generic SAS disk",
        "part_prefix", ""
    ),
);
"location" = "cubone hyp";
"model" = "KVM Virtual Machine";
"ram" = list (
    nlist ("size", 2048,),
    nlist ("size", 2048,),
);
"serialnumber" = "kvm/QUATTOR_IMAGE001";

prefix "/system/network";
"default_gateway" = "10.141.10.250";
"domainname" = "cubone.os";
"hostname" = "node630";
"interfaces" = nlist(
    "eth0", nlist(
        "broadcast", "10.141.10.255",
        "driver", "bnx2",
        "ip", "10.141.8.30",
        "netmask", "255.255.0.0"
    ),
    "eth1", nlist(
        "broadcast", "172.24.255.255",
        "device", "eth1",
        "ip", "172.24.8.30",
        "netmask", "255.255.0.0",
    ),
    "eth2", nlist(
        "broadcast", "172.24.255.255",
        "device", "eth2",
        "ip", "172.24.8.31",
        "netmask", "255.255.0.0",
    ),
);


prefix "/system/opennebula";
"vnet" = nlist(
    "eth0", "altaria.os",
    "eth1", "altaria.vsc",
    "eth2", "altaria.vsc");

"datastore" = nlist(
    "vda", "ceph.altaria",
    "vdb", "ceph.altaria");

"ignoremac" = list (
    "eth2",
);
