{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    extraConfig = ''
            # macos specific
            macos_titlebar_color #191723

            # fonts
            font_family SF Mono

            # tab bar
            tab_bar_style powerline
            tab_powerline_style slanted
            tab_title_template "{title}"

            # padding
            window_padding_width 0 15 0 15

            # Seti-UI + Custom
            symbol_map U+E5FA-U+E62B Hack Nerd Font
            # Devicons
            symbol_map U+E700-U+E7C5 Hack Nerd Font
            # Font Awesome
            symbol_map U+F000-U+F2E0 Hack Nerd Font
            # Font Awesome Extension
            symbol_map U+E200-U+E2A9 Hack Nerd Font
            # Material Design Icons
            symbol_map U+F500-U+FD46 Hack Nerd Font
            # Weather
            symbol_map U+E300-U+E3EB Hack Nerd Font
            # Octicons
            symbol_map U+F400-U+F4A8,U+2665,U+26A1,U+F27C Hack Nerd Font
            # Powerline Extra Hack
            symbol_map U+E0A3,U+E0B4-U+E0C8,U+E0CC-U+E0D2,U+E0D4 Hack Nerd Font
            # IEC Power Hack
            symbol_map U+23FB-U+23FE,U+2b58 Hack Nerd Font
            # Font Logos
            symbol_map U+F300-U+F313 Hack Nerd Font
            # Pomicons
            symbol_map U+E000-U+E00D Hack Nerd Font

            ## Layouts ##
            enabled_layouts tall:bias=70;full_size=1;

            ## Key Maps ##
            map cmd+l next_tab
            map cmd+h previous_tab
            map cmd+t new_tab_with_cwd

            ## Custom Logic ##
            ## Open new tabs and windows with the same cwd ##
            map kitty_mod+t new_tab_with_cwd
            map kitty_mod+enter new_window_with_cwd

            ## Window Management ##
            remember_window_size yes
            initial_window_width 100
            map ctrl+shift+h previous_window
            map ctrl+shift+l next_window
            map ctrl+n launch --location=vsplit --cwd current

            ## Scroll back ##
            scrollback_lines 1000000

            ## Colors ##
      foreground               #e0def4
      background               #191724
      selection_foreground     #e0def4
      selection_background     #403d52

      cursor                   #524f67
      cursor_text_color        #e0def4

      url_color                #c4a7e7

      active_tab_foreground    #e0def4
      active_tab_background    #26233a
      inactive_tab_foreground  #6e6a86
      inactive_tab_background  #191724

      active_border_color      #31748f
      inactive_border_color    #403d52

      # black
      color0   #26233a
      color8   #6e6a86

      # red
      color1   #eb6f92
      color9   #eb6f92

      # green
      color2   #31748f
      color10  #31748f

      # yellow
      color3   #f6c177
      color11  #f6c177

      # blue
      color4   #9ccfd8
      color12  #9ccfd8

      # magenta
      color5   #c4a7e7
      color13  #c4a7e7

      # cyan
      color6   #ebbcba
      color14  #ebbcba

      # white
      color7   #e0def4
      color15  #e0def4
    '';
  };
}
