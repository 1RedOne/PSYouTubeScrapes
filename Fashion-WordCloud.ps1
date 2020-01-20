#C:\Users\Stephen\Dropbox\Code\Powershell\PSYouTubeScrapes

$girlsFashion = get-content ".\1-9-2020-11_31_44AM-InfoOutput.json" | ConvertFrom-Json
$tags = $girlsFashion.Tags | select Tags

$mostPopularTags = $tags | Group-Object | Sort-Object Count -Descending | select -First 50

$tags | ? $PSItem -in $mostPopularTags.Name

$tagCount = New-Object System.Collections.ArrayList
$mostPopularTags | % {
    $name = $_.Name 
    "adding $name"
    0..$_.Count | % {
        $tagCount.Add($Name)
    }
}

$tagCount  | New-WordCloud -Path ..\GirlsFashion1.svg -FocusWord "GirlsFashion" 