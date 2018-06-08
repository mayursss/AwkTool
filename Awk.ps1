function awk (
[string[]]$action,
#[Parameter(Mandatory)]       
$FileName,
$NR,
$FNR,
$NF,
$FS,
$OFS,
$ARGC,
$ARGV

)
{
    $data= Get-Content $FileName
    function printString (
        $opt1
        ){
            #$opt1
            #$opt2 = $Opt1.Split('$')[1]
            #Write-Host -ForegroundColor Yellow "Printing $opt1"
                foreach ($item in $data){
                ($item -split '\s+')[$opt1]

            }
        }
        
        $action = $action -replace '\$|,',' ' -split '\s+'
        $command = $action[0]
        $argument= @()
        $argument = $action -match '\d+'
        

    if($command -eq 'print' -and $argument -eq $null)
    {
        $data
    }
    else{
        printString $argument
    }
    
}
        


#awk '{print $1}' C:\temp\test.txt
#awk -FileName C:\temp\test.txt
#awk '{print}' C:\temp\test.txt
#awk '{print $1}' C:\temp\test.txt
#awk '{print $2}' C:\temp\test.txt
#awk '{print $3}' C:\temp\test.txt
#Get-Content -Path C:\temp\test.txt
#Get-Help awk
#awk -action 'print' -FileName 'C:\temp\test.txt'
awk -action 'print  $8' -FileName 'C:\temp\test.txt'
#awk -action 'print $1'
#awk -action 'print $1,$4'
