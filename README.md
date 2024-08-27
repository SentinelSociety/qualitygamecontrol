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
7) Install all required software.
8) Apply provisioning packages to configure and secure the system (after initial setup):

    https://learn.microsoft.com/en-us/windows/configuration/provisioning-packages/provisioning-apply-package

9) Apply security configurations via PowerSTIG.

10) Run `sysprep` (as administrator) to remove unique information so that the image can be reused on a different computer.

    `C:\Windows\System32\Sysprep\sysprep.exe /oobe /generalize /shutdown`

# PowerSTIG and DSC

1) Install PowerSTIG

    `Install-Module -Name PowerStig -Scope CurrentUser`

    https://github.com/microsoft/PowerStig

2) Set the network connection type to private.

    https://support.microsoft.com/en-us/windows/make-a-wi-fi-network-public-or-private-in-windows-0460117d-8d3e-a7ac-f003-7a0da607448d

3) Enable `WinRM`

    `Set-WSManQuickConfig`

    https://learn.microsoft.com/en-us/powershell/dsc/troubleshooting/troubleshooting?view=dsc-1.1

 # PowerSTIG Workflow

    https://github.com/Microsoft/PowerStig/wiki/GettingStarted

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