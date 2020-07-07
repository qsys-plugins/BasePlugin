-- Control aliases
Status = Controls.Status

-- Variables and flags
DebugTx=false
DebugRx=false
DebugFunction=false
DebugPrint=Properties["Debug Print"].Value

-- Sockets and services

-- Timers, tables, and constants
StatusState = { OK = 0, COMPROMISED = 1, FAULT = 2, NOTPRESENT = 3, MISSING = 4, INITIALIZING = 5 }
PollTimer = Timer.New()
PollTime = 3

-- Helper functions
-- A function to determine common print statement scenarios for troubleshooting
function SetupDebugPrint()
  if DebugPrint=="Tx/Rx" then
    DebugTx,DebugRx=true,true
  elseif DebugPrint=="Tx" then
    DebugTx=true
  elseif DebugPrint=="Rx" then
    DebugRx=true
  elseif DebugPrint=="Function Calls" then
    DebugFunction=true
  elseif DebugPrint=="All" then
    DebugTx,DebugRx,DebugFunction=true,true,true
  end
end

-- Update the Status control
function ReportStatus(state,msg)
  if DebugFunction then print("ReportStatus() Called") end
  local msg=msg or ""
  Status.Value=StatusState[state]
  Status.String=msg
end

-- Send data to device
function Send(cmd)
  if DebugFunction then print("Send() Called") end
  if DebugTx then print("Tx: "..cmd) end
end

-- A function to clear controls/flags/variables and clears tables
function ClearVariables()
  if DebugFunction then print("ClearVariables() Called") end
  PollTimer:Stop()
end

-- A function to trigger other functions or set flags if disconnected
function Disconnected()
  if DebugFunction then print("Disconnect() Called") end
  ClearVariables()
end

-- A function to handle connection
function Connect()
  if DebugFunction then print("Connect() Called") end
  ClearVariables()
  Device:Connect(IPAddress.String,Port.Value)
end

-- A function to trigger other functions once connected
function Connected()
  if DebugFunction then print("Connected() Called") end
  ReportStatus("OK")
  GetDeviceInfo()
  PollTimer:Start(PollTime)
end

-- Initial data grab from device
function GetDeviceInfo()
  if DebugFunction then print("GetDeviceInfo() Called") end
end

-- Poll function for updates and state changes
function PollDevice()
  if DebugFunction then print("PollDevice() Called") end
end

-- EventHandlers
PollTimer.EventHandler = PollDevice

-- Buffer Management
function ParseResponse()
  if DebugFunction then print("ParseResponse() Called") end
  -- Entire buffer is set to newrx here
  rx = Device:Read(Device.BufferLength)
  while rx do 
    if DebugRx then print("Rx: "..rx) end
  end
end

-- Socket Management

-- Initialization Function
function Initialization()
  if DebugFunction then print("Initialization() Called") end
  SetupDebugPrint()
  Connect()
end

Initialization()