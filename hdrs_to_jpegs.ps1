$inputDir = "./hdr"
$outputDir = "./jpg"

# delete old file because ffmpeg need confirmation when rewriting a file
# there is probably a way to remove confirmation with ffmpeg idk
Get-ChildItem -Path $outputDir -Filter "*.jpg" | ForEach-Object {
    $_.Delete()
}


# convert all file
Get-ChildItem -Path $inputDir -Filter "*.hdr" | ForEach-Object {
    $inputPath = $_.DirectoryName
    $inputFile = $inputPath + "\" + $_.Name

    # can be probably optimised
    $outputFile = $inputPath.Substring(0, $inputPath.LastIndexOf('\')) + $outputDir + "\" + $_.Name.Substring(0, $_.Name.LastIndexOf('.')) + ".jpg"
     
    ffmpeg -i $inputFile -vf "eq=gamma=1.9:contrast=1.1,format=rgb24" -q:v 2 $outputFile
}