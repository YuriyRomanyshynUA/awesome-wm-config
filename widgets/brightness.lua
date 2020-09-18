local wibox = require("wibox")
local watch = require("awful.widget.watch")
local spawn = require("awful.spawn")
local theme = require("theme")


local PATH_TO_ICON = theme.brightness_icon
local GET_BRIGHTNESS_CMD = "light -G"   -- "xbacklight -get"
local INC_BRIGHTNESS_CMD = "light -A 5" -- "xbacklight -inc 5"
local DEC_BRIGHTNESS_CMD = "light -U 5" -- "xbacklight -dec 5"


local widget = {}


local function worker(args)

    local args = args or {}

    local get_brightness_cmd = args.get_brightness_cmd or GET_BRIGHTNESS_CMD
    local inc_brightness_cmd = args.inc_brightness_cmd or INC_BRIGHTNESS_CMD
    local dec_brightness_cmd = args.dec_brightness_cmd or DEC_BRIGHTNESS_CMD
    local path_to_icon = args.path_to_icon or PATH_TO_ICON

    local brightness_text = wibox.widget {
      font = theme.widgets_font,
      widget = wibox.widget.textbox
    }

    local brightness_icon = wibox.widget {
      image = PATH_TO_ICON,
      resize = true,
      widget = wibox.widget.imagebox,
    }

    widget = wibox.widget {
      {
        brightness_icon,
        {
          brightness_text,
          -- left = 3, right = 3,
          widget = wibox.container.margin
        },
        layout = wibox.layout.fixed.horizontal
      },
      left = 5, right = 5,
      widget = wibox.container.margin
    }


    local update_widget = function(widget, stdout, _, _, _)
        local brightness_level = tonumber(string.format("%.0f", stdout))
        widget:set_text(" " .. brightness_level .. "%")
    end,


    widget:connect_signal("button::press", function(_, _, _, button)
        if (button == 4) then
            spawn(inc_brightness_cmd, false)
        elseif (button == 5) then
            spawn(dec_brightness_cmd, false)
        end
    end)

    watch(get_brightness_cmd, 1, update_widget, brightness_text)

    return widget
end


return setmetatable(widget, {
    __call = function(_, ...) return worker(...) end
})
