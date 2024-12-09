# Working with Arrays of Objects in PowerShell

If a variable contains an array of objects in PowerShell, you can interact with its elements and their properties effectively. Below are common use cases and techniques.

## 1. Verify the Type of the Variable
To ensure the variable is an array, check its type:
```powershell
$myArray = @(Get-Service)
$myArray.GetType()
```
If it is an array, the type will be something like System.Object[].

## 2. Inspect Properties of Array Elements
Use Get-Member to list properties and methods of the first object:

```powershell
$myArray[0] | Get-Member
```

## 3. Iterate Through All Array Elements
To inspect properties for all objects in the array, loop through them:

```powershell
foreach ($item in $myArray) {
    $item | Get-Member
}
```

## 4. Access Specific Elements
Use indexing to access a specific element and its properties:

```powershell
$myArray[0].Name    # Retrieves the 'Name' property of the first element
$myArray[-1].Status # Retrieves the 'Status' property of the last element
```

## 5. Retrieve a Specific Property for All Elements
To extract values of a specific property for all objects:

```powershell
$myArray | Select-Object -ExpandProperty Name
```

## 6. Display the Array in a Readable Format
Format the output for better readability using Format-Table:

```powershell
$myArray | Format-Table -Property Name, Status, StartType
```
Example Use Case
Filtering services to display only running ones along with their names:

```powershell
$services = Get-Service
$services | Where-Object { $_.Status -eq "Running" } | Select-Object -Property Name, DisplayName
```
This filters the array to include only running services and displays their Name and DisplayName