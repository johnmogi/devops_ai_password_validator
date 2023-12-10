function Check-PasswordStrength {
    param (
        [string]$password
    )

    $pattern = '^(?=.*[!@#$%^&*()_+]).{8,}$'

    if ($password -match $pattern) {
        Write-Host "Password is strong." -ForegroundColor Green
        return $true
    } else {
        Write-Host "Password is weak. It must be at least 8 characters long and contain at least one special character." -ForegroundColor Red
        return $false
    }
}

# Main script
do {
    $password = Read-Host "Enter your password" -AsSecureString
    $password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

    $isValid = Check-PasswordStrength -password $password
    if (-not $isValid) {
        $retry = Read-Host "Do you want to retry? (y/n)"
        if ($retry -ne "y") {
            Write-Host "Exiting program."
            break
        }
    }
} while (-not $isValid)
