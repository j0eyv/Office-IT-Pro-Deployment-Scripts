function Create-SubfolderShortcut {
    [CmdletBinding()]
        Param(
                
                                                                        
             )
          #Create new subfolder                                                                       
          if(!(Test-Path -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016")){
            New-Item -ItemType directory -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016"
          }       

          
          
          Delete-ExistingShortcuts

          
          Create-NewShortcuts
          
          
          #moves tools into the new Microsoft Office 2016 sub folder created for shortcuts
          Move-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016 Tools" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016\Microsoft Office 2016 Tools"
          
}

function Delete-ExistingShortcuts {
#delete current shortcuts
          $startMenuShortCut = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"

          $MSArray = New-Object System.Collections.Generic.List[System.Object]
          $MSArray.Add("Access 2016.lnk");$MSArray.Add("Excel 2016.lnk");$MSArray.Add("OneNote 2016.lnk");$MSArray.Add("Outlook 2016.lnk");$MSArray.Add("PowerPoint 2016.lnk");
          $MSArray.Add("Publisher 2016.lnk");$MSArray.Add("Skype For Business 2016.lnk");$MSArray.Add("Word 2016.lnk");$MSArray.Add("OneDrive for Business.lnk");

          #try to iterate here
          foreach($MSProduct in $MSArray){
                if(Test-Path -Path $startMenuShortCut+$MSProduct){
                    Remove-Item $startMenuShortCut+$MSProduct
                }

          }               



          if((Test-Path -Path "$Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Microsoft OneDrive.lnk")){
            Remove-Item "$Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Microsoft OneDrive.lnk"
          }


}

function Create-NewShortcuts {

          #Declare variable for each MS product
          $access = $Null
          $excel = $Null
          $groove = $Null
          $oneNote = $Null
          $outlook = $Null
          $powerpoint = $Null
          $MSPub = $Null
          $lync = $Null
          $winword = $Null
          $oneDrive = $Null
          

          #Set path to product for each variable if that product is installed

          #access path
          if((Test-Path -Path "C:\Program Files (x86)\Microsoft Office\root\Office16\MSACCESS.EXE")){
            $access = "C:\Program Files (x86)\Microsoft Office\root\Office16\MSACCESS.EXE"
          }
          elseif((Test-Path -Path "C:\Program Files\Microsoft Office\root\Office16\MSACCESS.EXE"))
          {
            $access = "C:\Program Files\Microsoft Office\root\Office16\MSACCESS.EXE"
          }
          #excel path
          if((Test-Path -Path "C:\Program Files (x86)\Microsoft Office\root\Office16\EXCEL.EXE")){
            $excel = "C:\Program Files (x86)\Microsoft Office\root\Office16\EXCEL.EXE"
          }
          elseif((Test-Path -Path "C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE"))
          {
            $excel = "C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE"
          }
          #groove path
          if((Test-Path -Path "C:\Program Files (x86)\Microsoft Office\root\Office16\GROOVE.EXE")){
            $groove = "C:\Program Files (x86)\Microsoft Office\root\Office16\GROOVE.EXE"
          }
          elseif((Test-Path -Path "C:\Program Files\Microsoft Office\root\Office16\GROOVE.EXE"))
          {
            $groove = "C:\Program Files\Microsoft Office\root\Office16\GROOVE.EXE"
          }
          
          #oneNote path
          if((Test-Path -Path "C:\Program Files (x86)\Microsoft Office\root\Office16\ONENOTE.EXE")){
            $oneNote = "C:\Program Files (x86)\Microsoft Office\root\Office16\ONENOTE.EXE"
          }
          elseif((Test-Path -Path "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"))
          {
            $oneNote = "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"
          }
          
           #outlook path
          if((Test-Path -Path "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE")){
            $outlook = "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE"
          }
          elseif((Test-Path -Path "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"))
          {
            $outlook = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
          } 
          
            #powerpoint path
          if((Test-Path -Path "C:\Program Files (x86)\Microsoft Office\root\Office16\POWERPNT.EXE")){
            $powerpoint = "C:\Program Files (x86)\Microsoft Office\root\Office16\POWERPNT.EXE"
          }
          elseif((Test-Path -Path "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.EXE"))
          {
            $powerpoint = "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.EXE"
          }  
          
           #MSPub path
          if((Test-Path -Path "C:\Program Files (x86)\Microsoft Office\root\Office16\MSPUB.EXE")){
            $powerpoint = "C:\Program Files (x86)\Microsoft Office\root\Office16\MSPUB.EXE"
          }
          elseif((Test-Path -Path "C:\Program Files\Microsoft Office\root\Office16\MSPUB.EXE"))
          {
            $powerpoint = "C:\Program Files\Microsoft Office\root\Office16\MSPUB.EXE"
          }  
          
             #lync path
          if((Test-Path -Path "C:\Program Files (x86)\Microsoft Office\root\Office16\lync.EXE")){
            $lync = "C:\Program Files (x86)\Microsoft Office\root\Office16\lync.EXE"
          }
          elseif((Test-Path -Path "C:\Program Files\Microsoft Office\root\Office16\lync.EXE"))
          {
            $lync = "C:\Program Files\Microsoft Office\root\Office16\lync.EXE"
          }       
          
            #winword path
          if((Test-Path -Path "C:\Program Files (x86)\Microsoft Office\root\Office16\WINWORD.EXE")){
            $winword = "C:\Program Files (x86)\Microsoft Office\root\Office16\WINWORD.EXE"
          }
          elseif((Test-Path -Path "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"))
          {
            $winword = "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"
          }    
          
            #oneDrive path
          if((Test-Path -Path "$Env:USERPROFILE\AppData\Local\Microsoft\OneDrive\OneDrive.exe")){
            $oneDrive = "$Env:USERPROFILE\AppData\Local\Microsoft\OneDrive\OneDrive.exe"
          }

          #for each installed product, create new shortcut

          #create new shortcuts
          if($access){
            $WshShell = New-Object -comObject WScript.Shell
            $Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016\Access 2016.lnk")
            $Shortcut.TargetPath = $access
            $Shortcut.Save()
          }
          
          if($excel){
            $WshShell = New-Object -comObject WScript.Shell
            $Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016\Excel 2016.lnk")
            $Shortcut.TargetPath = $excel
            $Shortcut.Save()
          }
          
          if($groove){
            $WshShell = New-Object -comObject WScript.Shell
            $Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016\OneDrive for Business.lnk")
            $Shortcut.TargetPath = $groove
            $Shortcut.Save()
          }
          
          if($oneNote){
            $WshShell = New-Object -comObject WScript.Shell
            $Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016\OneNote 2016.lnk")
            $Shortcut.TargetPath = $oneNote
            $Shortcut.Save()
          }
          
          if($outlook){
            $WshShell = New-Object -comObject WScript.Shell
            $Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016\Outlook 2016.lnk")
            $Shortcut.TargetPath = $outlook
            $Shortcut.Save()
          }
          
          if($powerpoint){
            $WshShell = New-Object -comObject WScript.Shell
            $Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016\PowerPoint 2016.lnk")
            $Shortcut.TargetPath = $powerpoint
            $Shortcut.Save()
          }
          
          if($MSPub){
            $WshShell = New-Object -comObject WScript.Shell
            $Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016\Publisher 2016.lnk")
            $Shortcut.TargetPath = $MSPub
            $Shortcut.Save()
          }
          
          if($lync){
            $WshShell = New-Object -comObject WScript.Shell
            $Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016\Skype for Business 2016.lnk")
            $Shortcut.TargetPath = $lync
            $Shortcut.Save()
          }
          
          if($winword){
            $WshShell = New-Object -comObject WScript.Shell
            $Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016\Word 2016.lnk")
            $Shortcut.TargetPath = $winword
            $Shortcut.Save()
          }
          
          if($oneDrive){
            $WshShell = New-Object -comObject WScript.Shell
            $Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2016\Microsoft OneDrive.lnk")
            $Shortcut.TargetPath = $oneDrive
            $Shortcut.Save()
          }

}