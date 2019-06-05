-- Example Plugin
-- by QSC
-- June 2019

-- These 'include' comments are used by the compiler to build the .qplug file
-- DO NOT REMOVE THEM
--[[ #include "info.lua" ]]

-- Once you've drawn your plugin in Designer, you can determine what colors you use a lot. Save yourself some time by putting them in a table, and then simply calling them later. 
local Colors = { 
	White = {255,255,255},
	Black = {0,0,0},
	Red = {255,0,0},
	Green = {0,255,0},
}

function GetColor(props)
  return { 102, 102, 102 }
end

function GetPrettyName(props)
  return "Example Plugin " .. PluginInfo.Version
end

local pagenames = {"Mixer","Video Switcher"}

function GetPages(props)
  pages = {}

  --[[ #include "pages.lua" ]]

  return pages
end

-- We can let users determine some of the plugin properties by exposing them here
-- While this function can be very useful, it is completely optional and not always needed.
-- If no Properties are set here, only the position and fill properties of your plugin will show in the Properties pane
-- Each property can have:
-- Name = string (text displayed next to property)
-- Type = string, integer, double, boolean, enum
-- Value = default value for property
-- Enum type has Choices i.e. Choices = { list of choice strings } which displays in a combobox
-- Integer and Double types have a Min (lowest extent) and Max (highest extent) value that needs to be defined
function GetProperties()
  props = {}

  --[[ #include "properties.lua" ]]

  return props
end

-- The below function is optional (like GetProperties() is), but it can allow further customization of what users can and can't do with your plugin.
-- In this example, when Model 1 is selected in the properties pane, the ability to modify some of the properties will be hidden, only allowing customization with Model 2
function RectifyProperties(props)
	local m = props["Model"].Value
	props["Inputs"].IsHidden = m == "Model 1" -- This logic essentially sets the IsHidden property to true when m is equivalent to Model 1
	props["Button Styles"].IsHidden = m == "Model 1"
	return props
end

-- The below function is where you will populate the controls for your plugin.
-- If you've written some of the Runtime code already, simply use the control names you populated in Text Controller/Control Script, and use their Properties to inform the values here
-- ControlType can be Button, Knob, Indicator or Text
-- ButtonType ( ControlType == Button ) can be Momentary, Toggle, Trigger, 'On', 'Off', or Custom. Custom is for a String type button
-- IndicatorType ( ControlType == Indicator ) can be Led, Meter, Text, or Status
-- ControlUnit ( ControlType == Knob ) can be Hz, Float, Integer, Pan, Percent, Position, or Seconds
-- Controls with a ControlUnit will need a Min and Max value specified
function GetControls(props)
  local ch_count = props["Inputs"].Value -- Setting this property to a variable will save us typing time below, setting the count of controls to the number of inputs the user has defined
  ctrls = {}

  --[[ #include "controls.lua" ]]

  return ctrls
end

-- The below function is where you will define graphical elements, be they controls or otherwise
-- The layout table is where you'll define things like size and position for your controls
-- The graphics table is wehre you'll get more specific and define things like colors and text properties for your controls
-- You can also define non-control elements (i.e. Headers, GroupBoxes, Labels, etc). You would also specify any logos here
function GetControlLayout(props)
  layout   = {}
  graphics = {}

  --[[ #include "layout.lua" ]]

  return layout, graphics
end

--Start event based logic
if Controls then

  --[[ #include "runtime.lua" ]]
  
end
