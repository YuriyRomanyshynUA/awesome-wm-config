local gears = require("gears")
local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")


modkey = "Mod4"


local globalkeys = gears.table.join(

    awful.key(
        { modkey, }, "s",
        hotkeys_popup.show_help,
        {description="show help", group="awesome"}
    ),

  -- awful.key(
  --    { modkey, }, "Left",
  --    awful.tag.viewprev,
  --    {description = "view previous", group = "tag"}
  -- ),

  -- awful.key(
  --    { modkey, }, "Tab",
  --    awful.tag.viewnext,
  --    {description = "view next", group = "tag"}
  -- ),

  -- awful.key(
  --    { modkey, }, "Escape",
  --    awful.tag.history.restore,
  --    {description = "go back", group = "tag"}
  -- ),

    awful.key(
        { modkey, }, "l",
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),

    awful.key(
        { modkey, }, "j",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    awful.key(
        { modkey, }, "Right",
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),

    awful.key(
        { modkey, }, "Left",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

  -- awful.key(
  --    { modkey, }, "w",
  --    function ()
  -- 	 mymainmenu:show()
  --    end,
  --    {description = "show main menu", group = "awesome"}
  -- ),

  -- Layout manipulation
    awful.key(
        { modkey, "Shift" }, "l",
        function ()
            awful.client.swap.byidx(  1)
        end,
        {description = "swap with next client by index", group = "client"}
    ),

    awful.key(
        { modkey, "Shift"}, "j",
        function ()
            awful.client.swap.byidx( -1)
        end,
        {description = "swap with previous client by index", group = "client"}
    ),

    awful.key(
        { modkey, "Control" }, "j",
        function ()
            awful.screen.focus_relative( 1)
        end,
        {description = "focus the next screen", group = "screen"}
    ),

    awful.key(
        { modkey, "Control" }, "k",
        function ()
            awful.screen.focus_relative(-1)
        end,
        {description = "focus the previous screen", group = "screen"}
    ),

    awful.key(
        { }, "XF86AudioRaiseVolume",
        function ()
            awful.util.spawn_with_shell("pactl set-sink-volume 1 +5%")
        end,
        {description = "inc volume", group = "volume"}
    ),

    awful.key(
        { }, "XF86AudioLowerVolume",
        function ()
            awful.util.spawn_with_shell("pactl set-sink-volume 1 -5%")
        end,
        {description = "dec volume", group = "volume"}
    ),

    awful.key(
        { }, "XF86AudioMute",
        function ()
            awful.util.spawn_with_shell("pactl set-sink-mute 1 toggle")
        end,
        {description = "mute volume", group = "volume"}
    ),

    awful.key(
        { }, "XF86MonBrightnessUp",
        function ()
            awful.util.spawn_with_shell("light -A 5")
        end,
        {description = "inc brightness", group = "brightnes"}
    ),

    awful.key(
        { }, "XF86MonBrightnessDown",
        function ()
            awful.util.spawn_with_shell("light -U 5")
        end,
        {description = "dec brightness", group = "brightness"}
    ),

  -- awful.key(
  --    { modkey, }, "u",
  --    awful.client.urgent.jumpto,
  --    {description = "jump to urgent client", group = "client"}
  -- ),

  -- awful.key(
  --    { modkey,}, "Tab",
  --    function ()
  -- 	 awful.client.focus.history.previous()
  -- 	 if client.focus then
  -- 	    client.focus:raise()
  -- 	 end
  --    end,
  --    {description = "go back", group = "client"}
  -- ),

    -- Standard program
    awful.key(
        { modkey, },  "Return",
        function ()
            awful.spawn(terminal)
        end,
        {description = "open a terminal", group = "launcher"}
    ),

    -- ===== own programs startup =====
    awful.key(
        { modkey, }, "z",
        function ()
            awful.util.spawn_with_shell("$HOME/.config/awesome/shell/touchpad")
        end,
        {description = "lock touchpad", group = "launcher"}
    ),
  
    awful.key(
        { modkey, }, "b",
        function ()
            awful.spawn("firefox")
        end,
        {description = "open a browser", group = "launcher"}
    ),

    awful.key(
        { modkey, }, "d",
        function ()
            awful.spawn("rofi -show run")
        end,
        {description = "show rofi run menu", group = "launcher"}
    ),

    awful.key(
        { modkey, }, "e",
        function ()
            awful.spawn("emacs")
        end,
        {description = "open the emacs", group = "launcher"}
    ),

    awful.key(
        { modkey, "Shift" }, "e",
        function ()
            awful.spawn("urxvt -e dvtm command nnn nnn -m ^b")
        end,
        {description = "open the nnn file manager", group = "launcher"}
    ),
    
    -- =====
    awful.key(
        { modkey, "Control" }, "r",
        awesome.restart,
        {description = "reload awesome", group = "awesome"}
    ),

    awful.key(
        { modkey, "Shift" }, "q",
        awesome.quit,
        {description = "quit awesome", group = "awesome"}
    ),

    awful.key(
        { modkey, }, "i",
        function ()
            awful.tag.incmwfact( 0.05)
        end,
        {description = "increase master width factor", group = "layout"}
    ),

    awful.key(
        { modkey,}, "k",
        function ()
            awful.tag.incmwfact(-0.05)
        end,
        {description = "decrease master width factor", group = "layout"}
    ),

    awful.key(
        { modkey, }, "o",
        function ()
            awful.tag.incnmaster(1, nil, true)
        end,
        {description = "increase the number of master clients", group = "layout"}
    ),

    awful.key(
        { modkey, }, "u",
        function ()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {description = "decrease the number of master clients", group = "layout"}
    ),

  -- awful.key(
  --    { modkey, "Control" }, "h",
  --    function () awful.tag.incncol( 1, nil, true) end,
  --    {description = "increase the number of columns", group = "layout"}
  -- ),

  -- awful.key(
  --    { modkey, "Control" }, "l",
  --    function () awful.tag.incncol(-1, nil, true) end,
  --    {description = "decrease the number of columns", group = "layout"}
  -- ),

    awful.key(
        { modkey, }, "Tab",
        function ()
            awful.layout.inc(1)
        end,
        {description = "select next", group = "layout"}
    ),

  -- awful.key(
  --    { modkey, "Shift"}, "space",
  --    function () awful.layout.inc(-1) end,
  --    {description = "select previous", group = "layout"}
  -- ),

    awful.key(
        { modkey, "Shift" }, "n",
        function ()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal("request::activate", "key.unminimize", {raise = true})
            end
        end,
        {description = "restore minimized", group = "client"}
    )

  -- Prompt
  -- awful.key(
  --    { modkey }, "r",
  --    function ()
  -- 	 awful.screen.focused().mypromptbox:run() end,
  --    {description = "run prompt", group = "launcher"}
  -- )

  -- awful.key(
  --    { modkey }, "x",
  --    function ()
  -- 	 awful.prompt.run {
  -- 	    prompt       = "Run Lua code: ",
  -- 	    textbox      = awful.screen.focused().mypromptbox.widget,
  -- 	    exe_callback = awful.util.eval,
  -- 	    history_path = awful.util.get_cache_dir() .. "/history_eval"
  -- 	 }
  --    end,
  --    {description = "lua execute prompt", group = "awesome"}
  -- )

  -- Menubar
  -- awful.key(
  --    { modkey }, "p",
  --    function() menubar.show() end,
  --    {description = "show the menubar", group = "launcher"}
  -- )
)



local clientkeys = gears.table.join(

    awful.key(
        { modkey, }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}
    ),

    awful.key(
        { modkey }, "q",
        function (c) c:kill() end,
        {description = "close", group = "client"}
    ),

    awful.key(
        { modkey, "Control" }, "space",
        awful.client.floating.toggle,
        {description = "toggle floating", group = "client"}
    ),

  -- awful.key(
  --    { modkey, "Control" }, "Return",
  --    function (c)
  -- 	 c:swap(awful.client.getmaster())
  --    end,
  --    {description = "move to master", group = "client"}
  -- ),

  -- awful.key(
  --    { modkey, }, "o",
  --    function (c) c:move_to_screen() end,
  --    {description = "move to screen", group = "client"}
  -- ),

    awful.key(
        { modkey, }, "t",
        function (c)
            c.ontop = not c.ontop
        end,
        {description = "toggle keep on top", group = "client"}
    ),

    awful.key(
        { modkey,}, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        {description = "(un)minimize", group = "client"}
    ),

    awful.key(
        { modkey, }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end,
        {description = "(un)maximize", group = "client"}
    )

  -- awful.key(
  --    { modkey, "Control" }, "m",
  --    function (c)
  -- 	 c.maximized_vertical = not c.maximized_vertical
  -- 	 c:raise()
  --    end,
  --    {description = "(un)maximize vertically", group = "client"}
  -- ),

  -- awful.key({ modkey, "Shift" }, "m",
  --    function (c)
  -- 	 c.maximized_horizontal = not c.maximized_horizontal
  -- 	 c:raise()
  --    end,
  --    {description = "(un)maximize horizontally", group = "client"}
  -- )
)


return {
    global = globalkeys,
    client = clientkeys
}