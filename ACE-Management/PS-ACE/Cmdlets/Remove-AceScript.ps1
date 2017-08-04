function Remove-AceScript
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [string]
        $Uri,

        [Parameter(Mandatory)]
        [string]
        $ApiKey,

        [Parameter(Mandatory)]
        [Guid]
        $Id
    )

    try
    {
        $result = Invoke-AceWebRequest -Method Get -Uri "$($Uri)/ace/script/delete/$($Id)" -ApiKey $ApiKey -CheckCert
        Write-Output ($result | ConvertFrom-Json)   
    }
    catch
    {
        
    }
}