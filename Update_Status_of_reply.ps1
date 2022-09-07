$mailboxes = Get-Mailbox | Get-MailboxAutoReplyConfiguration | Where-Object {$_.AutoReplyState –eq “enabled”} 

foreach ($mailbox in $mailboxes) {
  Set-MailboxAutoReplyConfiguration $mailbox.Identity -AutoReplyState Disabled
  $mailbox.Identity
  Do {
    #Write-Host "Enabled"
    Start-Sleep 1
   $status = Get-Mailbox $mailbox.Identity | Get-MailboxAutoReplyConfiguration
 }
While ($status.AutoReplyState –eq “Enabled”)

  Set-MailboxAutoReplyConfiguration $mailbox.Identity  -AutoReplyState Enabled 
  } 
