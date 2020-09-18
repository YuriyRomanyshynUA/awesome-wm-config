local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")


local taglist_buttons = gears.table.join(

  awful.button({}, 1, function(t)
    t:view_only()
  end),
  
  awful.button({modkey}, 1, function(t)
    if client.focus then 
        client.focus:move_to_tag(t) 
    end
  end),

  awful.button({}, 3, awful.tag.viewtoggle),

  awful.button({modkey}, 3, function(t)
    if client.focus then 
        client.focus:toggle_tag(t) 
    end
  end),

  awful.button({}, 4, function(t)
      awful.tag.viewnext(t.screen)
  end),

  awful.button({}, 5, function(t)
      awful.tag.viewprev(t.screen)
  end)
)

function create(screen) 
    
    screen.taglist = awful.widget.taglist {
        screen  = screen,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        widget_template = {
            {
                {
                    id = 'text_role',
                    align = "center",
                    valign = "center",
                    widget = wibox.widget.textbox
                },
                top = 5,
                bottom = 5,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background,
        }
    }

    screen.leftwibox = awful.wibar {
        position = "left", 
        screen   = screen,
        width    = beautiful.taglist_wibar_width,
    }

    screen.systray = wibox.widget.systray()
    screen.systray:set_horizontal(true)

    screen.leftwibox:setup {
        layout = wibox.layout.align.vertical,
        {
            screen.taglist,
            top = beautiful.taglist_margin_top,
            widget = wibox.container.margin
        },
        {
            {
                screen.systray,
                bottom = beautiful.taglist_margin_bottom,
                widget = wibox.container.margin
            },
            valign = "bottom",
            widget = wibox.container.place
        }
    }
end

return create