RMDIR .\docs\ /S /Q
hugo -b="https://blog.mantziaris.eu/" -D -d .\docs\
copy .\static\google472a548d3516814a.html .\docs\