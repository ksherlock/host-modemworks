# ModemWorks modules for the KEGS emulator.

OMM Module stubs for the Port Tool (serial driver) and Modem Tool (modem driver).  Actual implementation is handled in KEGS.

KEGS works fine with the normal Modem and SerialGS modules. *However*, that means KEGS has to emulate the serial hardware, the telnet
protocol, and the Hayes AT command set.  Using a custom Modem/Serial Module bypasses most of that and we can just use TCP sockets directly.

(Currently, inbound connections are via TCP server but outbound connections create a pseudo terminal to run bash, etc directly).
