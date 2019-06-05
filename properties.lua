table.insert(props,
  { -- Depending on the Model, there might be different pages or ctls exposed. The most common application being a change in channel count of a mixer of some sort.
    Name = "Model",
    Type = "enum",
    Choices = {"Model 1", "Model 2"},
    Value = "Model 1", -- This determines the 'default' value when the plugin is dragged into the design
  }
)
table.insert(props,
  { -- This dynamically changes the number of Input channels on the mixer depending on what the user inputs, which gives your plugin a lot of flexibility 
    Name = "Inputs",
    Type = "integer",
    Min = 1, -- Integer property types need a lowest extent (Min) and a highest extent (Max) value specified
    Max = 10,
    Value = 5, -- This is the default value when the plugin is dragged into the design
  }
)
table.insert(props,
  {
    Name = "Button Styles",
    Type = "enum",
    Choices = {"Gloss","Flat"},
    Value = "Gloss",
  }
)
table.insert(props,
 {
    Name = "Serial Pin",
    Type = "boolean",
    Value = false, -- This is the default 'state' of this boolean property
  }
)