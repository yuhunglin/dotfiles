#!/usr/bin/env bash

# TODO: figure out why this might not be working

# Remove apps I don't use from the dock.
for shortcut_label in "Launchpad" "Contacts" "Mail" \
    "Siri" "Maps" "FaceTime" "iTunes" "iBooks" "Reminders" \
    "Photos" "Pages" "News" "TV" "Podcasts"; do
    dockutil --remove "${shortcut_label}" --allhomes --no-restart
done

# TODO; add google keep manualy
# Add new app shortcuts to the dock.
for app in "iTerm" "Google Chrome" "Slack" \
    "Spotify" "Activity Monitor" \
    "System Preferences"; do
    dockutil --find "${app}"
    if [ $? -ne 0 ]; then
        dockutil --add "/Applications/${app}.app" --after "Finder" --replacing "${app}" --no-restart
    fi
done
