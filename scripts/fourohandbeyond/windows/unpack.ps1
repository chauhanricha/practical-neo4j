Write-Host "Unpacking the downloads..."

#Versions
$apocVersion = "4.0.0.15"
$neo4jVersion = "4.0.6"
$gdsVersion = "1.2.2"

#Files
#$jdkZip = "zulu11.39.15-ca-jdk11.0.7-win_x64.zip" - jre does the job really
$jreZip = "zulu11.39.15-ca-jre11.0.7-win_x64.zip"
$neo4jZip = "neo4j-enterprise-$($neo4jVersion)-windows.zip"
$gdsZip = "neo4j-graph-data-science-$($gdsVersion)-standalone.zip"
$gdsJar = "neo4j-graph-data-science-$($gdsVersion)-standalone.jar"
$apocJar = "apoc-$($apocVersion)-all.jar"
$apocNLPJar = "apoc-nlp-dependencies-$($apocVersion).jar"
$apocMongoDBJar = "apoc-mongodb-dependencies-$($apocVersion).jar"

#Install Path
$installPath = Join-Path (Get-Location).Path "install"

#Unzip zipped things
$expandPath = Join-Path $installPath $neo4jZip
Expand-Archive -Force $expandPath ".\"
Write-Host "That's Neo4j done"
$expandPath = Join-Path $installPath $jreZip
Expand-Archive -Force $expandPath ".\"
Write-Host "JRE as well"
$expandPath = Join-Path $installPath $gdsZip
Expand-Archive -Force $expandPath ".\install"
Write-Host "GDS too"

#Move things to be moved
$apocLocation = Join-Path $installPath $apocJar
$apocDestination = Join-Path "neo4j-enterprise-$($neo4jVersion)\plugins" $apocJar
Move-Item -Force -Path $apocLocation -Destination $apocDestination
Write-Host "APOC is now in place"

$apocNLPLocation = Join-Path $installPath $apocNLPJar
$apocNLPDestination = Join-Path "neo4j-enterprise-$($neo4jVersion)\plugins" $apocNLPJar
Move-Item -Force -Path $apocNLPLocation -Destination $apocNLPDestination
Write-Host "APOC NLP dependencies are now in place"

$apocMongoDBLocation = Join-Path $installPath $apocMongoDBJar
$apocMongoDBDestination = Join-Path "neo4j-enterprise-$($neo4jVersion)\plugins" $apocMongoDBJar
Move-Item -Force -Path $apocMongoDBLocation -Destination $apocMongoDBDestination
Write-Host "APOC MongoDB dependencies are now in place"

$gdsLocation = Join-Path $installPath $gdsJar
$gdsDestination = Join-Path "neo4j-enterprise-$($neo4jVersion)\plugins" $gdsJar
Move-Item -Force -Path $gdsLocation -Destination $gdsDestination
Write-Host "GDS is now in place"

Write-Host "All Done!"
