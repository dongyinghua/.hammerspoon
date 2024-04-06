local hotkey = require "hs.hotkey"
local mash = {"alt"}
local speech = require 'hs.speech'

-- Init.
hs.window.animationDuration = 0 -- don't waste time on animation when resize window

-- https://github.com/manateelazycat/hammerspoon-config
-- Maximize window when specify application started.
local maximizeApps = {
"/opt/homebrew/Cellar/emacs-plus@29/29.3/Emacs.app"
}

local windowCreateFilter = hs.window.filter.new():setDefaultFilter()
windowCreateFilter:subscribe(
hs.window.filter.windowCreated,
function (win, ttl, last)
for index, value in ipairs(maximizeApps) do
if win:application():path() == value then
win:maximize()
return true
end
end
end)