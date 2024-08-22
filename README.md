## k3d/wsl notes

### assumptions
- ubuntu 24.04 in WSL2
- windows 11, build 23H2
- virtualization support set in your BIOS, possibly under CPU settings somewhere

### references
- k3d: <https://k3d.io>

### wsl2 prereq stuff
- `.wslconfig` in your ***%UserProfile%*** directory w/o an extension
```
[wsl2]
memory=24GB
networkingMode=mirrored
kernelCommandLine=ipv6.disable=1
dnsTunneling=true
```
- `wsl --shutdown` after changes
- check `free -h` to make sure memory change took
- wsl2 linux ip should match your windows 11 ip
- run this in admin powershell `Set-NetFirewallHyperVVMSetting -Name '{40E0AC32-46A5-438A-A0B2-2B479E8F2E90}' -DefaultInboundAction Allow`
- install docker, `inst_docker.sh`
- try a `docker run hello-world` to verify
- check/run k8s tooling: `inst_k8s_tools.sh`

### running k3d
- check `kstart.sh`
