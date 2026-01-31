#!/bin/bash

# Redirect logs to file AND standard output (so Portainer can see them too)
exec > >(tee -a /tmp/ekovya_startup.log) 2>&1

echo "Starting Ekovya Simulation..."

# Wait for UI (X11/VNC) to stabilize
sleep 5

# Check if SIM_PATH is set. If not, look in global environment.
if [ -z "$SIM_PATH" ]; then
    # Try to read container env vars if not inherited
    if [ -f /etc/environment ]; then . /etc/environment; fi
fi

# Set Final Path with a fallback default
TARGET_SIM="${SIM_PATH:-/apps/default_simulation.cfg}"

echo "Loading simulation: $TARGET_SIM"

# Launch the Application
java -jar /apps/jaamsim.jar "$TARGET_SIM"
