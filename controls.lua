-- Add comments like the one below to make it easier to find things in your code
-- If anyone ever has to search through or modify your code, they will thank you for this!
-- Mixer Page Controls
-- EQ Controls
table.insert(ctrls,
  {
    Name = "EQBypass", -- Make your control names as obvious and simple as possible. You can always set shorter variables for them in your runtime code
    ControlType = "Button",
    ButtonType = "Toggle",
    Count = ch_count, -- Here we call the above value set in the Properties pane by the user to determine how many of these controls we need. 
    UserPin = true, -- UserPin allows pin choice to be added to the Control Pins section of the Properties. Setting UserPin=false while specifying PinStyle means the pin is present with no option to remove it
    PinStyle = "Both",-- Omitting this parameter and UserPin will prevent a pin and will not add it to the Control Pins list
  }
)
table.insert(ctrls,
  {
    Name = "EQFrequency",
    ControlType = "Knob",
    ControlUnit = "Hz",
    Min = 10, -- On controls with ControlUnit, set a Min and Max value
    Max = 20000,
    Count = ch_count,
    UserPin = true,
    PinStyle = "Both",
  }
)
table.insert(ctrls,
  {
    Name = "EQGain",
    ControlType = "Knob",
    ControlUnit = "dB",
    Min = -100,
    Max = 20,
    Count = ch_count,
    UserPin = true,
    PinStyle = "Both",
  }
)
table.insert(ctrls,
  {
    Name = "EQBandwidth",
    ControlType = "Knob",
    ControlUnit = "Float", -- Since we want a Min/Max with decimal points, we need to specify the ControlUnit as Float instead of Integer
    Min = 0.010,
    Max = 3.00,
    Count = ch_count,
    UserPin = true,
    PinStyle = "Both",
  }
)
table.insert(ctrls,
 {
    Name = "EQType",
    ControlType = "Text",
    Count = ch_count,
    UserPin = true,
    PinStyle = "Both",
  } 
)
-- Mixer Controls
table.insert(ctrls,
 {
    Name = "InputGain",
    ControlType = "Knob",
    ControlUnit = "dB",
    Min = -20,
    Max = 10,
    Count = ch_count, 
    PinStyle = "Both",
    UserPin = true
  }
)
table.insert(ctrls,
  {
    Name = "Mute",
    ControlType = "Button",
    ButtonType = "Toggle",
    Count = ch_count, 
    PinStyle = "Both",
    UserPin = true 
  }
)
table.insert(ctrls,
  {
    Name = "Solo",
    ControlType = "Button",
    ButtonType = "Toggle",
    Count = ch_count,
    PinStyle = "Both",
    UserPin = true
  }
)
table.insert(ctrls,
 {
    Name = "ChannelName",
    ControlType = "Text",
    Count = ch_count, 
    UserPin = true,
    PinStyle = "Both",
  }
)
table.insert(ctrls,
 {
    Name = "Clip",
    ControlType = "Indicator",
    IndicatorType = "LED",
    Count = ch_count,
    PinStyle = "Both",
    UserPin = true,
  }
)
-- Video Switcher Page Controls
table.insert(ctrls,
  {
    Name = "Status",
    ControlType = "Indicator",
    IndicatorType = "Status",
    Count = 1
  }
)
table.insert(ctrls,
  {
    Name = "Connect",
    ControlType = "Button",
    ButtonType = "Toggle",
    UserPin = true,
    PinStyle = "Both",
    Count = 1
  }
)
table.insert(ctrls,
  {
    Name = "Port",
    ControlType = "Knob",
    ControlUnit = "Integer",
    Min = 1,
    Max = 65535,
    Count = 1,
  }
)
-- Since we are populating these controls for two different displays, we can do it quickly with a 'for' loop
-- This is good practice for controls that have multiple congruent, or even similar, property values, and it makes your code more extensible.
-- Keep in mind that the use of variable 'j' here is completely arbitrary and you can use variables more intuitive to you when writing your plugin i.e. for control_num=1,2 do
for j=1,2 do
  table.insert(ctls,
    {
      Name = string.format("Display %i Power",j),
      ControlType = "Button",
      ButtonType = "Toggle",
      UserPin = true,
      PinStyle = "Both",
      Count = 1,
    })
  table.insert(ctls,
    {
    Name = string.format("Image %i Red",j),
    ControlType = "Knob",
    ControlUnit = "Integer",
    Min = 0,
    Max = 255,
    UserPin = true,
    PinStyle = "Both",
    Count = 1,
  })
  table.insert(ctls,
    {
    Name = string.format("Image %i Green",j),
    ControlType = "Knob",
    ControlUnit = "Integer",
    Min = 0,
    Max = 255,
    UserPin = true,
    PinStyle = "Both",
    Count = 1,
  })
  table.insert(ctls,
    {
    Name = string.format("Image %i Blue",j),
    ControlType = "Knob",
    ControlUnit = "Integer",
    Min = 0,
    Max = 255,
    UserPin = true,
    PinStyle = "Both",
    Count = 1,
  })
  table.insert(ctls,
  {
    Name = string.format("Display %i RGB Save",j),
    ControlType = "Button",
    ButtonType = "Trigger",
    UserPin = true,
    PinStyle = "Both",
    Count = 1
  })
  table.insert(ctls,
  {
    Name = string.format("Display %i RGB Recall",j),
    ControlType = "Button",
    ButtonType = "Trigger",
    UserPin = true,
    PinStyle = "Both",
    Count = 1
  })
  -- I've nested a 'for' within another here to quickly populate the same inputs for two different outputs
  -- Once again, the use of 'i' as my iterator is completely arbitrary. You could use something like 'inputs' if that is more intuitive for you
  for i=1,6 do
    table.insert(ctls,
    {
      Name = string.format("Input %i Output %i",i,j),
      ControlType = "Button",
      ButtonType = "Trigger",
      UserPin = true,
      PinStyle = "Both",
      Count = 1
    })
  end
end

