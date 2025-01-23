{ ... }:
let
  icon = icon: "<span font='12' font-family='JetBrainsMono' rise='-1000' letter-spacing='1024'>${icon}</span>";
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 34;
        spacing = 12;

        modules-left = [
          "network"
          # "hyprland/window"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "pulseaudio"
          "group/hardware"
          "clock"
        ];


        "group/hardware" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "memory"
            "disk"
          ];

          name = "hardware";
        };

        pulseaudio = {
          format= "{icon}{volume}%";
          format-bluetooth= "{volume}%{icon}";
          format-icons= {
            "alsa_output.pci-0000_00_1f.3.analog-stereo"= icon " ";
            "alsa_output.pci-0000_00_1f.3.analog-stereo-muted"= icon " ";
            headphone= icon " ";
            hands-free= icon "󱡒 ";
            hands-free-muted = icon "󱡑 ";
            headset= icon "󰋎 ";
            headset-muted= icon "󰋐 ";
            phone= icon " ";
            phone-muted= icon " ";
            portable= icon " ";
            car= icon " ";
            default= ["${icon " "}" "${icon " "}"];
          };
          scroll-step= 1;
          on-click= "uwsm app -- pavucontrol";
          ignored-sinks= ["Easy Effects Sink"];
        };

        cpu = {
          format = "{icon}{usage}%";
          format-icons= ["${icon " " }"];
        };
        
        memory = {
          format = "${icon " "}{percentage}%";
        };

        disk = {
          format = "${icon " "}{percentage_used}%";
        };

        network = {
          format = "{ifname}";
          format-ethernet = icon "󰍹 ";
          format-wifi = icon " ";
          format-disconnected = icon "󱞐 ";
          tooltip-format-ethernet = ''
            {ifname}: {ipaddr}/{cidr}
            ${icon "󰅧 "}{bandwidthUpBytes}
            ${icon "󰅢 "}{bandwidthDownBytes}'';

          tooltip-format-wifi = ''
            {essid}: {ipaddr}/{cidr}
            Strength: {signalStrength}%
            ${icon "󰅧 "}{bandwidthUpBytes}
            ${icon "󰅢 "}{bandwidthDownBytes}'';

          tooltip-format-disconnected = "Disconnected";
        };

        "clock" = {
          interval = 60;
          tooltip = true;
          format = "${icon " "}{:%H:%M}";
          "tooltip-format"= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          calendar = {
            mode ="year";
            mode-mon-col=3;
            weeks-pos="right";
            on-scroll=1;
            format={
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
            actions=  {
              on-click-right= "mode";
              on-scroll-up= "shift_up";
              on-scroll-down= "shift_down";
            };
          };
        };

      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font Mono";
        font-size: 12px;
        margin: 0 4px;
        background-color: transparent;
        color: #eee;
      }

      #hardware {
        background-color: rgba(255,255,255,0.10);
      }

      tooltip {
        background-color: rgba(0,0,0,0.9)
      }
    '';
  };
}
