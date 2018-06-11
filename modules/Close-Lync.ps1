# Get SfB status
$SfB = Get-Process lync -ErrorAction SilentlyContinue
if ($SfB) {
  # Try closing SfB gracefully first
  $SfB.CloseMainWindow()
  # Stop-Process after 5 seconds otherwise
  Sleep 5
  if (!$SfB.HasExited) {
    $SfB | Stop-Process -Force
  }
}
Remove-Variable SfB
[System.GC]::Collect()
