-- TEST PLUGIN
-- by TEST
-- April 2019

--[[ #include "info.lua" ]]

function GetColor(props)
  return { 102, 102, 102 }
end

function GetPrettyName(props)
  return "Compile Test"
end

function GetProperties() -- No properties needed
  props = {}
  return props
end

function GetControls(props)
  --[[ #include "controls.lua" ]]
end

function GetControlLayout(props)

end



--[[ Initialization ]]--------------------------------------------------------------
Status( "Discovering", "INITIALIZING" )
StartInit()
