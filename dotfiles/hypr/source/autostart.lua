hl.on("hyprland.start", function()
    hl.exec_cmd("uwsm app -- polkit-gnome-authentication-agent-1")
    hl.exec_cmd("docker stop $(docker ps -q)")
    hl.exec_cmd("waylandar-widget")
  end)
  
  hl.exec_cmd("uwsm app -- swayosd-server")
