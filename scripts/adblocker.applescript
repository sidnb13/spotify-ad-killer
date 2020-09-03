set masterpath to system attribute "SPOTIKILL_PATH"
set lpt to ""&masterpath&"/track.log"

tell application "Spotify"

    set c to the current track

    set tS to round ((duration of c / 1000) mod 60) rounding down

    set bfPath to ""&masterpath&"/blocklist.txt"
    set lns to paragraphs of (read POSIX file bfPath)

    set blocklist to {}

    repeat with ln in lns
        copy ln as string to the end of blocklist 
    end repeat

    set isAd to blocklist contains the name of c as string

    if isAd then

        do shell script "echo $(date): Detected advertisement>> "&lpt&""

        tell application "Spotify" to quit
        delay 2
        tell application "Spotify" to activate
        delay 2
        tell application "System Events" to set visible of application process "Spotify" to false

        tell application "Spotify" to play
        
        do shell script "echo $(date): Skipped advertisement>> "&lpt&""
        do shell script "echo $(date): Current track is "&name of current track&">> "&lpt&""
    
    end if

end tell
