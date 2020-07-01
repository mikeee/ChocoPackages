$ErrorActionPreference = 'Stop'

remove-item "$ENV:Public\Desktop\ThrottleStop.lnk" -Force -ErrorAction SilentlyContinue
remove-item "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs\ThrottleStop.lnk" -Force -ErrorAction SilentlyContinue