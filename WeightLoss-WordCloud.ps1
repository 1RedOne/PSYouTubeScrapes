#C:\Users\Stephen\Dropbox\Code\Powershell\PSYouTubeScrapes

$girlsFashion = get-content ".\1-9-2020-12_12_23PM-InfoOutput.json" | ConvertFrom-Json

$girlsFashion[0]
$tags = $girlsFashion | select Tags

$mostPopularTags = $tags.Tags | Group-Object | Sort-Object Count -Descending | select -First 55

#$tags | ? Tags -in $mostPopularTags.Name

$tagCount = New-Object System.Collections.ArrayList
$mostPopularTags | % {
    $name = $_.Name 
    "adding $name"
    0..$_.Count | % {
        $tagCount.Add($Name)
    }
}

$tagCount  | New-WordCloud -Path ..\WeightLoss1.svg -FocusWord "WeightLoss" -Typeface "Adobe Devanagari"