# MacAppIconSwitcher
 Switches yout Mac Application Icons
 
 ## TODO
 - Make it so that the names of the icons don't have to be exactly the same as the app
 - Fix an issue with system app icons

## Preparation
- Place AppIconInstaller.sh inside the folder with your app icons
- The names of the icons must be exactly the same as the app in this initial version
- Don't worry about the backup folder, if one doesn't exist, it will be created

## Running
1. Open terminal and run AppIconInstaller.sh 
    - If you are unsure how to run it type "cd " then drag folder containing AppIconInstaller.sh onto the terminal line, this will automatically input the path name.
    - Then once your directory has been changed, run ``` sh AppIconInstaller.sh```
2. Type in your password when prompted

## Reverting
- To undo the action and return the images to their originals, just move AppIconInstaller.sh into the backup folder and re-run the script
- FYI When rerun in the backup folder, it will create another backup folder with the icons that its replacing
