# GenDoc.ps1 Basic ASCDoc generate and update GIT
# 06/19/2018

Clear-Host
Write-Output 'Phoenix Workgroup LLC'
Write-Output 'Generate Swagger ASCIIDoctor files and update GIT\n'

# --- Run the JAR to build the ADOC from YAML



# --- Get commit string from user, no (:) needed
$commitComment = read-host "Enter GIT Commit comment"

write-host "`nGenerate HTML files... "  -ForegroundColor Yellow
asciidoctor *.adoc

write-host "`nGenerate PDF files..." -ForegroundColor Yellow
asciidoctor-pdf *.adoc


# --- Confidence message for GIT processing
write-host "`nGIT processing...`n"

# --- Add all files to staged
git add .

# --- Git committ
git commit -m $commitComment

# --- GIT Push to repositoru, assume reference is already 
#     made to proper repository
git push

# --- Done
Write-Output "`n`n**** GenDoc completed."
pause
