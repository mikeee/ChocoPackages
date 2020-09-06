# ![Emsisoft Emergency Kit Logo](https://cdn.jsdelivr.net/gh/mikeee/ChocoPackages/icons/emsisoft-emergency-kit.png "emsisoft-emergency-kit Logo") [emsisoft-emergency-kit](https://chocolatey.org/packages/emsisoft-emergency-kit)

The Emsisoft Emergency Kit contains a collection of programs that can be used without software installation to scan for malware and clean infected computers: Emsisoft Emergency Kit Scanner and Emsisoft Commandline Scanner.

Emsisoft Emergency Kit Scanner

The Emsisoft Emergency Kit Scanner includes the powerful Emsisoft Scanner complete with graphical user interface. Scan the infected PC for Viruses, Trojans, Spyware, Adware, Worms, Dialers, Keyloggers and other malicious programs.
Emsisoft Commandline Scanner

This scanner contains the same functionality as the Emergency Kit Scanner but without a graphical user interface. The commandline tool is made for professional users and is perfect for batch jobs.

To run the Emsisoft Commandline Scanner, perform the following actions:

- Open a command prompt window (Run: cmd.exe)
- Switch to the drive of the USB Stick (e.g.: f:), then to the folder of the executable files (e.g.: cd run)
- Run the scanner by typing: a2cmd.exe

Next you will see a help page describing all available parameters.

The following parameter is an example of scanning drive c:\ with Memory, Traces (Registry) scan enabled, and archive support active. Detected Malware is moved to quarantine.

a2cmd.exe /f="c:\" /m /t /a /q="c:\quarantine\"

**NOTE**: This package is automatically updated. If it is out of date and there is no newer package submitted, please use the `Contact Maintainers` functionality to alert me.
