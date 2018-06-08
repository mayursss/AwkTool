    $FileName = 'C:\temp\test.txt'
    $data= Get-Content $FileName
    $output1 =""
    # $action = '/ms458j/ print'
    # $action = '/ms458j/ print $0'
    # $action = '/ms458j/ print $1'
    # $action = '/ms458j/ print $2'
    # $action = '/ms458j/ print $2,$3'
    # $action = '/ms458j/ print $1,$2,$3'
     $action = '/ms458j/ print $5,$6,$7'
    # $action = '/ms458j/ print $5,$9,$1'
    # $action = '/ms458j/ print $5,$10,$11' ## will show only value for $5
    #$action = '/ms458j/ print $5,"\t",$2'   ## will "\t" does not work
    #$expression = $action -match '(\/\w+\/|\/\w+\s+\/|\/\s+\w+\s+\/)'
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
   
                 
    # $D = foreach ($line in $data){
    # $info = $line -split "\s+"
    # $hash = [ordered]@{}
    #     for ($i=0;$i -lt $($info.Length+1);$i++) {
    #     $hash.add("$i",$info[$i])
    #     }
    # [pscustomobject]$hash

    # }
    # $D.0;$D.1;
