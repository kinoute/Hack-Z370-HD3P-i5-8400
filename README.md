# Hackintosh

![System spec](https://raw.githubusercontent.com/kinoute/Hack-Z370-HD3P-i5-8400/master/Pictures/system.png)

I built my Hackintosh because I was disappointed with the price of the new Mac Mini 2018. Its configuration is close to the new mid-entry Mac Mini but with more RAM (16 instead of 8 Gb). Here are the specs:

- MacOS Mojave 10.14.5
- Intel i5-8400 (6 cores @ 2.80 Ghz, 3.80 Ghz Turbo Boost)
- Gigabyte Z370-HD3P
- Corsair Vengeance LPX 16Gb (2x8Gb) DDR4 2666MHz OC @ 3200 Mhz (CMK16GX4M2A2666C16)
- EVGA 600 W1, 80+ WHITE 600W
- SSD SAMSUNG 830 Series 256 Gb
- Various old HDDs
- Apple Wired Keyboard
- Random mouse
- M-Audio Fast Track Pro
- Yamaha HS5
- Random 24" 1080p monitor

## Installation

The installation was pretty straight forward. If you go like me with only the integrated Intel GPU (UHD 630), a Coffee Lake CPU, and this motherboard, just follow the [vanilla guide](https://hackintosh.gitbook.io/-r-hackintosh-vanilla-desktop-guide/) and read the "Coffee Lake" page carefully.

You can basically download the config file provided at the end of the page, it works almost OOTB.

## My EFI

if you use my EFI folder & BIOS Settings, there are two things you need to do. First, you need to generate by yourself your serials and put them in your `config.plist`. You can use [macserial](https://github.com/acidanthera/macserial) to generate serials for the model you picked (I chose Macmini8,1 because my config is similar to the new Mac Mini model).

Secondly, I switched from using the USB Port limit patch to a custom SSDT. You can find my template file and the compiled `SSDT-UIAC.aml` file in the [SSDT Folder](SSDT). In my case, I decided to disable every port that are considered on the "front" as I only use the USB Ports on the back of the motherboard.

If you want to customize my template `.dsl ` file, do it with any text editor and compile it as an `.aml` file with [MaciASL](https://bitbucket.org/RehabMan/os-x-maciasl-patchmatic/downloads/). Then copy it to *EFI/CLOVER/ACPI/patched* folder. Reboot and if you see nothing wrong with your USB ports, you can disable the USB Ports Limit patchs in your `config.plist` (don't remove USBInjectAll.kext though).

**Note:** I use the [Clover-Minimal Theme](https://github.com/al3xtjames/clover-theme-minimal) in my `config.plist` so if you only download my `config.plist`, be sure to either install this theme or change it to something you already have.

## BIOS

You can find my BIOS Settings with pictures [here](BIOS/README.md).

## Benchmarks

![Geekbench](https://raw.githubusercontent.com/kinoute/Hack-Z370-HD3P-i5-8400/master/Pictures/geekbench.png)

Link: https://browser.geekbench.com/v4/cpu/13146116


