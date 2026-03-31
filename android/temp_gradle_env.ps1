$env:JAVA_HOME = 'C:\Program Files\Eclipse Adoptium\jdk-17.0.18.8-hotspot'
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
Set-Location 'C:\Users\user\Projects\Flutter\samthulqibla\Samthul-Qibla\android'
.\gradlew assembleDebug --stacktrace > build_log.txt 2>&1
Get-Content build_log.txt | Select-String -Pattern 'FAILURE|Caused by|ERROR|Exception' | Select-Object -Unique | Select-Object -First 80
