# Requires administrative PowerShell 6+ command shell
# Place service in location first
# Adding this text because the file size was 666 bytes

$SERVICE_NAME = "MyService"
$BINARY_PATH = ""
$USER_ACCOUNT = ""
$DESCRIPTION = ""
$DISPLAY_NAME = "MyService"

$acl = Get-Acl $BINARY_PATH
$aclRuleArgs = $USER_ACCOUNT, "Read,Write,ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow"
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($aclRuleArgs)
$acl.SetAccessRule($accessRule)
$acl | Set-Acl $BINARY_PATH

New-Service -Name $SERVICE_NAME -BinaryPathName $BINARY_PATH -Credential $USER_ACCOUNT -Description $DESCRIPTION -DisplayName $DISPLAY_NAME -StartupType Automatic