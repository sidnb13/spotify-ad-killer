# spotify-ad-killer

A simple and legal way to circumvent Spotify ads on its desktop app. **MacOS only.**

## How it works

A executable shell script runs in an infinite loop. It runs an embedded AppleScript, which in the case Spotify is running, checks if the current track is less than 30 seconds in duration or the name of the track is "Advertisement." If both of these conditions are true, the AppleScript quits Spotify and restarts it.

## Setup

Run the following commands on your `.bash_profile`, `.bashrc`, or `.zshrc` config file (examples below use `.zshrc`) and replace the variable value with your path to this folder. This also adds this folder to your
`$PATH` environment variable so the `spotikill` script can be executed from anywhere simply by typing `spotikill` in the terminal.

```sh
sudo echo "export SPOTIKILL_PATH=/absolute/path/to/folder" >> ~/.zshrc
echo "export PATH=\"$SPOTIKILL_PATH:$PATH\"" >> ~/.zshrc
```

Alternatively, you can append the export commands within quotations to the config file manually by opening it in a text editor with root permissions: `sudo editor_name ~/.zshrc`.

## Running constantly in the background

You can make the script run even without an active terminal window using the unix command `nohup`; it only stops when the computer is shut down:

```sh
nohup spotikill &
```

To terminate this process, run the following command which gives an output:

```sh
ps aux | grep spotikill

# ------OUTPUT------- (may vary, look for the exit code of spotikill only)

# sidbaskaran      11890   0.5  0.0  4291544   1208 s000  SN    9:12AM   0:00.03 /bin/bash /Users/sidbaskaran/Desktop/utility-scripts/spotify-ad-killer/spotikill
# sidbaskaran      11977   0.0  0.0  4268440    636 s000  R+    9:12AM   0:00.00 grep spotikill
```

In this case, since the exit code for our script is 11890, kill the process:

```sh
kill 11890
```