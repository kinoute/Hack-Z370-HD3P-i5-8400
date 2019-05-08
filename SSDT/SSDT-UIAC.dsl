// SSDT-UIAC-ALL.dsl
//
// This SSDT can be used as a template to build your own
// customization for USBInjectAll.kext.
//
// This SSDT contains all ports, so using it is the same as without
// a custom SSDT.  Delete ports that are not connected or ports you
// do not need.
//
// Change the UsbConnector or portType as needed to match your
// actual USB configuration.
//
// Note:
// portType=0 seems to indicate normal external USB2 port (as seen in MacBookPro8,1)
// portType=2 seems to indicate "internal device" (as seen in MacBookPro8,1)
// portType=4 is used by MacBookPro8,3 (reason/purpose unknown)
//

DefinitionBlock ("", "SSDT", 2, "hack", "_UIAC", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            "8086_a2af", Package()
            {
                "port-count", Buffer() { 26, 0, 0, 0 },
                "ports", Package()
                {
                    "HS03", Package()
                    {
                        "UsbConnector", 3, //USB3 Back Right Bottom
                        "port", Buffer() { 3, 0, 0, 0 },
                    },
                    "HS04", Package()
                    {
                        "UsbConnector", 3, //USB3 Back Right Top
                        "port", Buffer() { 4, 0, 0, 0 },
                    },
                    // "HS05", Package()
                    // {
                    //     "UsbConnector", 3, //USB3 Front Bottom
                    //     "port", Buffer() { 5, 0, 0, 0 },
                    // },
                    // "HS06", Package()
                    // {
                    //     "UsbConnector", 3, //USB3 Front Top
                    //     "port", Buffer() { 6, 0, 0, 0 },
                    // },
                    "HS07", Package()
                    {
                        "UsbConnector", 3, //USB3 Back Left Bottom
                        "port", Buffer() { 7, 0, 0, 0 },
                    },
                    "HS08", Package()
                    {
                        "UsbConnector", 3, //USB3 Back Left Top
                        "port", Buffer() { 8, 0, 0, 0 },
                    },
                    "HS09", Package()
                    {
                        "UsbConnector", 0, //USB2 Back Panel Top
                        "port", Buffer() { 9, 0, 0, 0 },
                    },
                    "HS10", Package()
                    {
                        "UsbConnector", 0, //USB2 Back Panel Bottom
                        "port", Buffer() { 10, 0, 0, 0 },
                    },
                    // "HS11", Package()
                    // {
                    //     "UsbConnector", 0, //USB2 Front Panel Bottom
                    //     "port", Buffer() { 11, 0, 0, 0 },
                    // },
                    // "HS12", Package()
                    // {
                    //     "UsbConnector", 0, //USB2 Front Panel Top
                    //     "port", Buffer() { 12, 0, 0, 0 },
                    // },
                    "SS03", Package()
                    {
                        "UsbConnector", 3, //USB3 Back Right Bottom
                        "port", Buffer() { 19, 0, 0, 0 },
                    },
                    "SS04", Package()
                    {
                        "UsbConnector", 3, //USB3 Back Right Top
                        "port", Buffer() { 20, 0, 0, 0 },
                    },
                    // "SS05", Package()
                    // {
                    //     "UsbConnector", 3, //USB3 Front Bottom
                    //     "port", Buffer() { 21, 0, 0, 0 },
                    // },
                    // "SS06", Package()
                    // {
                    //     "UsbConnector", 3, //USB3 Front Top
                    //     "port", Buffer() { 22, 0, 0, 0 },
                    // },
                    "SS07", Package()
                    {
                        "UsbConnector", 3, //USB3 Back Left Bottom
                        "port", Buffer() { 23, 0, 0, 0 },
                    },
                    "SS08", Package()
                    {
                        "UsbConnector", 3, //USB3 Back Left Top
                        "port", Buffer() { 24, 0, 0, 0 },
                    },
                },
            },

        })
    }
}
//EOF
