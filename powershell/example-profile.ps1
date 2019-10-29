clear-host
#Start-SshAgent
#https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences#span-idtextformattingspanspan-idtextformattingspanspan-idtextformattingspantext-formatting


$GIT_WORKSPACE="~\Documents\gws"
function Write-BranchName () {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            # we're probably in detached HEAD state, so print the SHA
            $branch = git rev-parse --short HEAD
            Write-Host " ($branch)" -ForegroundColor "red"
        }
        else {
            # we're on an actual branch, so print it
            Write-Host " ($branch)" -ForegroundColor "blue"
        }
    } catch {
        # we'll end up here if we're in a newly initiated git repo
        Write-Host " (no branches yet)" -ForegroundColor "yellow"
    }
}

function prompt {

    $date = Get-Date -Format "yyyy/mm/dd HH:mm:ss K"
    $base = "$([char]27)[35m$ENV:COMPUTERNAME $([char]27)[37m$([char]27)[4m(PS)$([char]27)[24m "
    $path = "$($executionContext.SessionState.Path.CurrentLocation)"
    $userPrompt = "$([char]27)[36m[$date] $([char]27)[37m$('$' * ($nestedPromptLevel + 1)) "

    Write-Host "`n$base" -NoNewline

    if (Test-Path .git) {
        Write-Host $path -NoNewline -ForegroundColor "green"
        Write-BranchName
    }
    else {
        # we're not in a repo so don't bother displaying branch name/sha
        Write-Host $path -ForegroundColor "green"
    }

    return $userPrompt
}

function gws($project) {
    #param ([] $project)

    if ($project) {
        cd $GIT_WORKSPACE\$project
    }else {
        cd $GIT_WORKSPACE
        $blah = ls -path $GIT_WORKSPACE | select-object name | format-wide -column 4
        write-output "$([char]27)[96m" $blah
    }
}