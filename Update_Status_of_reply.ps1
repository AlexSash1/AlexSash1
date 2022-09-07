# Applies to: Exchange Server 2016 Enterprise Edition, Exchange Server 2016 Standard Edition, Exchange Server 2013 Standard Edition, Exchange Server 2013 Enterprise, Exchange Server 2010 Enterprise, Exchange Server 2010 Standard, Exchange Online
# When the Out of Office Assistant is enabled, only one reply is sent to each sender, even if you receive multiple messages from that person
# The Out of Office Assistant sends an automatic reply to notify users who send you messages that you are away from the office. Your reply is only sent once to a message sender. 
# The count is reset when you toggle the Out of Office Assistant. Microsoft Exchange clears its internal "sent to" list when you disable the Out of Office Assistant.
#
# This script toggles the Out of Office Assistant in mailboes where AutoReplyState is enabled
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
