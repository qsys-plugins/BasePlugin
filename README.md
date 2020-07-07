# BasePlugin

This is a template plugin that you can download with some pre-written Lua code to get you started.

## PluginCompile

This is a submodule built for VS Code. Please note it is not intended to be used for any other source code editors.

The submodule will take the individual source Lua files in your local repo, compile them into a singular qplug file, and auto increment the desired octet of the BuildVersion.
For first time builds, it will auto-generate an UUID for you plugin as well.

Make sure to map a keyboard shortcut by navigating to File>Preferences>Keyboard Shortcuts. Type in "Tasks" and assign the desired shortcut to the Tasks: Run Build Task command

### Build Arguments

<ver_maj> : increments the first octet of BuildVersion to denote a major version change

<ver_min> : increments the second octet of BuildVersion to denote a minor version change

<ver_fix> : increments the third octet of BuildVersion to denote a bugfix

<ver_dev> : increments the fourth octet of BuildVersion to denote a new development version

< CANCEL > : cancels the build process
  
Please note that the public version (PluginVersion) only displays first and second octet. The second octets are intended for developer use and version tracking.

## Support

If you have any questions or concerns, please contact qsyscontrolfeedback@qsc.com
