try{
   $web_data=Invoke-WebRequest -Uri "aka.ms/ScriptForPermsOnHana" 
    $web_data.RawContent | Out-File .\msawb-plugin-config-com-sap-hana.sh
    $date_modified=$web_data.BaseResponse.LastModified
    Write-Host ("This script last updated on: ",$date_modified)

    $Script_content=Get-Content .\msawb-plugin-config-com-sap-hana.sh | select -Skip 11
    $Script_content | Out-File .\msawb-plugin-config-com-sap-hana.sh
    Write-Host ("File  downloaded successfully")

}

catch{
   Write-Host "Error occured unable to download script, Please check connectivity" -BackgroundColor DarkRed
}

finally{
    
   Start-Sleep 5
   $Error.Clear()

}

