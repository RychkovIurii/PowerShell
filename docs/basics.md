# PowerShell Cheat Sheet

## Basic Commands:
| Command                   | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `Get-Help <cmd>`           | Displays help information for a cmdlet (e.g., `Get-Help Get-Process`)       |
| `Get-Command`              | Lists all available cmdlets, functions, workflows, aliases, and scripts     |
| `Get-Process`              | Lists running processes                                                     |
| `Get-Service`              | Lists services running on your machine                                       |
| `Get-Location` or `pwd`    | Displays the current working directory                                       |
| `Set-Location` or `cd`     | Changes the current working directory                                        |
| `Get-Item`                 | Retrieves an item (file, folder, etc.) from a specified location            |
| `New-Item`                 | Creates a new item (file, folder, etc.)                                      |
| `Remove-Item`              | Deletes an item (file, folder, etc.)                                         |
| `Copy-Item`                | Copies an item from one location to another                                 |
| `Move-Item`                | Moves an item from one location to another                                  |
| `Rename-Item`              | Renames an item (file, folder, etc.)                                         |

---

## Working with Files and Folders:
| Command                   | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `Get-ChildItem` or `ls`    | Lists the contents of a directory                                           |
| `New-Item -ItemType File`  | Creates a new file                                                           |
| `Set-Content`              | Writes data to a file                                                        |
| `Get-Content`              | Reads data from a file                                                        |
| `Add-Content`              | Appends data to an existing file                                             |
| `Out-File`                 | Redirects output to a file                                                   |
| `Clear-Content`            | Clears the contents of a file                                               |

---

## Output and Formatting:
| Command                   | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `Write-Host`               | Displays information to the console (not sent to the pipeline)               |
| `Write-Output`             | Sends output to the pipeline (default behavior)                             |
| `Out-Host`                 | Sends output directly to the console                                         |
| `Format-Table`             | Formats output as a table                                                   |
| `Format-List`              | Formats output as a list                                                    |
| `Select-Object`            | Selects specific properties of objects for output                           |

---

## Pipelines and Filtering:
| Command                   | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `Where-Object`             | Filters objects based on a condition                                         |
| `Select-Object`            | Selects specific properties or objects from output                          |
| `Sort-Object`              | Sorts objects based on a specified property                                 |
| `ForEach-Object`           | Performs an action on each object in the pipeline                           |
| `Group-Object`             | Groups objects by a specified property                                      |

---

## Managing Processes and Services:
| Command                   | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `Start-Process`            | Starts a new process (application or script)                                |
| `Stop-Process`             | Stops a running process                                                     |
| `Get-Process`              | Retrieves information about running processes                               |
| `Get-Service`              | Retrieves information about services running on the machine                 |
| `Start-Service`            | Starts a service                                                           |
| `Stop-Service`             | Stops a service                                                            |

---

## Variables and Scripts:
| Command                   | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `$variable = <value>`      | Declares and assigns a value to a variable                                  |
| `Get-Variable`             | Retrieves the value of a variable                                           |
| `Set-Variable`             | Sets the value of a variable                                                |
| `Remove-Variable`          | Removes a variable from memory                                              |
| `& <script_path>`          | Executes a script or command (use the call operator)                        |

---

## Error Handling and Debugging:
| Command                   | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `Try { } Catch { }`        | Defines a try/catch block for error handling                                |
| `Throw`                    | Throws a custom error                                                        |
| `Set-PSDebug -Trace 1`     | Enables script debugging (step through the script)                         |
| `Write-Error`              | Writes an error to the error stream                                          |

---

## Remote Sessions and Jobs:
| Command                   | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `Enter-PSSession`          | Starts an interactive remote session on another machine                     |
| `Exit-PSSession`           | Ends a remote session                                                       |
| `New-PSSession`            | Creates a persistent remote session                                          |
| `Get-Job`                  | Retrieves background jobs                                                     |
| `Start-Job`                | Starts a background job                                                      |
| `Stop-Job`                 | Stops a running background job                                               |

---

## System Information:
| Command                   | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `Get-EventLog`             | Retrieves event logs from the system                                         |
| `Get-ComputerInfo`         | Retrieves system information (e.g., OS, hardware details)                   |
| `Get-WmiObject`            | Retrieves information from Windows Management Instrumentation (WMI)         |
| `Get-HotFix`               | Retrieves information about installed updates and patches                    |

---

## Help and Documentation:
| Command                   | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `Get-Help <cmd>`           | Displays help for the specified cmdlet                                       |
| `Get-Help <cmd> -Examples` | Displays examples for the specified cmdlet                                   |
| `Get-Help <cmd> -Full`     | Displays full documentation for the specified cmdlet                        |
| `Get-Help <cmd> -Online`   | Opens online help documentation for the specified cmdlet                    |

---

## User Input:
| Command                   | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `Write-Host`               | Displays information directly to the console (not passed to the pipeline)   |
| `Read-Host`                | Prompts the user for input and returns the entered value                    |
| **Example**                | `Read-Host "Enter your name"` will prompt the user for their name           |

---

## Key Differences Between `Write-Host` and `Write-Output`:
| Feature               | `Write-Host`                              | `Write-Output`                             |
|-----------------------|-------------------------------------------|--------------------------------------------|
| **Main purpose**       | Display information to the console        | Pass data to the pipeline or display it    |
| **Pipeline**           | Does **not** send data to the pipeline    | Sends data to the pipeline                 |
| **Capture**            | Cannot be captured or redirected          | Can be captured or redirected              |
| **Use case**           | For user interaction, logging, or display | For sending output between cmdlets in a pipeline |

---
