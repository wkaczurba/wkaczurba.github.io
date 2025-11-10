# Windows

## Windows - looking up/finding listening ports - various approaches:
    - use `rsmon` - quick
    - alternatively `netstat -aof | findstr :8080`  - slow

Tailing logs in Windows/Powershell: `Get-Content filenamehere -Wait -Tail 30`

