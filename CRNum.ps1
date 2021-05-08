
$web_client = new-object System.Net.Webclient
$web_client.Credentials = New-Object System.Net.NetworkCredential(admin, 12345678)
$response_info = $web_client.DownloadString("https://dev94240.service-now.com/change_request.do?JSONv2&sysparm_query=number%CHG0030005")
$response_json = ConvertFrom-Json $response_info
If($response_json.records[0].approval -ne 'approved')
{
	$approvalException = New-Object System.Exception "CR is not Approved"
	Throw $approvalException
}
else
{
	Write-Output $response_json.records[0].approval
}
