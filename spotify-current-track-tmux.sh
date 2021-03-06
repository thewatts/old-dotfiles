#!/usr/bin/env sh

NOW_PLAYING=$(osascript <<EOF
  if app_is_running("Spotify") then
    tell application "Spotify"
      if player state is playing then
        set track_name to name of current track
        set artist_name to artist of current track
        if artist_name > 0
          # If the track has an artist set and is therefore most likely a song rather than an advert
          return "#[fg=colour247] ♫ " & artist_name & " - " & track_name & "#[fg=default]"
        else
          # If the track doesn't have an artist set and is therefore most likely an advert rather than a song
          return "#[fg=colour247] ♫ ~" & track_name & "#[fg=default]"
        end if
      else
        return "#[fg=colour240] ♫ - paused #[fg=default]"
      end if
    end tell
  end if
  on app_is_running(app_name)
    tell app "System Events" to (name of processes) contains app_name
  end app_is_running
EOF)
echo $NOW_PLAYING
