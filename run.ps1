if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$Version = Read-Host "Which version to install? [c]ombined, [g]odot, [u]nity, [up]grade, [un]install, [t]est"
$contune = "0";

while ($continue -ne "0") {

    if($Version -eq "c"){
        $contune = "1"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        $AnyFile = Get-Content $PSScriptRoot\src\choco.ps1 -Raw
        invoke-expression $AnyFile
        break
    }

    elseif($Version -eq "g"){
        $contune = "1"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        $AnyFile = Get-Content $PSScriptRoot\src\godot.ps1 -Raw
        invoke-expression $AnyFile
        break
    }

    elseif($Version -eq "u"){
        $contune = "1"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        $AnyFile = Get-Content $PSScriptRoot\src\unity.ps1 -Raw
        invoke-expression $AnyFile
    break
    }

    elseif($Version -eq "up"){
        $contune = "1"
        choco upgrade all -y
    break
    }

    elseif($Version -eq "un"){
        $contune = "1"
        choco uninstall all -y
    break
    }
    elseif($Version -eq "t"){
        $contune = "1"
        $AnyFile = Get-Content $PSScriptRoot\src\test.ps1 -Raw
        invoke-expression $AnyFile
    break
    }

    else{
        Write-Host "ERROR, invalid version"
        $Version = Read-Host "Which version to install? [c]ombined, [g]odot, [u]nity, [up]grade, [un]install"
    }
} 

Write-Host "THE SCRIPT DID RUN SUCCESSFULY! HURRAY! :D"
PAUSE