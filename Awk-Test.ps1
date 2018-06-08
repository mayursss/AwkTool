   $FileName = 'C:\temp\test.txt' ## create this file first for testing
    $data= Get-Content $FileName
    $output1 =""
    # $action = 'print'
    # $action = 'print $0'
    # $action = 'print $1'
    # $action = 'print $2'
    # $action = 'print $2,$3'
    # $action = 'print $1,$2,$3'
    # $action = 'print $5,$6,$7'
    # $action = 'print $5,$9,$1'
    # $action = 'print $5,$10,$11' ## will show only value for $5
    # $action = 'print $5,"\t",$2'   ## will "\t" does not work
    # $expression = $action -match '(\/\w+\/|\/\w+\s+\/|\/\s+\w+\s+\/)'
    
    $action   = $action -replace ',',' ' -split '\s+' ## replace all $ or , to blankspace ' '
    $command  = "$($action -match 'print')"
    $argument = $action -match '\$\d' -replace '\$',''
    #$argument = $argument -replace '\$','' -split '\s+'
    if ($command -eq 'print'){
        if($argument -eq 0 -or $argument.Length -eq 0){
            $data
        }
        Elseif($argument.Length -eq 1){
            foreach ($item in $data){
                -join $(($item -split '\s+')[$argument[0]],"`t")
                }
            }
        Else{
            #Write-Error "Argument not valid"
        } 
    }
    if ($argument.Length -ge 2){
        foreach ($item in $data){
            $datatojoin =""
            for($arg=0; $arg -lt $argument.Length; $arg++){
                $datatojoin += -join "$(($item -split '\s+')[$argument[$arg]])`t"
            }            
           $output1 += "$datatojoin`n"
        }   
        $output1     
    }
