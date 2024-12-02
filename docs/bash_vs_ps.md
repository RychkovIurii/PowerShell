# Bash vs. PowerShell Cheat Sheet

| **Task**                             | **Bash Command**                                       | **PowerShell Command**                                      |
|--------------------------------------|-------------------------------------------------------|------------------------------------------------------------|
| **List files in a directory**         | `ls`                                                 | `Get-ChildItem`                                            |
| **List all files, including hidden**  | `ls -a`                                              | `Get-ChildItem -Force`                                     |
| **List files recursively**            | `ls -R`                                              | `Get-ChildItem -Recurse`                                   |
| **Find a file by name**               | `find . -name "file.txt"`                            | `Get-ChildItem -Recurse -Filter "file.txt"`                |
| **Find files larger than 1 MB**       | `find . -type f -size +1M`                           | `Get-ChildItem -File -Recurse | Where-Object { $_.Length -gt 1MB }` |
| **Show current directory**            | `pwd`                                                | `Get-Location`                                             |
| **Change directory**                  | `cd /path/to/dir`                                    | `Set-Location /path/to/dir`                                |
| **Create a new directory**            | `mkdir new_folder`                                   | `New-Item -ItemType Directory -Name "new_folder"`          |
| **Delete a file**                     | `rm file.txt`                                        | `Remove-Item file.txt`                                     |
| **Delete a directory**                | `rm -r folder`                                       | `Remove-Item folder -Recurse`                              |
| **Copy a file**                       | `cp file1.txt file2.txt`                             | `Copy-Item file1.txt file2.txt`                            |
| **Move a file**                       | `mv file1.txt /new/location/`                        | `Move-Item file1.txt /new/location/`                       |
| **View file content**                 | `cat file.txt`                                       | `Get-Content file.txt`                                     |
| **Find a string in a file**           | `grep "text" file.txt`                               | `Select-String -Pattern "text" -Path file.txt`             |
| **Count lines in a file**             | `wc -l file.txt`                                     | `(Get-Content file.txt).Length`                            |
| **Sort lines in a file**              | `sort file.txt`                                      | `Get-Content file.txt | Sort-Object`                     |
| **Environment variables**             | `echo $PATH`                                         | `$env:PATH`                                                |
| **Set environment variable**          | `export VAR=value`                                   | `$env:VAR = "value"`                                       |
| **List all environment variables**    | `env`                                                | `Get-ChildItem Env:`                                       |
| **Run a script**                      | `./script.sh`                                        | `./script.ps1`                                             |
| **List running processes**            | `ps aux`                                             | `Get-Process`                                              |
| **Kill a process by PID**             | `kill <PID>`                                         | `Stop-Process -Id <PID>`                                   |
| **Check disk usage**                  | `df -h`                                              | `Get-PSDrive`                                              |
| **Check memory usage**                | `free -h`                                            | `Get-WmiObject Win32_OperatingSystem | Select-Object TotalVisibleMemorySize,FreePhysicalMemory` |
| **Download a file**                   | `curl -O http://example.com/file.txt`               | `Invoke-WebRequest -Uri "http://example.com/file.txt" -OutFile "file.txt"` |
| **Compress files**                    | `tar -czf archive.tar.gz file1 file2`               | `Compress-Archive -Path file1, file2 -DestinationPath archive.zip` |
| **Decompress files**                  | `tar -xzf archive.tar.gz`                           | `Expand-Archive -Path archive.zip -DestinationPath .`      |
| **Check network interfaces**          | `ifconfig` (or `ip addr`)                           | `Get-NetAdapter`                                           |
| **Ping a host**                       | `ping google.com`                                    | `Test-Connection google.com`                               |
| **Check open ports**                  | `netstat -tuln`                                     | `Get-NetTCPConnection | Where-Object { $_.State -eq "Listen" }` |
| **Schedule a task**                   | `crontab -e`                                         | `New-ScheduledTaskTrigger` and `Register-ScheduledTask`    |
| **List all environment variables**    | `env`                                                | `Get-ChildItem Env:`                                       |
