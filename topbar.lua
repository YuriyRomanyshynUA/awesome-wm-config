-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
--
local brightness_widget = require("widgets.brightness")
local pulse = require("widgets.pulseaudio_widget")
local power = require("widgets.power_widget")


local tasklist_buttons = gears.table.join(
  
    awful.button({}, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal("request::activate", "tasklist", {raise = true})
        end
    end),

    awful.button({}, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),

    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
    end),

    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end)
)


function create(screen)
    
    local style = {
        shape_border_width = 3,
        shape_border_color = '#777777'
    }
    
    local layout = {
        spacing = beautiful.taskslist_spacing,
        layout  = wibox.layout.fixed.horizontal
    }
    
    local icon = {
        {
            id = 'icon_role',
            widget = wibox.widget.imagebox
        },
        margins = beautiful.taskslist_icon_margin,
        widget = wibox.container.margin
    }
    
    local text = {
        id = 'text_role',
        widget = wibox.widget.textbox
    }
    
    local text_box = {
        {
            icon,
            text,
            layout = wibox.layout.fixed.horizontal,
        },
        forced_width = beautiful.taskslist_tab_width,
        id = 'background_role',
        widget = wibox.container.background,
    }
    
    local underscore = {
        wibox.widget.base.make_widget(),
        forced_height = beautiful.taskslist_underscore_width,
        bg = beautiful.fg_normal,
        id = 'background_role',
        widget = wibox.container.background
    }

    screen.tasklist = awful.widget.tasklist {
        screen   = screen,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = tasklist_buttons,
        style    = style,
        layout   = layout,
        widget_template = {
            nil,
            text_box,
            underscore,
            layout = wibox.layout.align.vertical,
        }
    }
    
    keyboardlayout = awful.widget.keyboardlayout()
    textclock = wibox.widget.textclock()
    
    screen.layoutbox = awful.widget.layoutbox(screen)
    screen.layoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc( 1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc( 1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)
    ))

    screen.topwibox = awful.wibar {position = "top", screen = screen}

    screen.topwibox:setup {
        {
            screen.layoutbox,
            left  = 5,
            right = 5, 
            widget = wibox.container.margin,
        },
        {
            screen.tasklist,
            left   = 5,
            widget = wibox.container.margin,
        },
        {
            brightness_widget(),
            pulse,
            power,
            keyboardlayout,
            textclock,
            layout = wibox.layout.fixed.horizontal
        },
        layout = wibox.layout.align.horizontal
    }
end


return create