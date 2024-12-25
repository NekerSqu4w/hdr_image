$inputDir = "./hdr"
$outputDir = "\png"

Get-ChildItem -Path $inputDir -Filter "*.hdr" | ForEach-Object {
    $inputPath = $_.DirectoryName
    $inputFile = $inputPath + "\" + $_.Name

    # can be probably optimised
    $outputFile = $inputPath.Substring(0, $inputPath.LastIndexOf('\')) + $outputDir + "\" + $_.Name.Substring(0, $_.Name.LastIndexOf('.')) + ".png"

    ffmpeg -i $inputFile -vf tonemap=tonemap=reinhard:desat=0,format=yuv420p -colorspace bt709 -color_primaries bt709 -color_trc bt709 $outputFile
}

