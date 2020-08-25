# Hackintosh

A Hackintosh running macOS 10.15.6 with a i5-8400 and a Gigabyte Z370-HD3P.

![System spec](https://raw.githubusercontent.com/kinoute/Hack-Z370-HD3P-i5-8400/master/Pictures/system.png)

## Status

I recently updated my Hackintosh from Mojave 10.14.6 to Catalina 10.15.6. You can find the latest and final EFI Folder for Mojave [here](https://github.com/kinoute/Hack-Z370-HD3P-i5-8400/releases/tag/v1.0).

If you're curious, I changed two things in my `config.plist` to fix Catalina:

* I added ` igfxonln=1` to the boot arguments because I was getting a black screen after waking up from sleep. It fixed the problem but AppleALC, the kext that handles the Audio, was crashing my system (Kernel Panic) after waking up.
* To avoid the Kernel Panic after waking up, I had to disable the audio through HDMI. Since I don't use it, it was not a problem. To do that, I set-up the  `No-hda-gfx` property in my `config.plist` file. It fixed the issue.

**Important:** If you wish to upgrade to Catalina just like I did, don't forget to install/use a recent version of Clover, at least Clover v5.0 r5107. I personally use [Clover v5.0 r5119](https://github.com/Dids/clover-builder/releases/tag/v5.0_r5119).

## Motivation

I built my Hackintosh because I was disappointed with the price of the new Mac Mini 2018. Its configuration is close to the new mid-entry Mac Mini but with more RAM (16 instead of 8 Gb). Here are the specs:

- macOS Catalina 10.15.6
- Intel i5-8400 (6 cores @ 2.80 Ghz, 3.80 Ghz Turbo Boost)
- Gigabyte Z370-HD3P
- Corsair Vengeance LPX 16Gb (2x8Gb) DDR4 2666MHz OC @ 3200 Mhz (CMK16GX4M2A2666C16)
- EVGA 600 W1, 80+ WHITE 600W
- SSD SAMSUNG 830 Series 256 Gb
- Various old HDDs
- Apple Wired Keyboard
- Microsoft Wireless Mobile Mouse 1000
- M-Audio Fast Track Pro
- Yamaha HS5
- Philips 244E 24" 1080p monitor

## Installation

The installation was pretty straight forward. If you go like me with only the integrated Intel GPU (UHD 630), a Coffee Lake CPU, and this motherboard, just follow the [vanilla guide](https://hackintosh.gitbook.io/-r-hackintosh-vanilla-desktop-guide/) and read the "Coffee Lake" page carefully.

You can basically download the config file provided at the end of the vanilla guide, it works almost OOTB. Or you can download mine, see below.

## BIOS

I'm running the BIOS **F14a** version. You can find my BIOS Settings with pictures [here](BIOS/README.md). 

If you are using a version older than F11, be careful if you want to update your BIOS to F11 or newer. They changed something and you have to add an ACPI Patch in your `config.plist` before the update, otherwise macOS won't boot.

This is already done in my `config.plist` available in this repo as of April 30th, 2020.

## My EFI

* **Clover version**: v5.0 r5119
* **UEFI Drivers** (now located in `EFI/Clover/drivers/UEFI`):
    - _ApfsDriverLoader.efi_
    - _AptioMemoryFix.efi_
    - _HFSPlus.efi_
* **Kexts** (in `EFI/Clover/kexts/Other`):
    - _AppleALC.kext_
    - _IntelMausiEthernet.kext_
    - _Lilu.kext_
    - _SMCProcessor.kext_
    - _SMCSuperIO.kext_
    - _VirtualSMC.kext_
    - _WhateverGreen.kext_

If you use my EFI folder & BIOS Settings, you need to generate by yourself your serials and put them in the `config.plist`. You can use [macserial](https://github.com/acidanthera/macserial) to generate serials for the model you picked.

I first chose `Macmini8,1` because my config was similar to the new Mac Mini model but I recently changed my SMBIOS to `iMac19,2` due to the black screen issue I was having while watching videos in full screen. (**Update:** Apparently this was a bug on macOS and it has been fixed in 10.14.6).

`iMac19,2` seems better for power management and upgradability (in case you want to add a dedicated GPU later). This is the SMBIOS used in this config.

**Note:** I use the [Clover-Minimal Theme](https://github.com/al3xtjames/clover-theme-minimal) in my `config.plist` so if you only download my `config.plist`, be sure to either install this theme or change it to something you already have.

## What works

* UHD 630 Integrated Graphics
* Turbo Boost
* Ethernet
* USB 2 / USB 3 Ports (see [USB Ports](#usb-ports))
* HDMI Out (without audio on 10.15, see [Status](#Status))
* DVI-D Out
* Sleep / Wake up
* Sound (see [Sound](#Sound))

## USB Ports

I created my own kext with Hackintool to map all the USB Ports on the back of the motherboard. You can find it in my EFI folder, it's called *USBPorts.kext*.

Both USB 2 and USB 3 ports are working. The USB 3.1 port is also working OOTB. For USB 3 ports, you can also use USB 2 devices on them, it will work. Here are all the ports enabled and working (except USB-C, not tested):

![usb-ports](Pictures/usb-ports.jpg)

If you have a case with USB ports on front or if you want to use an internal card for bluetooth, you will have to edit my kext to enable them. You then might have to choose exactly what ports you want to be able to use because you will quickly reach the 15 ports limit.

## Sound

As I mentioned in my setup above, I use a USB Audio interface for input/output. Therefore, I don't use that much (almost never) the inputs/outputs provided on the back of the motherboard.

Nevertheless, this repo should allow you to use sound I/O provided by the motherboard without any problem. 

With the AppleALC layout id set to "1" (already done in my `config.plist`), I was able to use:

* my headphones ;
* a microphone ;
* also the "Line In" to send music from my smartphone to macOS.

To use the sound inputs/ouputs of this motherboard, I did:

* Set `alcid` clover boot options to "1" (already done here) ;
* Use the "Pink" input (Mic In) for my microphone (and set "Built-in Microphone" in macOS Sound Settings) ;
* Use the "Green" input (Line Out) for my headphones (and set "Built-in Speakers" in macOS Sound Settings) ;
* Use the "Blue" input (Line In) to send sound to my Hack ("Built-in Line In" in macOS).

![](Pictures/sound.png)

![](Pictures/sound-2.png)

## Font on non-retina displays

For some people, after upgrading to Catalina, the font can look blurry or too thin on non-retina displays. I use a very old 24" 1080p monitor and I encountered this problem.

To get a somewhat similar font rendering as before, you can use the following two command lines that you have to type in your Terminal:

```bash
defaults -currentHost delete -globalDomain AppleFontSmoothing
defaults write -g CGFontRenderingFontSmoothingDisabled -bool YES
```

Then restart your Hackintosh. It should look better.

## Benchmarks

![Geekbench](https://raw.githubusercontent.com/kinoute/Hack-Z370-HD3P-i5-8400/master/Pictures/geekbench.png)

Link: https://browser.geekbench.com/v4/cpu/15697612

