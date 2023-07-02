docker pull mcr.microsoft.com/dotnet/sdk:7.0
docker build ./backend -t flup_backend
docker run -ti -p 55555:55555 --rm flup_backend

Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');