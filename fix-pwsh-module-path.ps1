# # Display the current paths
# $paths = $env:PSModulePath -split ';'

# # Define the path you want to remove
# $pathToRemove = "C:\Users\rse-d\Documents\WindowsPowerShell\Modules"

# # Filter out the path you want to remove
# $newPaths = $paths | Where-Object { $_ -ne $pathToRemove }

# # Update the $env:PSModulePath variable
# $env:PSModulePath = $newPaths -join ';'

# # Display the updated paths
# $env:PSModulePath

# Display the current paths
$currentPaths = $env:PSModulePath -split ';'

# Define the new path you want to add
$newPath = "C:\Users\rse-d\Documents\WindowsPowerShell\Modules"

# Check if the path is already in the list
if ($currentPaths -notcontains $newPath) {
    # Add the new path to the list
    $updatedPaths = $currentPaths + $newPath

    # Update the $env:PSModulePath variable
    $env:PSModulePath = $updatedPaths -join ';'
}

# Display the updated paths
$env:PSModulePath
