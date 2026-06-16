#!/bin/bash

ICON_LOW="/usr/share/icons/Adwaita/symbolic/status/battery-caution-symbolic.svg"
ICON_CRITICAL="/usr/share/icons/Adwaita/symbolic/status/battery-level-0-symbolic.svg"
ICON_FULL="/home/punisher/Downloads/batman.png" 

SOUND_LOW="/usr/share/sounds/freedesktop/stereo/dialog-warning.oga"
SOUND_CRITICAL="/usr/share/sounds/freedesktop/stereo/dialog-warning.oga"
SOUND_FULL="/usr/share/sounds/freedesktop/stereo/complete.oga"

STATE_FILE="/tmp/battery_monitor_state"

while true; do
    BATTERY_PATH=$(ls /sys/class/power_supply/ | grep BAT | head -n 1)
    STATUS=$(cat /sys/class/power_supply/$BATTERY_PATH/status)
    CAPACITY=$(cat /sys/class/power_supply/$BATTERY_PATH/capacity)

    if [ -f "$STATE_FILE" ]; then
        LAST_STATE=$(cat "$STATE_FILE")
    else
        LAST_STATE="none"
    fi

    NEW_STATE="none"

    if [[ "$STATUS" == "Discharging" ]]; then
        if [[ "$CAPACITY" -le 5 ]]; then
            NEW_STATE="critical_5"
            if [[ "$LAST_STATE" != "$NEW_STATE" ]]; then
                notify-send "CRITICAL BATTERY: $CAPACITY%" "System will power off soon! 💀" -u critical -i "$ICON_CRITICAL"
                paplay "$SOUND_CRITICAL" # Use 'aplay' if you don't use PulseAudio/PipeWire
            fi
        elif [[ "$CAPACITY" -le 10 ]]; then
            NEW_STATE="critical_10"
            if [[ "$LAST_STATE" != "$NEW_STATE" ]]; then
                notify-send "Battery Low: $CAPACITY%" "Plug in the charger now." -u critical -i "$ICON_CRITICAL"
                paplay "$SOUND_LOW"
            fi
        elif [[ "$CAPACITY" -le 20 ]]; then
            NEW_STATE="low_20"
            if [[ "$LAST_STATE" != "$NEW_STATE" ]]; then
                notify-send "Battery Alert: $CAPACITY%" "Getting low..." -u normal -i "$ICON_LOW"
                paplay "$SOUND_LOW"
            fi
        fi

    elif [[ "$STATUS" == "Charging" || "$STATUS" == "Full" ]]; then
        if [[ "$CAPACITY" -ge 80 && "$CAPACITY" -lt 100 ]]; then
            # Only notify once when it hits 80 range if you want to preserve battery health
            NEW_STATE="charged_80"
            if [[ "$LAST_STATE" != "charged_80" && "$LAST_STATE" != "charged_100" ]]; then
                 notify-send "Battery at 80%" "Healthy threshold reached. 🔋" -i "$ICON_FULL"
                 paplay "$SOUND_FULL"
            fi
        elif [[ "$CAPACITY" -eq 100 ]]; then
            NEW_STATE="charged_100"
            if [[ "$LAST_STATE" != "$NEW_STATE" ]]; then
                notify-send "Fully Charged" "Battery is at 100%. Unleash the power. 🦇" -i "$ICON_FULL"
                paplay "$SOUND_FULL"
            fi
        else
            # Reset state if it's charging but not at a threshold yet (e.g. 50%)
            NEW_STATE="charging"
        fi
    fi

    # Update state
    echo "$NEW_STATE" > "$STATE_FILE"

    # Check every 60 seconds
    sleep 60
done
