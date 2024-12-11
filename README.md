# PowerShell Scripting Project

This **PowerShell Scripting Project** was developed as part of the **Skriptaus** course, a scripting course conducted in Finnish. Over the course of the project, I gained hands-on experience with automation, data processing, and system administration, leveraging the versatility and power of PowerShell. The project served as a practical exploration of scripting concepts and tools, aligning with academic goals.

---

## **Project Overview**

- **Name**: PowerShell Scripting Project  
- **Course Name**: Skriptaus (Conducted in Finnish) 
- **Objective**: Develop and demonstrate proficiency in scripting through the implementation of 107 practical scripts addressing diverse tasks.  
- **Credit Hours**: 15 credits  
- **Tools Used**: PowerShell 5 and PowerShell 7  

The scripts covered a wide range of functionalities, including:
- Process and service management
- File manipulation and directory organization
- Data transformation
- Error handling and debugging
- Cross-platform scripting challenges

---

## Table of Contents ##
1. [Challenges Faced During PowerShell Scripting](#challenges-faced-during-powershell-scripting)
2. [Lessons Learned](#lessons-learned)
3. [Comprehensive Overview of 107 Tasks](#comprehensive-overview-of-107-tasks)

---

## Challenges Faced During PowerShell Scripting ##

Throughout the development of 107 scripts using both PowerShell 5 and PowerShell 7, several challenges arose.
These issues ranged from handling user input and variable scope to addressing compatibility and performance bottlenecks.
Below is a summary of the key challenges and how they were resolved.

---

### 1. Dynamic Casting and Input Handling
Handling user inputs dynamically, especially using `Read-Host`, presented challenges when converting inputs to specific data types.

- **Issue**: If a user entered `0` or pressed Enter without input, `Read-Host` returned `null`, causing type conversion errors.
- **Example**:
```powershell
$userInput = Read-Host "Enter a number"
$number = [int]$userInput  # Fails if $userInput is $null
```
- **Solution**: Validate input before casting:
```powershell
if ($userInput -ne $null -and $userInput -match '^\d+$') {
	$number = [int]$userInput
} else {
	Write-Host "Invalid input."
}
```

---

### 2. Global Variable Scope
In PowerShell, variables are global by default, leading to unintended persistence across scripts.

- **Issue**: Variables created in one script were accessible in subsequent scripts unless explicitly cleared.
- **Example**:
```powershell
$globalVar = "This is global"
```
Without cleanup, $globalVar remains available after script execution.
- **Solution**: Use local scoping ($local:variableName) or explicitly clear variables with:
```powershell
Remove-Variable -Name globalVar
```

---

### 3. Compatibility Between PowerShell 5 and PowerShell 7
Several cmdlets and modules worked differently or were unavailable in PowerShell 7.

- **Example**: The Add-LocalGroupMember cmdlet requires the Microsoft.PowerShell.LocalAccounts module, which is not directly available in PowerShell 7 without additional configuration.
Workaround: Use conditionally loaded modules or cross-version compatible cmdlets

---

### 4. Error Handling and Debugging
Debugging complex scripts was challenging, especially when cmdlets produced non-terminating errors.

Issue: Errors like those from Get-Service for inaccessible services did not trigger catch blocks.
Solution: Use -ErrorAction Stop to treat non-terminating errors as terminating:
```powershell
try {
    Get-Service -Name "NonExistentService" -ErrorAction Stop
} catch {
    Write-Host "Service not found: $($_.Exception.Message)"
}
```

---

### 5. Redirection of stderr
PowerShell handles stderr differently from Unix-like systems when used in pipelines.

- **Issue**: Redirecting stderr (2> or 2>>) applies only to the last command in a pipeline in PowerShell, whereas in Unix-like systems, stderr redirection applies to all commands in the pipeline.
- **Example**:
```powershell
Get-Service | Sort-Object | Out-File output.txt 2> errors.txt
```
Only errors from Out-File are redirected, while errors from Get-Service are still printed to the terminal.
- **Solution**: Combine redirections carefully or use separate commands to ensure proper handling of all errors.

---

## Lessons Learned ##
1. Always validate and sanitize user inputs. Perform tests.
2. Explicitly scope variables to avoid unintended persistence.
3. Test scripts across PowerShell versions for compatibility.
4. Adopt robust error handling using try/catch and -ErrorAction.
5. Optimize loops and data processing for performance.
6. Understand and adapt to platform-specific behaviors and limitations.
7. Manage pipeline and redirection differences between PowerShell and Unix-like systems.


---


## Comprehensive Overview of 107 Tasks

This document provides a summary of 107 PowerShell scripts, covering a wide range of administrative, scripting, and data processing tasks.
These tasks were executed using **PowerShell 5** and **PowerShell 7**, leveraging the unique features of both versions to achieve optimal results.

---

#### 1. **File and Directory Operations**
- **File Management**: Automated tasks for creating, copying, moving, renaming, and deleting files or directories.
- **Size-based Filters**: Search for and manipulate files based on size thresholds.
- **Audit Logs**: Scan directories for specific file types or patterns and generate reports.

---

#### 2. **System Information and Configuration**
- **Service Management**: Scripts to start, stop, restart, and query services.
- **System Info**: Extract OS version, architecture, and hardware details.
- **Process Monitoring**: Identify high-CPU or memory-consuming processes and generate alerts.

---

#### 3. **User and Group Management**
- **Local User Operations**: Create, delete, and modify user accounts.
- **Group Management**: Add or remove users/groups from local security groups.
- **Domain Integration**: Handle domain-specific user/group modifications.

---

#### 4. **Network and Remote Management**
- **Ping Sweeps**: Identify live hosts in a subnet.
- **Remote Execution**: Execute scripts on remote machines using `Invoke-Command`.
- **Port Scanning**: Detect open ports on target systems.

---

#### 5. **Automation and Scheduling**
- **Task Scheduler Integration**: Automate script execution using the Windows Task Scheduler.
- **Looping Mechanisms**: Use `foreach` and `while` loops for repeated execution.
- **Error Recovery**: Implement `try`/`catch` blocks for robust automation.

---

#### 6. **Data Parsing and Formatting**
- **CSV Handling**: Import, process, and export data in CSV format.
- **JSON and XML Parsing**: Extract and manipulate structured data.
- **Text Processing**: Use regular expressions for pattern matching and string operations.

---

#### 7. **Web and API Interactions**
- **HTTP Requests**: Fetch or send data using `Invoke-WebRequest` and `Invoke-RestMethod`.
- **API Automation**: Query RESTful APIs for dynamic data.
- **Web Scraping**: Extract and format content from websites.

---

#### 8. **Error Handling and Debugging**
- **Debugging Tools**: Use `Write-Debug`, `Write-Host`, and breakpoints for troubleshooting.
- **Error Trapping**: Gracefully handle exceptions in complex scripts.
- **Log Generation**: Track script execution with detailed log files.

---

#### 9. **Security and Permissions**
- **Access Control**: Modify file/folder permissions programmatically.
- **Encryption/Decryption**: Use secure strings for sensitive data handling.
- **Audit Trails**: Log user activities and access attempts.

---

#### 10. **Performance Monitoring**
- **Resource Usage**: Monitor CPU, RAM, and disk usage dynamically.
- **Event Log Analysis**: Parse system and application event logs for troubleshooting.
- **Real-time Alerts**: Generate email or desktop alerts based on thresholds.

---

#### 11. **Interactive Scripts**
- **User Prompts**: Use `Read-Host` for input-driven workflows.
- **Dynamic Menus**: Present options to users and execute corresponding actions.
- **Interactive Dashboards**: Display live system metrics in formatted tables.

---

#### 12. **Custom Object Creation**
- **Object Handling**: Create and manipulate custom objects for structured data.
- **Property Expansion**: Use `Select-Object` with `-ExpandProperty` to work with object properties.

---

#### 13. **Script Organization and Modularization**
- **Functions**: Modularize code into reusable functions.
- **Global Variables**: Use `$global:` to share variables across functions.
- **Parameterization**: Design scripts with customizable inputs for flexibility.

---

#### 14. **Comparison of PowerShell with Bash**
- **Scope Management**: PowerShell uses function-level scoping by default; Bash variables are global unless explicitly declared.
- **Error Handling**: PowerShell has robust error handling (`try`/`catch`), unlike Bash's exit codes.
- **Dynamic Typing**: PowerShell's dynamic casting simplifies variable handling.

---

#### 15. **Reporting and Visualization**
- **HTML Reports**: Generate formatted reports for system audits.
- **Excel Integration**: Export data to Excel-compatible formats.
- **Formatted Output**: Use `Format-Table` and `Format-List` for structured output.

---

#### 16. **Advanced Topics**
- **Dynamic Casting**: Convert variables to required types dynamically.
- **Regular Expressions**: Process text and validate inputs using regex patterns.
- **Complex Pipelines**: Chain multiple commands for intricate workflows.

---

#### 17. **PowerShell Versions Utilized**
- **PowerShell 5**: Leveraged for compatibility with older systems and native Windows features.
- **PowerShell 7**: Utilized for its cross-platform capabilities, performance improvements, and modern enhancements.

---

## Conclusion
These 107 scripts demonstrate PowerShell's flexibility and power across diverse use cases.
By leveraging both PowerShell 5 and PowerShell 7, a comprehensive approach was achieved to solve a wide range of system administration, automation, and scripting tasks.

