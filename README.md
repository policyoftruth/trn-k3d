## k3d/wsl notes

### assumptions
- ubuntu 24.04 in WSL2
- windows 11, build 23H2
- virtualization support set in your BIOS, probs under CPU settings somewhere

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
- install docker:
```
#!/usr/bin/env bash

# Check for old stuff and remove
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Actually install the dang software
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add user to correct group
sudo usermod -aG docker $USER
```
- try a `docker run hello-world` to verify
- check/run k8s tooling: `kube-tools.sh`

### running k3d
- check `kstart.sh`
