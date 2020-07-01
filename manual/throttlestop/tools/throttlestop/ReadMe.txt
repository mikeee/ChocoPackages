ThrottleStop 9.0
June 19, 2020

New Features
- replaced the WinRing0 and RwDrv.sys drivers for improved Windows 10 2004 compatibility.
- first version compiled with Visual Studio 2019.
- added code to stop ThrottleStop from starting if it previously crashed on startup.
- added options to adjust the main ThrottleStop font.
- enabled Limit Reasons access for Intel 10th Gen Core i CPUs.
- added max temperature and max power consumption to the main screen.
- redesigned the C States window to include 6 and 8 core support.
- new Notification Area power icon.
- added an adjustable PROCHOT Offset feature.
- redesigned Throttle indicator on the main screen which includes types of throttling.
- Nvidia MHz reporting added to the log file and to the GPU button.
- improved consistency between user interface and Notification Area temperatures.

New ThrottleStop.INI Font Options

MainFont=Tahoma
MainFontOffset=0

The first option is used to change the type of font that ThrottleStop uses.

The second option can be used to increase or decrease the size of this font.
Set this option to a small positive number to increase the font size.
Use a small negative number to decrease the font size.


Kevin Glynn
throttlestop@shaw.ca
