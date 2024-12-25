Get-ChildItem -Path "./" -Filter "*.hdr" | ForEach-Object {
    $inputFile = $_.FullName
    $outputFile = "$($inputFile.Substring(0, $inputFile.LastIndexOf('.'))).png"
    
    ffmpeg -i $inputFile -vf tonemap=tonemap=reinhard:desat=0,format=yuv420p -colorspace bt709 -color_primaries bt709 -color_trc bt709 $outputFile
}
