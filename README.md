# win-11-gold

Instructions detail how to customize a Windows 11 Enterprise x64 image for incorporating software and security 
into an ISO file.

# Requirements:
1) DISA Windows 11 STIG Compliance
2) SRA Ground Control Station STIG Compliance

# Required Software:
1) QGroundControl (QGC)
2) QGC-Gov
3) Mission Planner
4) Windows Tactical Assault Kit (WinTAK)

# Build Environment and Tools:
- Windows 11 Enterprise x64
- Windows Assessment and Deployment Kit (ADK)
- Windows Preinstallation Environment (PE) Add-Ons

# Steps to create the ISO:
1) Download the Windows 11 Enterprise x64 ISO
2) Install TPM on Linux KVM Host

`sudo apt-get install swtpm swtpm-tools`

3) Create the Windows 11 VM
    1) Create a new VM for Windows 11 from `virt-manager`
    2) Attach the Windows 11 ISO image to the VM
    3) Configure desired CPU, RAM, and storage capacity
    4) At the end of the wizard, tick `Customize configuration before install` checkbox
4) Configure the Windows 11 VM Hardware
    1) Click the `Overview` section, change firmware to `UEFI x86_64: /usr/share/edk2-ovmf/x64/OVMF_CODE.secboot.fd`
    2) Click `Add Hardware` and add `TPM`
        1) Change `Type` to `Emulated`
        2) Change `Model` to `TIS`
        3) Change `Version` to `2.0`
5) Boot up the VM and follow the Windows 11 installation wizard and initial setup wizard.
6) Install all software updates via `Windows Update`.
7) Install all required software (manually or automated via Powershell).
8) Apply provisioning packages to configure and secure the system (after initial setup):

    https://learn.microsoft.com/en-us/windows/configuration/provisioning-packages/provisioning-apply-package

9) Apply security configurations (STIG) via PowerSTIG.

10) Run `sysprep` (as administrator) to remove unique information so that the image can be reused on a different computer.

    `C:\Windows\System32\Sysprep\sysprep.exe /oobe /generalize /shutdown`

# DSC for Linux

1) Install Linux packages (on Linux)

    https://learn.microsoft.com/en-us/linux/packages

2) Install OMI (on Linux)

    https://github.com/Microsoft/omi

3) Install DSC (on Linux)

    https://learn.microsoft.com/en-us/powershell/dsc/getting-started/lnxgettingstarted?view=dsc-1.1

4) Upgrade Powershell (on Windows)

5) Enable basic authentication (on Windows)

    ```
    winrm set winrm/config/service '@{AllowUnencrypted="true"}'
    winrm set winrm/config/service/auth '@{Basic="true"}'
    ```

    Note that this is to ease development and must be disabled later.
    

4) Connect Linux to Windows (from Linux)

    `/opt/omi/bin/omicli ei root/cimv2 Win32_Environment --auth Basic --hostname 192.168.122.234 -u rse -p 0captain --port 5985`

# DSC and PowerSTIG

1) Install PowerSTIG

    `Install-Module -Name PowerStig -Scope CurrentUser`

    https://github.com/microsoft/PowerStig

2) Set the network connection type to private.

    https://support.microsoft.com/en-us/windows/make-a-wi-fi-network-public-or-private-in-windows-0460117d-8d3e-a7ac-f003-7a0da607448d

3) Enable `WinRM`

    `Set-WSManQuickConfig`

    https://learn.microsoft.com/en-us/powershell/dsc/troubleshooting/troubleshooting?view=dsc-1.1

 # PowerSTIG Workflow

    1) Compile PowerSTIG Configuration
    2) Apply PowerSTIG Configuration

    `Start-DscConfiguration .\WindowsClient -w -v -f`

    https://github.com/Microsoft/PowerStig/wiki/GettingStarted

# Steps to setup Ansible

`pip install pywinrm`

`ansible-playbook -i ansible/inventory.ini ansible/roles/windows/tasks/windows-setup.yml`

`ansible-playbook -i ansible/inventory.ini ansible/roles/windows/tasks/install-software.yml`

Recommendation: Take a snapshot NOW!!!

`virsh dumpxml win11`

`sudo qemu-img snapshot -c snapshot_name /path/to/your/pflash-image`
`sudo qemu-img snapshot -c baseline /var/lib/libvirt/images/win11.qcow2`
`sudo qemu-img snapshot -l /var/lib/libvirt/images/win11.qcow2`

# Troubleshooting

## Using Windows Configuration Designer

- See the following guide to create provisioning packages to apply configuration settings to Windows client devices.
Provisioning packages should be used to configure and customize Windows installations before or during deployment, 
non-domain devices, and specific use cases.


    https://learn.microsoft.com/en-us/windows/configuration/provisioning-packages/provisioning-create-package

## Using sysprep
- See limitations on using sysprep:

    https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/sysprep--system-preparation--overview?view=windows-11

- Must be ran as administrator.
- Windows updates must not be in-progress.
- User-specific applications cannot be installed.

    `get-appxpackage -allusers -name "microsoft.onedrivesync" | Remove-appxpackage`
    `get-appxpackage -allusers -name "microsoft.bingsearch" | Remove-appxpackage`

# TODO
1) Fix QGroundControl.exe launching after applying WindowsClient DSC Configuration

Event Viewer:
Audit Failure; Microsoft Windows Security; Sensitive Privilege Use;
Process Name: C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe
Service Request Information; Privileges: SeTcbPrivilege