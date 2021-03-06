function New-AceScript
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [string]
        $Path,

        [Parameter(Mandatory)]
        [string]
        $Name,

        [Parameter(Mandatory)]
        [string]
        $Language,
        
        [Parameter()]
        [ValidateSet('none','hash')]
        [string[]]
        $Enrichment,

        [Parameter(Mandatory = $true)]
        [ValidateSet('file','siem')]
        [string]
        $OutputType,

        [Parameter(Mandatory)]
        [string]
        $Uri,

        [Parameter(Mandatory)]
        [string]
        $ApiKey
    )

    $body = @{
        Name = $Name
        Language = $Language
        Enrichment = $Enrichment
        Output = $OutputType
        Content = [System.IO.File]::ReadAllBytes($Path)
    }

    try 
    {
        $result = Invoke-AceWebRequest -Method Post -Uri "$($Uri)/ace/script" -Body (ConvertTo-Json $body -Compress) -ContentType application/json -ApiKey $ApiKey -CheckCert
        Write-Output ($result | ConvertFrom-Json)        
    }
    catch 
    {
        
    }
}