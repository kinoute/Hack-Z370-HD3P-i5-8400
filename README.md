# Hackintosh

![System spec](https://reho.st/self/87b57f7f6f9f3c44e059173dfce82cdc3e05cbb5.png)

I built my Hackintosh because I was disappointed with the price of the new Mac Mini 2018. Its configuration is close to the mid new Mac Mini, with 8gb more. Here are the specs:

- MacOS Mojave 10.14.3
- Intel i5-8400 (2.80 Ghz, 6 cores)
- Gigabyte Z370 HD3P
- Corsair Vengeance LPX 16Gb (2x8Gb) DDR4 2666MHz OC @ 3066Mhz
- EVGA 600 W1, 80+ WHITE 600W
- SSD SAMSUNG 830 Series 256 Gb
- Various old HDDs
- Apple Wired Keyboard
- Random mouse
- Random 24" 1080p monitor

## Installation

The installation was pretty straight forward. If you go like me with only the integrated Intel GPU (UHD 630), a Coffee Lake CPU, and this motherboard, just follow the [vanilla guide](https://hackintosh.gitbook.io/-r-hackintosh-vanilla-desktop-guide/) and read the "Coffee Lake" page carefully.

You can basically download the config file provided at the end of the page (or my EFI here), it works almost OOTB.

The only thing you need to generate by yourself if you use my EFI folder is your serial. You can use [macserial](https://github.com/acidanthera/macserial) to generate serials for the model you picked (I chose Macmini8,1 because my config is similar to the new Mac Mini model).

## Benchmarks

![Geekbench](https://reho.st/self/18c254cd50f126f4aab3d55717cc56c8d51e53ca.png)

Link: [https://browser.geekbench.com/v4/cpu/11742630](https://browser.geekbench.com/v4/cpu/11742630)


