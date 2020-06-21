--[[
ReaScript name: js_Mouse editing - Multi Tool.lua
Version: 5.52
Author: juliansader
Website: http://forum.cockos.com/showthread.php?t=176878
Donation: https://www.paypal.me/juliansader
Provides: 
  [main=midi_editor,midi_inlineeditor] .
  js_Mouse editing - Scale bottom.cur
  js_Mouse editing - Scale top.cur
  js_Mouse editing - Multi compress.cur
  js_Mouse editing - Undo.cur
  js_Mouse editing - Redo.cur
About:
  # DESCRIPTION
  
  A multifunctional script for stretching, scaling, tilting and warping MIDI events.
  
  
  # INSTRUCTIONS
  
  The script is intended to work similar to REAPER's native left-drag mouse modifier functions -- but with more advanced functionality:
  
  First, recall how to run REAPER's native mouse modifier functions: 
  
      * You press the modifiers key(s) and then hold them down while left-clicking or left-dragging the mouse.
      
      * The effect of a mouse modifier function often depends on the starting position of the mouse:
          For example, Alt+left-dragging from the right edge of a note stretches the note, 
          whereas Alt+left-dragging from the inside of a note changes velocity.)
  
  Similarly, to run this script, you press the shortcut key (instead of the modifier key), then click or drag the mouse from specific starting positions.
  
  Beyond these basic similarities, however, this script offers several advanced features:
  
      * The various positions from which the mouse can be clicked or dragged are displayed onscreen as colored zones.
      
      * The scripts' functioning (such as the ramp shape or the channel of inserted CCs) can be tweaked while the script is running, 
        using the mousewheel, mouse middle button and right button.
     
      * Whereas native actions can only be started and stopped by left-dragging and lifting the mouse button,
        the scripts be started and stopped in multiple ways, allowing a more customized and streamlined workflow.
        
      * Multiple editing steps can be performed before terminating the script, and the precise (floating point) positions and values of the events
          are remembered between steps, to avoid rounding errors when rounding to the nearest tick positions or 128-step values ranges. 
          
      * And, of course, the script offers a variety of editing tools such as warping, compressing, stretching and tilting that are not found among REAPER's native actions.
  
  
  REAPER BUGS:
  
  REAPER does not provide scripts with a list of items that are editable in a MIDI editor, so most scripts can only edit the active item.  
  Only in special circumstances, for example when editability follows item selection, can scripts deduce which items are editable.
  Please bump the Feature Request thread: t=168563.
  
  
  EDITABLE ITEMS:
  
  This script can edit selected events in all editable items, but only if the following settings are all enabled:
  * Preferences -> MIDI editor -> On MIDI editor per project
  * Options: MIDI track list/media item lane selection is linked to visibility
  * Options: MIDI track list/media item lane selection is linked to editability
  * Options: Draw and edit CC events on all tracks
  
  If these setting are not all enabled, the script can only edit events in the active item.
  
  
  LANE UNDER MOUSE:
  
  The script can either affect 1) all selected MIDI events, or 2) only the selected MIDI events in lane under the mouse.
  
      * To edit only the selected events in a single lane, the mouse must be positioned inside that lane when the script starts.  
          (After the script has started, the mouse may move out of the starting lane.)
      
      * To edit all selected events together, the mouse must be positioned over a lane divider, or over the ruler -- i.e., outside any lane.
  
  When editing all selected events, only their tick positions can be edited, using the warp, stretch or reverse functions.  
  When editing a single lane, positions as well as values can be edited.  
  
  
  STARTING THE SCRIPT:
  
      * Similar to any action in the Actions list, the script can be assigned a keyboard or mousewheel shortcut.
        (NOTE: To run the script, the shortcut key can either be held down for as long as the script must run, similar to REAPER's native mouse modifier functions,
                or the shortcut key can be clicked once to start the scripts and then once again the terminate the script.) 
        
      * Similar to mouse modifier actions, assign the script to a left-click or double-click mouse modifier in Preferences -> Mouse modifiers.  
               
      * Arming a toolbar button, as described below.
      
  
  ZONES AND FUNCTIONS:
  
  As soon as the shortcut key is pressed, colored zones will light up on screens, indicating the available functions.
  
  Each zone may either be left-click/dragged, mousewheel-triggered, or right-clicked.  The zones and their associated left-button / mousewheel functions are:
  
      * Compress lane from top / Flip values absolute
      * Compress lane from bottom / Flip values absolute
      * Scale values from top / Flip values relative
      * Scale value from bottom / Flip values relative
      * Warp left/right or up/down (depending on initial mouse movement) / Reset and evenly space events
      * Stretch or move from left / Reverse positions
      * Stretch or move from right / Reverse positions
      * Tilt left side / Snap to chased values on left
      * Tilt right side / Snap to chased values on right
      * Undo
      * Redo      
  
  Note that left-clicking and left-dragging can both be used to run the same functions.
 
  To proceed to next step:  
      * If the mouse was dragged, proceed by lifting the mouse button.  
      * If the mouse button was clicked, proceed by clicking a second time.
  
  Right-clicking on a zone while the zones are displayed pops up a context menu through which zone color and zone size can be customized.
      
      
  TWEAKING WHILE RUNNING:
  
  The scripts' functioning can be tweaked while the script is running:
  
      * Middle-clicking switches the curve shape:  
            In the case of compression and tilting, it switches between sine (aka slow start/end) and power (aka linear, slow start, and slow end) curves.
            In the case of warping, it switches between slow start and slow end warp shapes.
    
      * Mousewheel tweaks the steepness of the curves.
    
      * Right-clicking switches between one-sided mode and two-sided / symmetrical mode.
      
      * If the Shift key is held down while stretcing, snapping is ignored.  
  
  
  TERMINATE THE SCRIPT: 
  
  To terminate the script:  
      * If the shortcut key was held down, terminate by lifting the key.  
      * If the shortcut key was clicked and released, terminate by pressing any key (excluding some special keys such as Shift).
      * Clicking or mousewheel outside any zone (when the mouse cursor is a cross).
  
        
  RUNNING THE SCRIPT FROM THE TOOLBAR:
  
  Since the functioning of the script depends on initial mouse position (similar to some of REAPER's own mouse modifier actions, 
     or actions such as "Insert note at mouse cursor"), the script cannot be run from a toolbar button.  
     This problem is solved by "arming" toolbar buttons for delayed execution after moving the mouse into position:
     
     
     REAPER's NATIVE TOOLBAR ARMING:
     
     REAPER natively provides a "toolbar arming" feature: right-click a toolbar button to arm its linked action
     (the button will light up with an alternative color), and then left-click to run the action 
     after moving the mouse into position over the piano roll.
     
     There are two niggles with this feature, though: 
     
     1) Left-drag is very sensitive: If the mouse is even slightly moved while left-clicking,
         the left-drag mouse modifier action will be run instead of the armed toolbar action; 
  
     2) Multiple clicks: The user has to right-click the toolbar (or press Esc) to disarm the toolbar and use left-click normally again,
         then right-click the toolbar again to use the script. 
         
         
     ALTERNATIVE TOOLBAR ARMING:
     
     The "js_Mouse editing" scripts therefore offer an alternative "toolbar arming" solution:  
     
     1) Link the "js_Mouse editing - Run script that is armed in toolbar" script to a keyboard or mousewheel shortcut.
     
     2) Link the individual Mouse editing scripts (such as "Draw ramp", "Warp", etc) to toolbar buttons. (No need to link them each to a shortcut.)
         
       (I.e. the Run script is linked to a shortcut, while the individual Mouse editing scripts are linked to toolbar buttons.)
     
     3) If the mouse is positioned over a toolbar or over the Actions list when the Mouse editing script starts 
         (or, actually, anywhere else outside the MIDI piano roll and CC lanes), the script will arm itself 
         and its button will light up with the normal "activated" color.
     
     4) When the "Run" script is executed with its shortcut, it will run the armed Mouse editing script.
     
     By using this feature, each "Mouse editing" script does need not be linked to its own shortcut key.  Instead, only the 
       accompanying "Run" script needs to be linked to a shortcut.
    
    
  PERFORMANCE TIP: The responsiveness of the MIDI editor is significantly influenced by the total number of events in 
      the visible and editable takes.  If the MIDI editor is slow, try reducing the number of editable and visible tracks.
      
  PERFORMANCE TIP 2: If the MIDI editor gets slow and jerky when a certain VST plugin is loaded, 
      check for graphics driver incompatibility by disabling graphics acceleration in the plugin.
]] 

--[[
  Changelog:
  * v5.01 (2019-12-03)
    + BETA version.
  * v5.05 (2019-12-19)
    + Fixed: Load custom colors.
    + Fixed: Display Undo/Redo boxes on macOS.
    + Fixed: Canceled color selection dialog doesn't change color.
  * v5.10 (2019-12-28)
    + Scale top/bottom zones drawn at level of CC max/min values.
    + Compress bottom zone active behind bottom scroll bar.
  * v5.11 (2019-12-29)
    + A few tweaks.
  * v5.12 (2019-12-30)
    + Fixed: Bug when holding keyboard shortcut.
  * v5.21 (2020-04-03)
    + Warning if used on macOS with Metal.
    + Zone size can be set via right-click context menu.
    + Stretch mode can switch to Move by right-clicking.
    + All editable takes can be edited together -- but only if editability follows item selection.
  * v5.23 (2020-04-06)
    + Works even if active take contains no selected events.
  * v5.25 (2020-04-19)
    + In notes lane lane, Reset doesn't reset velocity values.
  * v5.35 (2020-04-26)
    + Works in inline editor (and automatically installs in inline editor section).
    + Implement 2-sided warp (toggle with right-click while warping). 
    + Fixed: Notes that extend beyond right edge of editor.
  * v5.40 (2020-04-27)
    + Fixed changelog.  Cumulative changes include:
    + Customization: Zone size can be set via right-click context menu (useful for hi-res displays).
    + New mode: Move without stretching (toggle with right-click while stretching).
    + New mode: 2-sided warp (toggle with right-click while warping).
    + All editable takes can be edited together (if editability follows item selection).
    + Works in inline editor (and automatically installs in inline editor section).
  * v5.50 (2020-05-07)
    + Fixed: Incorrect source length calculation when take play rate is not 1.
    + Fixed: Tilt right-hand side used sine instead of power curve.
  * v5.51 (2020-05-15)
    + Fixed: Source length bug (again).
  * v5.52 (2020-06-15)
    + Requires REAPER v6.12, which fixed OSX Metal bug.
    + Remove OSX Metal warning.
    + Sort MIDI before terminating (p=2289029).
]]

-- USER AREA 
-- Settings that the user can customize
    
    Guideline_Color_Top    = 0xFF00FF00 -- Format AARRGGBB
    Guideline_Color_Bottom = 0xFF0000FF
    
    
-- End of USER AREA   


-- ################################################################################################
---------------------------------------------------------------------------------------------------
-- CONSTANTS AND VARIABLES (that modders may find useful)

-- The raw MIDI data string will be divided into substrings in tMIDI, which can be concatenated into a new edited MIDI string in each cycle.
local tTakeInfo = {}
local tMIDI = {}

--[[ CCs in different takes, lanes and channels must each be handled separately.  
    For example, when deleting overlapping CCs, only CCs in the same take, lane and channel as the selected CCs must be deleted.
        Also, when tilting/snapping to chased values, each channel must be chased individually.
    The CCs events in different lanes and different channels will therefore be separated into distinct tables, which will be stored in tGroups.
        Notes, sysex and text also get separate groups.
    Each group will itself consist of multiple tables, which store the info if the events: tick positions, flags, values, pitch etc:
        tGroups[group] = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}}
    These are shorthand for these names: 
        tTicks = {}
        tPrevTicks = {}
        tIndices = {}
        tMsg = {} 
        tMsg2 = {} -- Msf of secondary events such as note-offs
        tValues = {} -- CC values, 14bit CC combined values, note velocities
        tTicks = {} 
        tChannels = {} 
        tFlags = {} 
        tFlags2 = {} -- Flags of secondary events such as note-offs in the case of notes, or LSB in the case of 14bit CCs
        tPitches = {} -- This table will only be filled if laneIsNOTES (laneIsVELOCITY, laneIsOFFVEL, or laneIsPIANOROLL)
        tLengths = {} 
        tMeta = {} -- Extra REAPER-specific non-MIDI metadata such as notation or Bezier tension.
]]
local tGroups = {}

-- At each step, tGroups and the global values will be updated into a new entry in tSteps:
-- NOTE:  Not all tables will be copied entry-by-entry at each step.  Tables that remain unchanged will simply be aliases for the corresponding tables in the previous step.
local tSteps = {} -- At each step, tSteps will store a new tValues, tTicks 
  

-- If the curve is being auditioned in real time, must be sorted, since unsorted events with negative offset may not play back properly.
local isRealtimeAudition = ((reaper.GetPlayStateEx(0)&5) ~= 0)

-- The original value and PPQ ranges of selected events in the target lane will be summarized in:
local origValueMin, origValueMax, origValueRange, origValueLeftmost, origValueRightmost = nil, nil, nil, nil, nil
local origTickLeftmost, origTickRightmost, origNoteOffTick, origTickRange = nil, nil, nil, nil
local includeNoteOffsInPPQRange = true
 
-- Starting values and position of mouse 
-- Not all of these lanes will be used by all scripts.
-- mouseOrigCCLane: (CC0-127 = 7-bit CC, 0x100|(0-31) = 14-bit CC, 0x200 = velocity, 0x201 = pitch, 
--    0x202=program, 0x203=channel pressure, 0x204=bank/program select, 
--    0x205=text, 0x206=sysex, 0x207=off velocity)
local mouseOrigX, mouseOrigY = nil, nil
local laneMinValue, laneMaxValue = nil, nil -- The minimum and maximum values in the target lane
local mouseOrigCCLane, mouseOrigCCValue, mouseOrigPPQPos, mouseOrigPitch, mouseOrigCCLaneID = nil, nil, nil, nil, nil

-- Some day, this script is intended to work in inline MIDI editors as well as the main MIDI editors
-- The two types of editors require some different code, though.  
-- In particular, if in an inline editor, functions from the SWS extension will be used to track mouse position.
-- In the main editor, WIN32/SWELL functions from the js_ReaScriptAPI extension will be used.
local isInline, editor = nil, nil

-- Tracking the new value and position of the mouse while the script is running
local mouseNewCCLane, mouseNewCCValue, mouseNewPPQPos, mouseNewPitch, mouseNewCCLaneID = nil, nil, nil, nil, nil
local prevMouseX, prevMouseY, mouseX, mouseY = nil, nil, nil, nil
local prevMouseTick, mouseTick = nil, nil

-- The script can be controlled by mousewheel, mouse buttons an mouse modifiers.  These are tracked by the following variables.
local mouseState
local mousewheel = 1 -- Track mousewheel movement.  ***** This default value may change, depending on the script and formulae used. *****
local prevDelta = 0
local prevMouseInputTime = 0

-- The script will intercept keystrokes, to allow control of script via keyboard, 
--    and to prevent inadvertently running other actions such as closing MIDI editor by pressing ESC
local VKLow, VKHi = 0x13, 0xFE --9, 0xA5 -- Range of virtual key codes to check for key presses: Skip mouse modifiers
local keyState0 = string.rep("\0", VKHi-VKLow+1) -- String representing no keys held, for easy comparison with running keyState
local dragTime = 0.35 -- To distinguish clicks and drags, how long must mouse or shortcut key be held down before drag is activated?

-- REAPER preferences and settings that will affect the drawing/selecting of new events in take
local isSnapEnabled = false -- Will be changed to true if snap-to-grid is enabled in the editor
local activeChannel -- In case new MIDI events will be inserted, what is the default channel?
local editAllChannels = nil -- Is the MIDI editor's channel filter enabled?
local CCDensity -- CC resolution as set in Preferences -> MIDI editor -> "Events per quarter note when drawing in CC lanes"
local skipRedundantCCs
local PPQ -- ticks per quarter note

-- Variables that will be used to calculate the CC spacing
local PPerCC -- ticks per CC ** not necessarily an integer **
local QNperGrid
local firstCCinTakePPQPos -- CC spacing should not be calculated from PPQPos = 0, since take may not start on grid.
local firstGridInsideTakePPQPos -- If snap to grid, don't snap to left of this edge

-- Not only must the mouse cursor's PPQ position be snapped to the grid (except in some scripts such as Arch), 
--    but if the item is looped, must also be translated to its relative position in the first loop iteration
-- Also, the source length when the script begins will be checked against the source length when the script ends,
--    to ensure that the script did not inadvertently shift the positions of non-target events.
local loopStartPPQPos -- Start of loop iteration under mouse
local sourceLengthTicks -- = reaper.BR_GetMidiSourceLenPPQ(activeTake)
local minimumTick, maximumTick -- The mouse PPO position should not go outside the boundares of either the visible item or the underlying MIDI source

-- Some internal stuff that will be used to set up everything
local  _, activeItem, activeTake
local window, segment, details = nil, nil, nil -- given by the SWS function reaper.BR_GetMouseCursorContext()
local startTime, prevMousewheelTime = 0, 0
local lastPPQPos -- to calculate offset to next CC

--local lastValue -- To compare against last value, if skipRedundantCCs
-- If the mouse is over a MIDI editor, these variables will store the on-screen layout of the editor.
-- NOTE: Getting the MIDI editor scroll and zoom values is slow, since the item chunk has to be parsed.
--    This script will therefore not update these variables after getting them once.  The user should not scroll and zoom while the script is running.
local activeTakeChunk
local ME_LeftmostTick, ME_PixelsPerTick, ME_PixelsPerSecond = nil, nil, nil -- horizontal scroll and zoom
local ME_LeftmostTime, ME_RightmostTime = nil, nil
local inline_TakeTopPixel, inline_TakeBottomPixel = nil, nil
local ME_TopPitch, ME_PixelsPerPitch = nil, nil -- vertical scroll and zoom
local ME_Width, ME_Height = nil, nil -- Mouse screen coordinates will be converted to client, so leftmost and topmost pixels are always 0. 
local ME_TargetTopPixel, ME_TargetBottomPixel = nil, nil
local ME_TimeBase = nil
local tME_Lanes = {} -- store the layout of each MIDI editor lane
--local tVisibleCC7Bit = {} -- CC lanes to use.  (In case of a 14bit CC lane or Bank/Program, this table will contain two entries. If all visible lanes are used, may contain even more entries.)

-- I am not sure that declaring functions local really helps to speed things up...
local s_unpack = string.unpack
local s_pack   = string.pack
local t_insert = table.insert -- myTable[i] = X is actually much faster than t_insert(myTable, X)
local m_floor  = math.floor
local m_cos = math.cos
local m_min = math.min
local m_max = math.max 
local m_pi  = math.pi
local tp = reaper.time_precise

-- Window messages that will be intercepted while the script is running
local tWM_Messages = {WM_LBUTTONDOWN = false, WM_LBUTTONDBLCLK = false, WM_LBUTTONUP = false,
                      WM_MBUTTONDOWN = false, WM_MBUTTONDBLCLK = false, WM_MBUTTONUP = false,
                      WM_RBUTTONDOWN = false, WM_RBUTTONDBLCLK = false, WM_RBUTTONUP = false,
                      WM_NCMOUSEMOVE = false, -- This intercept allows the mouse to go into the bottom scroll area (i.e. outside midiview's client area) without REAPER noticing it and changing the mouse cursor.
                      WM_NCLBUTTONDOWN = false, WM_NCLBUTTONDBLCLK = false, -- Prevent clicking on scrollbar
                      WM_MOUSEWHEEL  = false, WM_MOUSEHWHEEL   = false,
                      WM_SETCURSOR   = false}                 
  

-- Guideline GUI stuff:
local leftPPQrange, rightPPQrange
local Guides_LeftPixel, Guides_RightPixel, Guides_XStr, Guides_YStr_Top, Guides_YStr_Bottom = nil, nil, nil, nil, nil, nil, nil, nil
local tGuides_Ticks, tGuides_X = {}, {} -- Guide lines will be drawn between nodes spaced every 10 pixels. What are the tick positions of these pixels?
local Guides_COLOR_TOP    = tonumber(Guideline_Color_Top) or 0xFF00FF00 -- Format AARRGGBB
local Guides_COLOR_BOTTOM = tonumber(Guideline_Color_Bottom) or 0xFF0000FF

-- Zone GUI stuff
local tZones = {}
local zone = nil
local prevZone = nil
local tColors = nil
local zoneWidth = (gfx.ext_retina == 2) and 40 or 20 -- I'm nont sure if gfx.ext_retina actually works if no script GUI is created
local tCursors = {} -- Will be filled with cursor file names in MAIN

local OS, macOS, winOS     

-- If active take isn't edited, the MIDI editor doesn't update during defer cycles!  
-- So get just one little piece of info from active take, that can be written in each cycle without changing anything.
-- A MIDI take should never be completely empty, since it always has the All-Notes-Off at the end.
local activeTakeForceUpdateMsg --= ({reaper.MIDI_GetEvt(activeTake, 0, true, false, 0, "")})[5]

-- Memoize: In order to avoid calling MIDI_GetProjTimeFromPPQPos thousands of times, memoize these maps here.
-- Use metatables to create subtables on the fly.
local tTimeFromTick = {} 
local tTickFromTime = {}
local tPixelFromTime = {}
local tTimeFromPixel = {} 
setmetatable(tTimeFromTick, {__index = function(t, take) t[take] = setmetatable({}, {__index = function(tt, tick) 
                                                                                                  --if tick then
                                                                                                  --    if tick <= -math.huge or tick >= math.huge then reaper.ShowConsoleMsg(debug.traceback()) error() end --"\ntake: "..tostring(take).." / tick: "..tostring(tick))
                                                                                                      local time = reaper.MIDI_GetProjTimeFromPPQPos(take, tick + tTakeInfo[take].loopStartTick)
                                                                                                      tt[tick] = time
                                                                                                      tTickFromTime[take][time] = tick
                                                                                                      return time 
                                                                                                  --end
                                                                                              end
                                                                                    }) return t[take] end})
                                                                                    
setmetatable(tTickFromTime, {__index = function(t, take) t[take] = setmetatable({}, {__index = function(tt, time) 
                                                                                                  --if time then
                                                                                                  --    if time <= -math.huge or time >= math.huge then reaper.ShowConsoleMsg(debug.traceback()) error() end
                                                                                                      local tick = reaper.MIDI_GetPPQPosFromProjTime(take, time) - tTakeInfo[take].loopStartTick
                                                                                                      tt[time] = tick
                                                                                                      tTimeFromTick[take][tick] = time
                                                                                                      return tick 
                                                                                                  --end
                                                                                              end
                                                                                    }) return t[take] end})
                                                                    
                                                                                   
setmetatable(tPixelFromTime, {__index = function(t, time)
                                            local pixel = (ME_TimeBase == "beats")
                                                      and ((reaper.MIDI_GetPPQPosFromProjTime(activeTake, time) - ME_LeftmostTick) * ME_PixelsPerTick)//1
                                                      or  ((time - ME_LeftmostTime) * ME_PixelsPerSecond)//1                  
                                            t[time] = pixel
                                            return pixel
                                        end })     
                                        
setmetatable(tTimeFromPixel, {__index = function(t, x) 
                                            local time = (ME_TimeBase == "beats")
                                                      and (reaper.MIDI_GetProjTimeFromPPQPos(activeTake, ME_LeftmostTick + (x/ME_PixelsPerTick)))
                                                      or  (ME_LeftmostTime + (x/ME_PixelsPerSecond))
                                            t[x] = time
                                            return time
                                        end })                                                                                                                         

--##################################
------------------------------------
local function GetMouseTick(trySnap)
    local snappedNewTick
    
    -- MOUSE NEW TICK / PPQ VALUE (horizontal position)
    -- Snapping not relevant to this script
    if not mouseX then 
        local x, y = reaper.GetMousePosition()
        mouseX = reaper.JS_Window_ScreenToClient(windowUnderMouse, x, y)
    end
    if ME_TimeBase == "beats" then
        mouseNewPPQPos = ME_LeftmostTick + mouseX/ME_PixelsPerTick
    else -- ME_TimeBase == "time"
        mouseNewPPQPos = reaper.MIDI_GetPPQPosFromProjTime(activeTake, ME_LeftmostTime + mouseX/ME_PixelsPerSecond )
    end
    mouseNewPPQPos = mouseNewPPQPos - tTakeInfo[activeTake].loopStartTick -- Adjust mouse PPQ position for looped items
    
    -- Adjust mouse PPQ position for snapping
    if not trySnap or not isSnapEnabled or (mouseState and mouseState&8 == 8) then -- While shift is held down, don't snap
        snappedNewTick = m_floor(mouseNewPPQPos+0.5) 
    elseif isInline then
        local timePos = reaper.MIDI_GetProjTimeFromPPQPos(activeTake, mouseNewPPQPos)
        local snappedTimePos = reaper.SnapToGrid(0, timePos) -- If snap-to-grid is not enabled, will return timePos unchanged
        snappedNewTick = m_floor(reaper.MIDI_GetPPQPosFromProjTime(activeTake, snappedTimePos) + 0.5)
    else
        local mouseQNpos = reaper.MIDI_GetProjQNFromPPQPos(activeTake, mouseNewPPQPos) -- Mouse position in quarter notes
        local roundedGridQN = math.floor((mouseQNpos/QNperGrid)+0.5)*QNperGrid -- nearest grid to mouse position
        snappedNewTick = m_floor(reaper.MIDI_GetPPQPosFromProjQN(activeTake, roundedGridQN) + 0.5)
    end
    snappedNewTick = math.max(tTakeInfo[activeTake].minimumTick, math.min(tTakeInfo[activeTake].maximumTick, snappedNewTick))
    
    return snappedNewTick
end

function SnapTime(time)
    if not isSnapEnabled or (mouseState and mouseState&8 == 8) then -- While shift is held down, don't snap
        return time --snappedNewTick = (mouseNewPPQPos+0.5)//1 
    elseif isInline then
        return reaper.SnapToGrid(0, time) -- If snap-to-grid is not enabled, will return timePos unchanged
    else
        local mouseQNpos = reaper.TimeMap2_timeToQN(0, time) -- Mouse position in quarter notes
        local roundedGridQN = math.floor((mouseQNpos/QNperGrid)+0.5)*QNperGrid -- nearest grid to mouse position
        return reaper.TimeMap2_QNToTime(0, roundedGridQN)
    end
end


--#################################
-----------------------------------
function GetMouseValue(limitInside)
    local mouseNewCCValue
    if not mouseY then 
        local x, y = reaper.GetMousePosition()
        local _, mouseY = reaper.JS_Window_ScreenToClient(windowUnderMouse, x, y)
    end
    mouseNewCCValue = laneMinValue + (laneMaxValue-laneMinValue) * (tME_Lanes[mouseOrigCCLaneID].bottomPixel - mouseY) / (tME_Lanes[mouseOrigCCLaneID].bottomPixel - tME_Lanes[mouseOrigCCLaneID].topPixel)
    if limitInside then
        -- May the mouse CC value go beyond lane limits?
        if mouseNewCCValue > laneMaxValue then mouseNewCCValue = laneMaxValue
        elseif mouseNewCCValue < laneMinValue then mouseNewCCValue = laneMinValue
        else mouseNewCCValue = (mouseNewCCValue+0.5)//1
        end
    end
    return mouseNewCCValue
end


--#########################
---------------------------
function GetMinMaxValues(tableGroups)
    local min, max = math.huge, -math.huge
    local tMin, tMax
    for group, tables in pairs(tableGroups) do
        local tV = tables.tV
        for i = 1, #tV do
            if tV[i] > max then max = tV[i] tMax = {id = group, i = i} end
            if tV[i] < min then min = tV[i] tMin = {id = group, i = i} end
        end
    end
    return min, max, tMin, tMax
end


local stepDragTimeStarted = nil
--######################################
----------------------------------------
function Check_MouseLeftButtonSinceLastDefer()
    if continueStep ~= "CONTINUE" then
        mouseStateAtStepDragTime = nil
    elseif not mouseStateAtStepDragTime then
        mouseStateAtStepDragTime = (thisDeferTime > stepStartTime + dragTime) and mouseState
    elseif (mouseState&1) < (mouseStateAtStepDragTime&1) then
        return true
    end

        --[[
                if (mouseState&1) < (mouseStateAtStepDragTime&1) then
                    return true
                end
            end
        -- LEFT MOUSE BUTTON: 
        -- Terminate this step (but not entire script) if left button is released after dragTime has passed
        if mouseStateAtStepDragTime then
            if (thisDeferTime > stepStartTime + dragTime) then 
                if (mouseState&1) < (mouseStateAtStepDragTime&1) then
                    return true
                end
            else
                mouseStateAtStepDragTime = mouseStateAtStepDragTime & mouseState
            end
        end
        if (mouseState&1) > (mouseStateAtStepDragTime&1) then return true end
        ]]
        -- Terminate if left button is clicked
    local peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_LBUTTONDOWN")
    if peekOK and time > stepStartTime + 0.1 then 
        prevMouseInputTime = time
        return true 
    end
    peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_NCLBUTTONDOWN")
    if peekOK and time > stepStartTime + 0.1 then 
        prevMouseInputTime = time
        return true 
    end
end
    
   
local prevStretchFactor = 1
local prevMouseTimePos = nil
local stretchMOVE = false
--###########################
-----------------------------
function Defer_Stretch_Left()
  
    -- Setup stuff when this function 
    if not (continueStep == "CONTINUE") then
        stepStartTime = thisDeferTime
        mouseStateAtStepDragTime = mouseState
        prevStretchFactor = 1
        -- Construct new tStep by copying previous - except those tables/values that will be newly contructed
        local old = tSteps[#tSteps]
        local new = {tGroups = {}, isChangingPositions = true}
        tSteps[#tSteps+1] = new
        for key, entry in pairs(old) do
            if not new[key] then new[key] = entry end
        end
        for take, tID in pairs(old.tGroups) do
            new.tGroups[take] = {}
            for id, t in pairs(tID) do
                new.tGroups[take][id] = (id == "notes") and {tT = {}, tOff = {}} or {tT = {}}
                for a, b in pairs(t) do
                    if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
                end
            end
        end
        mustCalculate = true -- Always start step with re-calculation        
    end
    
    local mouseTime = SnapTime(tTimeFromPixel[mouseX]) 
    if mouseTime < globalLeftmostItemStartTimePos then mouseTime = globalLeftmostItemStartTimePos -- Prevent stretching out of item bounds
    elseif mouseTime > globalRightmostItemEndTimePos then mouseTime = globalRightmostItemEndTimePos -- Prevent stretching out of item bounds
    end
    if mouseTime ~= prevMouseTimePos then
        prevMouseTimePos = mouseTime
        mustCalculate = true
    end
    
    -- RIGHT CLICK: Right click changes script mode
    peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_RBUTTONDOWN")
    if peekOK and time > prevDeferTime then
        stretchMOVE = not stretchMOVE
        prevMouseInputTime = time
        mustCalculate = true
        Tooltip(stretchMOVE and "Move" or "Stretch")
    end   
    
    if mustCalculate then
        local new, old    = tSteps[#tSteps], tSteps[#tSteps-1]
        local oldLeftTick = tTickFromTime[activeTake][old.globalLeftmostTime]
        local oldRightTick = tTickFromTime[activeTake][old.globalNoteOffTime]
        local mouseTick = tTickFromTime[activeTake][mouseTime]
        
        if stretchMOVE then
            local moveTicks = mouseTick - oldLeftTick
            for take, tID in pairs(new.tGroups) do
                for id, t in pairs(tID) do
                    local nT, oT =  t.tT, old.tGroups[take][id].tT
                    for i = 1, #oT do
                        nT[i] = oT[i]+moveTicks
                    end
                    if id == "notes" then
                        local nO, oO = t.tOff, old.tGroups[take][id].tOff
                        for i = 1, #oO do
                            nO[i] = oO[i]+moveTicks
                        end
                    end
                end
            end
        else
            local stretchFactor = (oldRightTick - mouseTick) / (oldRightTick - oldLeftTick)
            if stretchFactor == 0 then stretchFactor = prevStretchFactor or 1 end -- Avoid zero-length notes or CCs on top of each other in same channel
            prevStretchFactor = stretchFactor
            local noteFactor = (stretchFactor > 0) and stretchFactor or -stretchFactor        
            
            for take, tID in pairs(new.tGroups) do
                oldNoteOffTick = tTickFromTime[take][old.globalNoteOffTime]
                for id, t in pairs(tID) do
                    local nT, oT = t.tT, old.tGroups[take][id].tT
                    for i = 1, #oT do
                        nT[i] = oldNoteOffTick - stretchFactor*(oldNoteOffTick - oT[i])
                    end
                    if id == "notes" then
                        local nO, oO = t.tOff, old.tGroups[take][id].tOff
                        for i = 1, #oO do
                            nO[i] = oldNoteOffTick - stretchFactor*(oldNoteOffTick - oO[i])
                        end
                        if stretchFactor < 0 then t.tT, t.tOff = t.tOff, t.tT end
                    end
                end
            end
        end
        
        CONSTRUCT_MIDI_STRING()
    end
   
    -- GO TO NEXT STEP?
    if Check_MouseLeftButtonSinceLastDefer() then 
        GetAllEdgeValues(tSteps[#tSteps])
        return "NEXT"
    else
        return "CONTINUE"
    end
end


--############################
------------------------------
function Defer_Stretch_Right()
  
    -- Setup stuff when this function 
    if not (continueStep == "CONTINUE") then
        stepStartTime = thisDeferTime
        mouseStateAtStepDragTime = mouseState
        prevStretchFactor = 1
        -- Construct new tStep by copying previous - except those tables/values that will be newly contructed
        tSteps[#tSteps+1] = {tGroups = {}, isChangingPositions = true}
        local old = tSteps[#tSteps-1]
        local new = tSteps[#tSteps]
        for key, entry in pairs(old) do
            if not new[key] then new[key] = entry end
        end
        for take, tID in pairs(old.tGroups) do
            new.tGroups[take] = {}
            for id, t in pairs(tID) do
                new.tGroups[take][id] = (id == "notes") and {tT = {}, tOff = {}} or {tT = {}}
                for a, b in pairs(t) do
                    if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
                end
            end
        end
        mustCalculate = true -- Always start step with re-calculation        
    end
    
    -- RIGHT CLICK: Right click changes script mode
    peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_RBUTTONDOWN")
    if peekOK and time > prevDeferTime then
        stretchMOVE = not stretchMOVE
        prevMouseInputTime = time
        mustCalculate = true
        Tooltip(stretchMOVE and "Move" or "Stretch")
    end
    
    local mouseTime = SnapTime(tTimeFromPixel[mouseX]) 
    if mouseTime < globalLeftmostItemStartTimePos then mouseTime = globalLeftmostItemStartTimePos -- Prevent stretching out of item bounds
    elseif mouseTime > globalRightmostItemEndTimePos then mouseTime = globalRightmostItemEndTimePos -- Prevent stretching out of item bounds
    end
    if mouseTime ~= prevMouseTimePos then
        prevMouseTimePos = mouseTime
        mustCalculate = true
    end    
    
    if mustCalculate then
        local new, old    = tSteps[#tSteps], tSteps[#tSteps-1]
        local oldLeftTick = tTickFromTime[activeTake][old.globalLeftmostTime]
        local oldRightTick = tTickFromTime[activeTake][old.globalNoteOffTime]
        local mouseTick = tTickFromTime[activeTake][mouseTime]
        
        if stretchMOVE then
            local moveTicks = mouseTick - oldRightTick
            for take, tID in pairs(new.tGroups) do
                for id, t in pairs(tID) do
                    local nT, oT =  t.tT, old.tGroups[take][id].tT
                    for i = 1, #oT do
                        nT[i] = oT[i]+moveTicks
                    end
                    if id == "notes" then
                        local nO, oO = t.tOff, old.tGroups[take][id].tOff
                        for i = 1, #oO do
                            nO[i] = oO[i]+moveTicks
                        end
                    end
                end
            end
        else
            local stretchFactor = (mouseTick - oldLeftTick) / (oldRightTick - oldLeftTick)
            if stretchFactor == 0 then stretchFactor = prevStretchFactor or 1 end -- Avoid zero-length notes or CCs on top of each other in same channel
            prevStretchFactor = stretchFactor
            local noteFactor = (stretchFactor > 0) and stretchFactor or -stretchFactor        
            
            for take, tID in pairs(new.tGroups) do
                oldLeftTick = tTickFromTime[take][old.globalLeftmostTime]
                for id, t in pairs(tID) do
                    local nT, nL, oT, oL = t.tT, t.tOff, old.tGroups[take][id].tT, old.tGroups[take][id].tOff
                    for i = 1, #oT do
                        nT[i] = oldLeftTick + stretchFactor*(oT[i]-oldLeftTick)
                    end
                    if id == "notes" then
                        local nO, oO = t.tOff, old.tGroups[take][id].tOff
                        for i = 1, #oO do
                            nO[i] = oldLeftTick + stretchFactor*(oO[i]-oldLeftTick)
                        end
                        if stretchFactor < 0 then t.tT, t.tOff = t.tOff, t.tT end
                    end
                end
            end
        end
        
        CONSTRUCT_MIDI_STRING()
    end
    
    -- GO TO NEXT STEP?
    if Check_MouseLeftButtonSinceLastDefer() then 
        GetAllEdgeValues(tSteps[#tSteps])
        --[[
        if stretchFactor < 0 then
            GetAllEdgeValues(tSteps[#tSteps])
        else
            local new, old = tSteps[#tSteps], tSteps[#tSteps-1]
            new.globalLeftmostTick    = old.globalLeftmostTick
            new.globalRightmostTick   = old.globalLeftmostTick + stretchFactor*(old.globalRightmostTick - old.globalLeftmostTick)
            new.globalNoteOffTick = old.globalLeftmostTick + stretchFactor*(old.globalNoteOffTick - old.globalLeftmostTick)
        end
        ]]
        return "NEXT"
    else
        return "CONTINUE"
    end
end


local warpLEFTRIGHT, warpUPDOWN, mouseStartTick = false, false, nil
local mouseMovementResolution, warpCurve = 5, 1
local warpMouseStartFraction = nil
local hasConstructedNewWarpStep = false
local warp2SIDED, warp2Power, warp2MouseAbove = false, 1, nil
local tWarpPreCalc = nil
local stepStartMouseX, stepStartMouseY = nil, nil -- To decide between L/R and U/D, mosu compare initial mouse movement with initial position.
--#################################
-----------------------------------
function Defer_Warp()
    -- Initialization of the Warp step is a bit more copmlicated than for other steps, since 
    --    1) the step must wait for initial mouse movement in order to decide between U/D and L/R (EXCEPT in lanes where can only warp left/right), but 
    --    2) the Zones must be cleared as quickly as possible in order to seem responsive.
    -- The script solves this problem but dividing initialization into two parts that is spread over two defer cycles: first clear the zones, then do the waiting. 

    -- CYCLE 1: First time this function runs in this step:
    if not (continueStep == "CONTINUE") then
        reaper.JS_LICE_Clear(bitmap, 0)
        stepStartTime = thisDeferTime
        stepStartMouseX = mouseX
        stepStartMouseY = mouseY
        mouseStateAtStepDragTime = mouseState
        hasConstructedNewWarpStep = false
        tWarpPreCalc = nil
        warp2SIDED, warp2Power, warp2MouseAbove = false, 1, nil
        -- DIRECTION: Determine the direction of warping.
        -- Notes, sysex and text can only be warped left/right
        -- (To warp note pitches, use the built-in Arpeggiate mouse modifiers)
        -- For other lanes, warp direction depends on mouse movement, similar
        --    to the "move in one direction only" mouse modifiers.
        if laneIsALL or laneIsPIANOROLL or laneIsSYSEX or laneIsTEXT or laneIsBANKPROG 
        or (tSteps[#tSteps].globalMaxValue == tSteps[#tSteps].globalMinValue)
        then
            warpLEFTRIGHT, warpUPDOWN = true, false
            canWarpBothDirections = false
        else 
            canWarpBothDirections = true
            warpLEFTRIGHT, warpUPDOWN = false, false
            reaper.JS_Window_InvalidateRect(windowUnderMouse, 0, 0, ME_Width, ME_Height, false) -- To appear more responsive, immediately clear graphics and go to new defer cycle, even before knowing whether l/r or u/d.
            if Check_MouseLeftButtonSinceLastDefer() then return "NEXT" else return "CONTINUE" end
        end
    end
    
    -- CYCLE 2: Second time this function runs in current step:
    
    -- Because we need to wait a little while, can do some slow calculations here:  
    --    * Pre-caculate some tick positions for each take
    --    * For 2-sided warp, events to left and right of mouse are warped oppositely, so to avoid testing < for every event en every cycle, find the event just to left of mouse
    if not tWarpPreCalc then
        tWarpPreCalc = {}
        
        local function binarySearchEventJustLeftOfMouseTick(tbl, mouseTick)
            if tbl[1] >= mouseTick then
                return 0
            elseif tbl[#tbl] <= mouseTick then
                return #tbl
            else -- binary search
                local left, right = 1, #tbl
                while right-left > 1 do
                    local m = (left+right)//2
                    if tbl[m] >= mouseTick then right = m else left = m end
                end
                return left
            end
        end
        
        local mouseStartTime = tTimeFromPixel[stepStartMouseX] 
        for take, tID in pairs(tSteps[#tSteps].tGroups) do
            tWarpPreCalc[take] = {mouseStartTick = tTickFromTime[take][mouseStartTime],
                                  leftmostTick = tTickFromTime[take][tSteps[#tSteps].globalLeftmostTime],
                                  rightmostTick = tTickFromTime[take][tSteps[#tSteps].globalNoteOffTime],
                                  }
            for id, t in pairs(tID) do
                tWarpPreCalc[take][id] = { eventJustLeftOfMouse = binarySearchEventJustLeftOfMouseTick(t.tT, tWarpPreCalc[take].mouseStartTick) }
                if id == "notes" then tWarpPreCalc[take][id].noteOffJustLeftOfMouse = binarySearchEventJustLeftOfMouseTick(t.tOff, tWarpPreCalc[take].mouseStartTick) end
            end
        end
    end
    
    -- DETECT MOUSE MOVEMENT L/R vs U/D
    if not (warpLEFTRIGHT or warpUPDOWN) then

        local mouseXmove, mouseYmove, timeWaited = 0, 0, 0
        repeat
            local x, y = reaper.GetMousePosition()
            x, y = reaper.JS_Window_ScreenToClient(windowUnderMouse, x, y)
            mouseXmove = math.abs(x - stepStartMouseX)
            mouseYmove = math.abs(y - stepStartMouseY)
            timeWaited = reaper.time_precise() - stepStartTime 
        until timeWaited > 3 or ((mouseXmove > mouseMovementResolution or mouseYmove > mouseMovementResolution) and mouseXmove ~= mouseYmove)
        if timeWaited > 3 then
            return "NEXT"
        elseif mouseXmove > mouseYmove then 
            warpLEFTRIGHT, warpUPDOWN = true, false 
        else 
            warpLEFTRIGHT, warpUPDOWN = false, true
        end
    end
    
    -- SETUP tSteps TABLES FOR NEW STEP
    if not hasConstructedNewWarpStep then
        -- If warpLEFTRIGHT, the event under the mouse should follow mouse X position exactly, so get relative positio (using activeTake as reference).
        if warpLEFTRIGHT then
            local mouseTime = tTimeFromPixel[mouseX]
            local mouseTick = tTickFromTime[activeTake][mouseTime]
            local left  = tTickFromTime[activeTake][ tSteps[#tSteps].globalLeftmostTime ] -- At this time, the new step table has not yet been constructed.
            local right = tTickFromTime[activeTake][ tSteps[#tSteps].globalNoteOffTime ]
            local range = right - left
            warpMouseStartFraction = (mouseTick-left)/range
            --warpMouseStartFraction = (mouseStartTick-tSteps[#tSteps].globalLeftmostTick) / (tSteps[#tSteps].globalNoteOffTick - tSteps[#tSteps].globalLeftmostTick)   
        else -- warpUPDOWN
            mouseStartCCValue = GetMouseValue()
            mouseStartY = mouseY
            -- CURSOR: Defer_Zones has already set the cursor to left/right 
            cursor = reaper.JS_Mouse_LoadCursor(503) -- REAPER's own arpeggiate up/down cursor
            if cursor then reaper.JS_Mouse_SetCursor(cursor) end
        end
        
        -- CONSTRUCT NEW STEP: by copying previous - except those tables/values that will be newly contructed
        local old = tSteps[#tSteps]
        local new = {tGroups = {}, isChangingPositions = warpLEFTRIGHT}
        tSteps[#tSteps+1] = new
        for key, entry in pairs(old) do
            if not new[key] then new[key] = entry end
        end
        for take, tID in pairs(old.tGroups) do
            new.tGroups[take] = {}
            for id, t in pairs(tID) do
                if warpUPDOWN then 
                    new.tGroups[take][id] = {tV = {}}
                else
                    new.tGroups[take][id] = {tT = {}, tOff = {}}
                end
                for a, b in pairs(t) do
                    if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
                end
            end
        end        
        
        hasConstructedNewWarpStep = true
        mustCalculate = true -- Always start step with re-calculation 
    end -- if not (continueStep == "CONTINUE") ... elseif not (warpLEFTRIGHT or warpUPDOWN)
    
    -- MIDDLE BUTTON: (Middle button changes curve shape.)
    peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_MBUTTONDOWN")
    if peekOK and time > prevMouseInputTime then 
        warpCurve = (warpCurve == 1) and 0 or 1
        prevMouseInputTime = time
        mustCalculate = true
    end
    
    -- RIGHT CLICK: Right click changes script mode
    peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_RBUTTONDOWN")
    if peekOK and time > prevDeferTime then
        warp2SIDED = not warp2SIDED
        prevMouseInputTime = time
        mustCalculate = true
    end
 
    -- MOUSE MOVEMENT:
    if warpLEFTRIGHT then
        if mouseX ~= prevMouseX or (warp2SIDED and mouseY ~= prevMouseY) then mustCalculate = true end 
    else
        if mouseY ~= prevMouseY then mustCalculate = true end
    end
    
    
    -- CALCULATE MIDI STUFF!
    
    -- Scripts that extract selected MIDI events and re-concatenate them out of order (usually at the beginning of the MIDI string, for easier editing)
    --    cannot be auditioned in real-time while events are out of order, since such events are not played.
    -- If the mouse is held still, no editing is done, and instead the take is sorted, thereby temporarily allowing playback.
    -- NO NEED TO CALCULATE:
    if mustCalculate then 

        -- CALCULATE NEW MIDI DATA! and write the tWarpMIDI!
        -- The warping uses a power function, and the power variable is determined
        --     by calculating to what power 0.5 must be raised to reach the 
        --     mouse's deviation to the left or right from its starting PPQ position. 
        -- The reason why 0.5 was chosen, was so that the CC in the middle of the range
        --     would follow the mouse position.
        -- The PPQ range of the selected events is used as reference to calculate
        --     magnitude of mouse movement.
        
        local newValue, power, mouseRelativeMovement
        if warpUPDOWN then -- or warpBOTH is not used in the new Multi Tool anymore
        
            local mouseUpDownMove = (mouseStartY-mouseY) / (ME_TargetBottomPixel-ME_TargetTopPixel) --ME_TargetGetMouseValue()-mouseStartCCValue)/(laneMaxValue-laneMinValue) -- Positive if moved to right, negative if moved to left
            -- Prevent warping too much, so that all CCs don't end up in a solid block
            if mouseUpDownMove > 0.99 then mouseUpDownMove = 0.99 elseif mouseUpDownMove < -0.99 then mouseUpDownMove = -0.99 end
            if warpCurve == 1 then
                power = math.log(0.5 + mouseUpDownMove/2, 0.5)
            else
                power = math.log(0.5 - mouseUpDownMove/2, 0.5)
            end
            
            local min, max = tSteps[#tSteps-1].globalMinValue, tSteps[#tSteps-1].globalMaxValue
            local range = max-min
            if range == 0 or mouseMovement == 0 then
                for take, tID in pairs(tSteps[#tSteps-1].tGroups) do
                    for id, t in pairs(tID) do  
                        local tV, tOldV = tSteps[#tSteps].tGroups[take][id].tV, t.tV
                        for i = 1, #tOldV do  
                            tV[i] = tOldV[i]
                        end
                    end
                end
            else
                local newValue
                for take, tID in pairs(tSteps[#tSteps-1].tGroups) do  
                    for id, t in pairs(tID) do  
                        local tV, tOldV = tSteps[#tSteps].tGroups[take][id].tV, t.tV
                        for i = 1, #tOldV do                             
                            if warpCurve == 1 then 
                                newValue = min + (((tOldV[i] - min)/range)^power)*range          
                            else -- mouseMovement > 0
                                newValue = max - (((max - tOldV[i])/range)^power)*range           
                            end
                            if     newValue > laneMaxValue then tV[i] = laneMaxValue
                            elseif newValue < laneMinValue then tV[i] = laneMinValue
                            else tV[i] = newValue
                            end       
                        end
                    end
                end
            end
            
        else -- warpLEFTRIGHT   
            
            -- Pre-calculate some warp 2-sided stuff for this cycle (for all groups)
            if warp2SIDED then
                local ME_TargetMidPixel = (ME_TargetBottomPixel+ME_TargetTopPixel)/2
                local mouseUpDownMove = (mouseY-ME_TargetMidPixel)/(math.max(200, ME_TargetBottomPixel-ME_TargetTopPixel))
                local temp =  0.5 + math.abs(mouseUpDownMove) --/laneMaxValue
                -- Prevent warping too much, so that all CCs don't end up in a solid block
                if temp > 0.99 then temp = 0.99
                end
                warp2Power = math.log(temp, 0.5)
                warp2MouseAbove = (mouseUpDownMove > 0)
            end
            
            local mouseTime = tTimeFromPixel[mouseX]
        
            for take, tID in pairs(tSteps[#tSteps-1].tGroups) do 
            
                -- APPLY 1-SIDED WARP
                local mouseTick = tTickFromTime[take][mouseTime]
                local left  = tWarpPreCalc[take].leftmostTick
                local right = tWarpPreCalc[take].rightmostTick
                local range = right - left
                local mouseLeftRightMove = (mouseTick-left)/range
                if mouseLeftRightMove > 0.95 then mouseLeftRightMove = 0.95 elseif mouseLeftRightMove < 0.05 then mouseLeftRightMove = 0.05 end
                 power = (warpCurve == 1) and (math.log(mouseLeftRightMove, warpMouseStartFraction)) or (math.log(1-mouseLeftRightMove, 1-warpMouseStartFraction))
                
                if range == 0 or power == 1 then -- just copy, if no warp             
                    for id, t in pairs(tID) do  
                        local tT, tOldT, tOff, tOldOff = tSteps[#tSteps].tGroups[take][id].tT, t.tT, tSteps[#tSteps].tGroups[take][id].tOff, t.tOff
                        for i = 1, #tOldT do  
                            tT[i] = tOldT[i]
                            tOff[i] = tOldOff[i]
                        end
                    end
                else
                    for id, t in pairs(tID) do  
                        local tT, tOldT = tSteps[#tSteps].tGroups[take][id].tT, t.tT
                        if warpCurve == 1 then
                            for i = 1, #tOldT do
                                tT[i] = left + (((tOldT[i] - left)/range)^power)*range
                            end
                        else
                            for i = 1, #tOldT do
                                tT[i] = right - (((right - tOldT[i])/range)^power)*range
                            end    
                        end
                        if id == "notes" then
                            local tOff, tOldOff = tSteps[#tSteps].tGroups[take][id].tOff, t.tOff                            
                            if warpCurve == 1 then
                                for i = 1, #tOldOff do
                                    tOff[i] = left + (((tOldOff[i] - left)/range)^power)*range
                                end
                            else
                                for i = 1, #tOldOff do
                                    tOff[i] = right - (((right - tOldOff[i])/range)^power)*range
                                end    
                            end
                        end
                    end
                end
            
                -- APPLY 2-SIDED WARP
                if warp2Power ~= 1 then
                
                    local rangeL = mouseTick - left
                    local rangeR = right - mouseTick
                    
                    for id, t in pairs(tID) do 
                        local tT = tSteps[#tSteps].tGroups[take][id].tT
                        local index = tWarpPreCalc[take][id].eventJustLeftOfMouse
                        ::RepeatForNoteOff::
                        if warp2MouseAbove then
                            if rangeL ~= 0 then
                                for i = 1, index do
                                    tT[i] = left + (((tT[i] - left)/rangeL)^warp2Power)*rangeL
                                end
                            end
                            if rangeR ~= 0 then
                                for i = index+1, #tT do
                                    tT[i] = right - (((right - tT[i])/rangeR)^warp2Power)*rangeR
                                end
                            end
                        else
                            if rangeL ~= 0 then
                                for i = 1, index do
                                    tT[i] = mouseTick - (((mouseTick - tT[i])/rangeL)^warp2Power)*rangeL
                                end
                            end
                            if rangeR ~= 0 then
                                for i = index+1, #tT do
                                    tT[i] = mouseTick + (((tT[i] - mouseTick)/rangeR)^warp2Power)*rangeR
                                end
                            end
                        end
                        if id == "notes" and not (tT == tSteps[#tSteps].tGroups[take][id].tOff) then 
                            tT = tSteps[#tSteps].tGroups[take][id].tOff 
                            index = tWarpPreCalc[take][id].noteOffJustLeftOfMouse
                            goto RepeatForNoteOff 
                        end
                    end
                end
            end -- if warp2SIDED then
        end
      
        CONSTRUCT_MIDI_STRING()
        
    end -- mustCalculate stuff


    -- GO TO NEXT STEP?
    if Check_MouseLeftButtonSinceLastDefer() then
        if warpUPDOWN then
            GetAllEdgeValues(tSteps[#tSteps])
        end
        return "NEXT"
    else
        return "CONTINUE"
    end
    
end -- Defer_Warp


local scaleTOP, scaleBOTTOM, scaleSYMMETRIC = nil, nil, false
--####################
----------------------
function Defer_Scale()

    -- Setup stuff when this function 
    if not (continueStep == "CONTINUE") then
        stepStartTime = thisDeferTime
        mouseStateAtStepDragTime = mouseState
        
        -- If mouse is close to CC height, move mouse to precisely CC height
        local pixelY
        if zone.cursor == tCursors.HandTop then
            scaleTOP, scaleBOTTOM = true, false
            pixelY = (ME_TargetBottomPixel - (ME_TargetBottomPixel-ME_TargetTopPixel)*(tSteps[#tSteps].globalMaxValue-laneMinValue)/(laneMaxValue-laneMinValue))//1      
        else
            scaleTOP, scaleBOTTOM = false, true
            pixelY = (ME_TargetBottomPixel - (ME_TargetBottomPixel-ME_TargetTopPixel)*(tSteps[#tSteps].globalMinValue-laneMinValue)/(laneMaxValue-laneMinValue))//1
        end
        if -zoneWidth < (pixelY-mouseY) and (pixelY-mouseY) < zoneWidth then
            mouseY = pixelY
            reaper.JS_Mouse_SetPosition(reaper.JS_Window_ClientToScreen(windowUnderMouse, mouseX, mouseY))
        end

        -- Construct new tStep by copying previous - except those tables/values that will be newly contructed
        local old = tSteps[#tSteps]
        local new = {tGroups = {}, isChangingPositions = false}
        tSteps[#tSteps+1] = new
        for key, entry in pairs(old) do
            if not new[key] then new[key] = entry end
        end
        for take, tID in pairs(old.tGroups) do -- ID divides events into separate lanes and channels
            new.tGroups[take] = {}
            for id, t in pairs(tID) do
                new.tGroups[take][id] = {tV = {}}
                for a, b in pairs(t) do
                    if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
                end
            end
        end
        SetupGuidelineTables() -- Can only get left/right pixels and set up tables *after* constructing new step's table
        mustCalculate = true -- Always start step with re-calculation 
    end        
    
    -- RIGHT CLICK: Right click changes script mode
    local peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_RBUTTONDOWN")
    if peekOK and time > prevDeferTime then
        scaleSYMMETRIC = not scaleSYMMETRIC
        prevMouseInputTime = time
        mustCalculate = true
    end
    
    -- MOUSE MOVEMENT:
    if mouseY ~= prevMouseY then mustCalculate = true end
    
    ---------------------
    if mustCalculate then
    
        local newRangeMin, newRangeMax
        local new, old = tSteps[#tSteps], tSteps[#tSteps-1]
        local oldMinValue, oldMaxValue = old.globalMinValue, old.globalMaxValue
        if oldMinValue == oldMaxValue then
            newRangeMax = GetMouseValue("LIMIT")
            newRangeMin = newRangeMax
            for take, tID in pairs(new.tGroups) do
                for id, t in pairs(tID) do
                    local tV, tOldV = t.tV, old.tGroups[take][id].tV
                    for i = 1, #tOldV do
                        tV[i] = newRangeMax
                    end
                end
            end
        else
            if scaleTOP then
                newRangeMax = GetMouseValue("LIMIT")
                if scaleSYMMETRIC then
                    newRangeMin = old.globalMinValue-(newRangeMax-oldMaxValue)
                    if newRangeMin < laneMinValue then
                        newRangeMax = newRangeMax - (laneMinValue-newRangeMin)
                        newRangeMin = laneMinValue
                    elseif newRangeMin > laneMaxValue then
                        newRangeMax = newRangeMax + (newRangeMin-laneMaxValue)
                        newRangeMin = laneMaxValue
                    end
                else
                    newRangeMin = oldMinValue
                end
            else -- scaleBOTTOM
                newRangeMin = GetMouseValue("LIMIT")
                if scaleSYMMETRIC then
                    newRangeMax = old.globalMaxValue-(newRangeMin-oldMinValue)
                    if newRangeMax < laneMinValue then
                        newRangeMin = newRangeMin - (laneMinValue-newRangeMax)
                        newRangeMax = laneMinValue
                    elseif newRangeMax > laneMaxValue then
                        newRangeMin = newRangeMin + (newRangeMax-laneMaxValue)
                        newRangeMax = laneMaxValue
                    end
                else
                    newRangeMax = oldMaxValue
                end
            end
        
            local stretchFactor = (newRangeMax - newRangeMin)/(oldMaxValue-oldMinValue)
                
            for take, tID in pairs(new.tGroups) do
                for id, t in pairs(tID) do
                    local tV, tOldV = t.tV, old.tGroups[take][id].tV
                    for i = 1, #tOldV do
                        tV[i] = newRangeMin + stretchFactor*(tOldV[i] - oldMinValue)
                    end
                end
            end
        end
        
        -- Draw LICE line
        local bottomLineY = ME_TargetBottomPixel - (ME_TargetBottomPixel-ME_TargetTopPixel)*(newRangeMin-laneMinValue)/(laneMaxValue-laneMinValue)
        local topLineY = ME_TargetBottomPixel - (ME_TargetBottomPixel-ME_TargetTopPixel)*(newRangeMax-laneMinValue)/(laneMaxValue-laneMinValue)
        reaper.JS_LICE_Clear(bitmap, 0)
        reaper.JS_LICE_Line(bitmap, Guides_LeftPixel, topLineY, Guides_RightPixel, topLineY, Guideline_Color_Top, 1, "COPY", true)
        reaper.JS_LICE_Line(bitmap, Guides_LeftPixel, bottomLineY, Guides_RightPixel, bottomLineY, Guideline_Color_Bottom, 1, "COPY", true)
    
        CONSTRUCT_MIDI_STRING()
    end

    -- GO TO NEXT STEP?
    if Check_MouseLeftButtonSinceLastDefer() then
        GetAllEdgeValues(tSteps[#tSteps])
        return "NEXT"
    else
        return "CONTINUE"
    end
    
end -- Defer_Scale


--#######################
-------------------------
-- Default colors:
local DARKRED, RED, GREEN, BLUE, PURPLE, TURQOISE, YELLOW, ORANGE, BLACK = 0xFFAA2200, 0xFFFF0000, 0xFF00BB00, 0xFF0000FF, 0xFFFF00FF, 0xFF00FFFF, 0xFFFFFF00, 0xFFFF8800, 0xFF000000
function LoadZoneColors()
    
    local extState = reaper.GetExtState("js_Multi Tool", "Settings") or ""
    local colorCompress = extState:match("compress.-(%d+)")
    local colorScale    = extState:match("scale.-(%d+)")
    local colorStretch  = extState:match("stretch.-(%d+)")
    local colorTilt     = extState:match("tilt.-(%d+)")
    local colorWarp     = extState:match("warp.-(%d+)")
    local colorUndo     = extState:match("undo.-(%d+)")
    local colorRedo     = extState:match("redo.-(%d+)")

    tColors = {compress = (colorCompress  and tonumber(colorCompress) or YELLOW),
               scale    = (colorScale     and tonumber(colorScale)    or ORANGE),
               stretch  = (colorStretch   and tonumber(colorStretch)  or DARKRED),
               tilt     = (colorTilt      and tonumber(colorTilt)     or PURPLE),
               warp     = (colorWarp      and tonumber(colorWarp)     or GREEN),
               undo     = (colorUndo      and tonumber(colorUndo)     or RED),
               redo     = (colorRedo      and tonumber(colorRedo)     or GREEN),
               black    = BLACK
              }

    -- While we are busy parsing the extstate, load zone width too.
    zoneWidth = tonumber(extState:match("zoneWidth.-(%d+)") or "20")
end


--########################
--------------------------
function ChooseZoneColor()
    if zone and zone.color then
    
        ok, c = reaper.GR_SelectColor(windowUnderMouse)

        if editor and reaper.MIDIEditor_GetMode(editor) ~= -1 then reaper.JS_Window_SetForeground(editor) end
        if windowUnderMouse and reaper.ValidatePtr(windowUnderMouse, "HWND") then reaper.JS_Window_SetFocus(windowUnderMouse) end
        
        --reaper.ShowConsoleMsg(tostring(ok) .. " " .. string.format("%x", c))
        if ok == 1 and type(c) == "number" then 
            if winOS then c = 0xFF000000 | ((c&0xff)<<16) | (c&0xff00) | ((c&0xff0000)>>16) -- Windows returns RGB as BGR
            else c = (c | 0xFF000000) & 0xFFFFFFFF -- Make sure that basic color is completely opaque
            end
            tColors[zone.color] = c
            local extState = "compress="..string.format("%i", tColors.compress)
                            .." scale="..string.format("%i", tColors.scale)
                            .." stretch="..string.format("%i", tColors.stretch)
                            .." tilt="..string.format("%i", tColors.tilt)
                            .." warp="..string.format("%i", tColors.warp)
                            .." undo="..string.format("%i", tColors.undo)
                            .." redo="..string.format("%i", tColors.redo)
                            .." zoneWidth=" .. tostring(zoneWidth)
            reaper.SetExtState("js_Multi Tool", "Settings", extState, true)
            DisplayZones()
        end
    else
        reaper.MB("No zone found under mouse", "ERROR", 0)
    end
end


--########################
--------------------------
function ChooseZoneSize()
    local ext = reaper.GetExtState("js_Multi Tool", "Settings") or ""
    zoneWidth = tonumber(ext:match("zoneWidth=(%d+)") or "20")
    local iOK, i = reaper.GetUserInputs("Zone size", 1, "Zone size (in pixels)", tostring(zoneWidth))
    if iOK then 
        i = tonumber(i)
        if i then 
            zoneWidth = ((i < 14) and 14) or ((i > 80) and 80) or i//1
            ext = ext:gsub("%s?zoneWidth=%d+", "")
            ext = ext .. " zoneWidth=" .. tostring(zoneWidth)
            reaper.SetExtState("js_Multi Tool", "Settings", ext, true)
        end
    end
end

    
--####################
----------------------
-- Eventually, this function can include all kinds of settings. But for now, only color.
function ContextMenu()
    local x, y = reaper.GetMousePosition()
    local uniqueTitle = "q9283rxyq9238rxtg78i"
    gfx.init(uniqueTitle, 0, 0, 0, x, y)
    local w = reaper.JS_Window_FindTop(uniqueTitle, true)
    --if w then reaper.JS_Window_SetOpacity(w, "ALPHA", 0) end
    gfx.x, gfx.y = -20, -40
    local s = gfx.showmenu("|Zone color||Zone size||")
    gfx.quit()
    if s == 1 then
        ChooseZoneColor()
    elseif s == 2 then
        ChooseZoneSize()
    end
    reaper.JS_Mouse_SetPosition(x, y)
    return "NEXT"
end


local tRedo = {}
--###################
---------------------
function Defer_Redo()
    if #tRedo > 0 then 
        tSteps[#tSteps+1] = tRedo[#tRedo]
        tRedo[#tRedo] = nil
    end
    CONSTRUCT_MIDI_STRING()
    return "NEXT"
end


--###################
---------------------
function Defer_Undo()
    if #tSteps > 0 then 
        -- If the last step has changed positions (thereby deleting all overlapped CCs), but none 
        --    of the steps before that have changed positions, all deleted CCs must be reset.
        if tSteps[#tSteps].isChangingPositions and not tSteps[#tSteps-1].isChangingPositions then
            for i = 1, #tSteps-2 do
                if tSteps[i].isChangingPositions then tSteps[#tSteps-1].isChangingPositions = true break end
            end
            if not tSteps[#tSteps-1].isChangingPositions then
                for take, tID in pairs(tSteps[#tSteps-1].tGroups) do
                    for id, t in pairs(tID) do
                        for i = 1, #t.tD do
                            tMIDI[take][t.tD[i].index] = t.tD[i].flagsMsg
                        end
                    end
                end
            end
        end
        
        tRedo[#tRedo+1] = tSteps[#tSteps]
        tSteps[#tSteps] = nil
    end
    CONSTRUCT_MIDI_STRING()
    return "NEXT"
end


--###########################
-----------------------------
function Edit_ChaseRight()
    local old = tSteps[#tSteps]
    local new = {tGroups = {}, isChangingPositions = false}
    tSteps[#tSteps+1] = new
    for key, entry in pairs(old) do
        if not new[key] then new[key] = entry end
    end
    
    for take, tID in pairs(old.tGroups) do
        
        new.tGroups[take] = {}
        
        for id, t in pairs(tID) do
        
            -- Get edge ticks and values
            local prevLeft, prevRight, prevLeftVal, prevRightVal = t.tT[1], t.tT[#t.tT], t.tV[1], t.tV[#t.tV]
            local origLeft, origRight = tSteps[0].tGroups[take][id].tT[1], tSteps[0].tGroups[take][id].tT[#t.tT] -- step 0 was sorted
            if prevLeft > prevRight then prevLeft, prevRight, prevLeftVal, prevRightVal = prevRight, prevLeft, prevRightVal, prevLeftVal end
            local left  = (origLeft < prevLeft)   and origLeft or prevLeft
            local right = (origRight > prevRight) and origRight or prevRight
            
            local tC = t.tChase
            -- If there is nothing to chase, simpy copy previous step's values
            if not tC or #tC == 0 or tC[#tC].ticks <= right or prevLeft == prevRight then
                new.tGroups[take][id] = {tV = t.tV}
            -- Otherwise, do binary search to quickly find closest event
            else
                new.tGroups[take][id] = {tV = {}}
                local targetValue
                if tC[1].ticks > right then
                    targetValue = tC[1].value
                else
                    local hi, lo = #tC, 1
                    while hi-lo > 1 do 
                        local mid = (lo+hi)//2
                        if tC[mid].ticks <= right then
                            lo = mid
                        else 
                            hi = mid
                        end
                    end
                    targetValue = tC[hi].value
                end
                
                -- Tilt values
                local valueDelta = targetValue - prevRightVal
                local tickRange = prevRight-prevLeft
                local pT, pV, nV = t.tT, t.tV, new.tGroups[take][id].tV
                for i = 1, #pV do
                    nV[i] = pV[i] + valueDelta*(pT[i]-prevLeft)/tickRange
                end
            end
        
            -- Copy remaining tables to new step    
            for a, b in pairs(t) do
                if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
            end
        end
    end
    
    GetAllEdgeValues()
    CONSTRUCT_MIDI_STRING()
    return "NEXT"
end


--###########################
-----------------------------
function Edit_ChaseLeft()
    local old = tSteps[#tSteps]
    local new = {tGroups = {}, isChangingPositions = false}
    tSteps[#tSteps+1] = new
    for key, entry in pairs(old) do
        if not new[key] then new[key] = entry end
    end
    
    for take, tID in pairs(old.tGroups) do
        
        new.tGroups[take] = {}
        
        for id, t in pairs(tID) do
    
            -- Get edge ticks and values
            local prevLeft, prevRight, prevLeftVal, prevRightVal = t.tT[1], t.tT[#t.tT], t.tV[1], t.tV[#t.tV]
            local origLeft, origRight = tSteps[0].tGroups[take][id].tT[1], tSteps[0].tGroups[take][id].tT[#t.tT] -- step 0 was sorted
            if prevLeft > prevRight then prevLeft, prevRight, prevLeftVal, prevRightVal = prevRight, prevLeft, prevRightVal, prevLeftVal end
            local left  = (origLeft < prevLeft)   and origLeft or prevLeft
            local right = (origRight > prevRight) and origRight or prevRight
            
            local tC = t.tChase
            -- If there is nothing to chase, simpy copy previous step's values
            if not tC or #tC == 0 or tC[1].ticks >= left or prevLeft == prevRight then
                new.tGroups[take][id] = {tV = t.tV}
            -- Otherwise, do binary search to quickly find closest event
            else
                new.tGroups[take][id] = {tV = {}}
                local targetValue
                if tC[#tC].ticks < left then
                    targetValue = tC[#tC].value
                else
                    local hi, lo = #tC, 1
                    while hi-lo > 1 do 
                        local mid = (lo+hi)//2
                        if tC[mid].ticks < left then
                            lo = mid
                        else 
                            hi = mid
                        end
                    end
                    targetValue = tC[lo].value
                end
                
                -- Tilt values
                local valueDelta = targetValue - prevLeftVal
                local tickRange = prevRight-prevLeft
                local pT, pV, nV = t.tT, t.tV, new.tGroups[take][id].tV
                for i = 1, #pV do
                    nV[i] = pV[i] + valueDelta*(prevRight-pT[i])/tickRange
                end
            end
        
            -- Copy remaining tables to new step    
            for a, b in pairs(t) do
                if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
            end
        end
    end
    
    GetAllEdgeValues()
    CONSTRUCT_MIDI_STRING()
    return "NEXT"
end


--######################
------------------------
function Edit_SpaceEvenly()
    -- Construct new tStep by copying previous - except those tables/values that will be newly contructed
    local old = tSteps[#tSteps]
    local new = {tGroups = {}, isChangingPositions = true}
    tSteps[#tSteps+1] = new
    for key, value in pairs(old) do
        if not new[key] then new[key] = value end
    end
    for take, tID in pairs(old.tGroups) do -- ID divides events into separate lanes and channels
        new.tGroups[take] = {}
        for id, t in pairs(tID) do
            new.tGroups[take][id] = {tT = {}} -- Ticks aka spacing will be changed.  (If not piano roll, tV values will also be reset.)
            for a, b in pairs(t) do
                if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
            end
        end
    end

    for take, tID in pairs(new.tGroups) do
        local left  = math.max(tTakeInfo[take].minimumTick, tTickFromTime[take][new.globalLeftmostTime])
        local right = math.min(tTakeInfo[take].maximumTick, tTickFromTime[take][new.globalNoteOffTime])
        if left > right then left, right = right, left end
        local range = right-left
        if range ~= 0 then
            for id, t in pairs(tID) do
        
                -- Reset spacing
                if id == "notes" then
                    t.tOff = {}
                    local nT, oT, nO, oO = t.tT, old.tGroups[take][id].tT, t.tOff, old.tGroups[take][id].tOff
                    local spacing = range/#oT
                    for i = 1, #oT do
                        nT[i] = left + (i-1)*spacing
                        nO[i] = nT[i]+spacing
                    end
                    t.noteWithLastNoteOff = #oT
                else
                    local nT, oT = t.tT, old.tGroups[take][id].tT
                    local spacing = range/(#oT-1)
                    for i = 1, #oT do
                        nT[i] = left + (i-1)*spacing
                    end
                end
        
                -- Reset values -- but if notes area, don't reset velocities
                if not (laneIsPIANOROLL and id == "notes") then
                    local laneMidValue = (laneMinValue and laneMaxValue) and (laneMinValue+laneMaxValue)/2
                    if laneMidValue then
                        t.tV = {}
                        for i = 1, #old.tGroups[take][id].tV do
                            t.tV[i] = laneMidValue
                        end
                    end
                end
            end
        end
    end
    
    GetAllEdgeValues()
    CONSTRUCT_MIDI_STRING()
    return "NEXT"
end


--######################
------------------------
function Edit_Reverse()
    -- Construct new tStep by copying previous - except those tables/values that will be newly contructed
    local old = tSteps[#tSteps]
    local new = {tGroups = {}, globalLeftmostValue = old.globalRightmostValue, globalRightmostValue = old.globalLeftmostValue, isChangingPositions = true}
    tSteps[#tSteps+1] = new
    for key, value in pairs(old) do
        if not new[key] then new[key] = value end
    end
    for take, tID in pairs(old.tGroups) do -- ID divides events into separate lanes and channels
        new.tGroups[take] = {}
        for id, t in pairs(tID) do
            new.tGroups[take][id] = {tT = {}}
            for a, b in pairs(t) do
                if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
            end
        end
    end

    for take, tID in pairs(new.tGroups) do
        local left, right = tTickFromTime[take][new.globalLeftmostTime], tTickFromTime[take][new.globalNoteOffTime]
        for id, t in pairs(tID) do
            local nT, oT = t.tT, old.tGroups[take][id].tT
            for i = 1, #oT do
                nT[i] = right - (oT[i] - left)
            end
            if id == "notes" then
                -- WARNING! Must create a *new* tOff, otherwise will overwrite previous step's
                t.tOff = {}
                local nO, oO = t.tOff, old.tGroups[take][id].tOff
                for i = 1, #oO do
                    nO[i] = right - (oO[i] - left)
                end
                t.tT, t.tOff = t.tOff, t.tT
            end
        end
    end
    
    CONSTRUCT_MIDI_STRING()
    return "NEXT"
end


--###########################
-----------------------------
function Edit_FlipValuesAbsolute()

    -- Construct new tStep by copying previous - except those tables/values that will be newly contructed
    tSteps[#tSteps+1] = {tGroups = {}, isChangingPositions = false}
    local old = tSteps[#tSteps-1]
    local new = tSteps[#tSteps]
    for key, value in pairs(old) do
        if not new[key] then new[key] = value end
    end
    for take, tID in pairs(old.tGroups) do -- ID divides events into separate lanes and channels
        new.tGroups[take] = {}
        for id, t in pairs(tID) do
            new.tGroups[take][id] = {tV = {}}
            for a, b in pairs(t) do
                if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
            end
        end
    end

    new.globalLeftmostValue   = laneMaxValue - (old.globalLeftmostValue - laneMinValue)
    new.globalRightmostValue  = laneMaxValue - (old.globalRightmostValue - laneMinValue)
    new.globalMinValue    = laneMaxValue - (old.globalMaxValue - laneMinValue)
    new.globalMaxValue    = laneMaxValue - (old.globalMinValue - laneMinValue)
    
    for take, tID in pairs(new.tGroups) do
        for id, t in pairs(tID) do
            local nV, oV = t.tV, old.tGroups[take][id].tV
            for i = 1, #oV do
                nV[i] = laneMaxValue - (oV[i] - laneMinValue)
            end
        end
    end

    CONSTRUCT_MIDI_STRING()
    return "NEXT"
end


--###########################
-----------------------------
function Edit_FlipValuesRelative()
    -- Construct new tStep by copying previous - except those tables/values that will be newly contructed
    tSteps[#tSteps+1] = {tGroups = {}, isChangingPositions = false}
    local old = tSteps[#tSteps-1]
    local new = tSteps[#tSteps]
    for key, entry in pairs(old) do
        if not new[key] then new[key] = entry end
    end
    for take, tID in pairs(old.tGroups) do -- ID divides events into separate lanes and channels
        new.tGroups[take] = {}
        for id, t in pairs(tID) do
            new.tGroups[take][id] = {tV = {}}
            for a, b in pairs(t) do
                if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
            end
        end
    end

    new.globalLeftmostValue   = old.globalMaxValue - (old.globalLeftmostValue - old.globalMinValue)
    new.globalRightmostValue  = old.globalMaxValue - (old.globalRightmostValue - old.globalMinValue)
    
    for take, tID in pairs(new.tGroups) do
        for id, t in pairs(tID) do
            local nV, oV = t.tV, old.tGroups[take][id].tV
            for i = 1, #oV do
                nV[i] = old.globalMaxValue - (oV[i] - old.globalMinValue)
            end
        end
    end

    CONSTRUCT_MIDI_STRING()
    return "NEXT"
end


local tiltWheel, tiltShape, tiltHeight, tiltRIGHT, tiltLEFT
--#####################################
---------------------------------------
function Defer_Tilt()

    -- Setup stuff at first defer cycle for this step
    if not (continueStep == "CONTINUE") then
        stepStartTime = thisDeferTime
        mouseStateAtStepDragTime = mouseState -- Temporarily - will be adjusted at each cycle
        -- Construct new tStep by copying previous - except those tables/values that will be newly contructed
        tSteps[#tSteps+1] = {tGroups = {}, isChangingPositions = false}
        local old = tSteps[#tSteps-1]
        local new = tSteps[#tSteps]
        for key, entry in pairs(old) do
            if not new[key] then new[key] = entry end
        end
        for take, tID in pairs(old.tGroups) do -- ID divides events into separate lanes and channels
            new.tGroups[take] = {}
            for id, t in pairs(tID) do
                new.tGroups[take][id] = {tV = {}}
                for a, b in pairs(t) do
                    if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
                end
            end
        end
        SetupGuidelineTables() -- Can only get left/right pixels and set up tables *after* constructing new step's table
        tiltWheel = tiltWheel or 1 -- If not first time tilting, remember previous wheel and shape
        tiltShape = tiltShape or "linear"
        if mouseX < (Guides_LeftPixel+Guides_RightPixel)/2 then tiltLEFT, tiltRIGHT = true, false else tiltLEFT, tiltRIGHT = false, true end
        mustCalculate = true
    end
     
    -- MOUSEWHEEL
    local peekOK, pass, time, keys, delta = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_MOUSEWHEEL")
    if not (peekOK and time > prevMouseInputTime) then 
        peekOK, pass, time, keys, delta = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_MOUSEHWHEEL")
    end 
    if peekOK then
        if time <= prevMouseInputTime then
            if reaper.time_precise() - time > 0.5 then --<= prevMouseInputTime then 
                prevDelta = 0
            end
        else --if time > prevMouseInputTime then
            --if keys&12 ~= 0 then return false end -- Any modifier keys (may be sent from mouse) terminate script.
            -- Standardize delta values so that can compare with previous
            if tiltHeight and tiltHeight > 0 then delta = -delta end
            if macOS then delta = -delta end -- macOS mousewheel events use opposite sign
            local sameDirection = (delta*prevDelta > 0)
            --delta = ((delta > 0) and 1) or ((delta < 0) and -1) or 0
            -- Meradium's suggestion: If mousewheel is turned rapidly, make larger changes to the curve per defer cycle
            --local factor = ((delta == prevDelta) and (time-prevMouseInputTime < 1)) and 0.04/((time-prevMouseInputTime)) or 0.04
            if not (tiltWheel == 1 and sameDirection and time < prevMouseInputTime + 1) then
                factor = sameDirection and factor*1.4 or 1.04
                local prevTiltWheel = tiltWheel
                tiltWheel = ((delta > 0) and tiltWheel*factor) or ((delta < 0) and tiltWheel/factor) or tiltWheel
                if (prevTiltWheel < 1 and tiltWheel >= 1) or (prevTiltWheel > 1 and tiltWheel <= 1) then tiltWheel = 1; factor = 1.04 -- Prevent scrolling through 1, and round to 1
                elseif tiltWheel < 0.025 then tiltWheel = 0.025 
                elseif tiltWheel > 40 then tiltWheel = 40
                --elseif 0.962 < tiltWheel and tiltWheel < 1.04 then tiltWheel = 1 -- Round to 1 if comes close
                end
                prevMouseInputTime = time 
                mustCalculate = true
            end
            prevDelta = delta
        end
    end
    
    -- MIDDLE BUTTON:
    peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_MBUTTONDOWN")
    if peekOK and time > prevMouseInputTime then 
        tiltShape = (tiltShape == "linear") and "sine" or "linear"
        Tooltip("Curve: "..tiltShape)
        prevMouseInputTime = time
        mustCalculate = true
    end
    
    -- MOUSE MOVEMENT:
    if mouseY ~= prevMouseY then mustCalculate = true end
    
    -- Scripts that extract selected MIDI events and re-concatenate them out of order (usually at the beginning of the MIDI string, for easier editing)
    --    cannot be auditioned in real-time while events are out of order, since such events are not played.
    -- If the mouse is held still, no editing is done, and instead the take is sorted, thereby temporarily allowing playback.
    if mustCalculate then
        
        local new = tSteps[#tSteps]
        local old = tSteps[#tSteps-1]        
        local mouseNewCCValue = GetMouseValue("LIMIT")
        tiltHeight      = tiltLEFT and (mouseNewCCValue - old.globalLeftmostValue) or (mouseNewCCValue - old.globalRightmostValue)
        
        for take, tID in pairs(new.tGroups) do
            local leftTick, rightTick =  tTickFromTime[take][new.globalLeftmostTime], tTickFromTime[take][new.globalRightmostTime]
            local range = rightTick - leftTick
            
            -- A power > 1 gives a more musical shape, therefore the cases tiltWheel >= 1 and tiltWheel < 1 will be dealt with separately.
            -- If tiltWheel < 1, its inverse will be used as power.
            if tiltLEFT then
                if tiltShape == "sine" then
                    if tiltWheel >= 1 then 
                        for id, t in pairs(tID) do
                            local tT, tV, tOldV = t.tT, t.tV, old.tGroups[take][id].tV
                            for i = 1, #tT do
                                local v = 0.5*(1-m_cos(m_pi*(rightTick - tT[i])/range))
                                v = tOldV[i] + tiltHeight*(v^tiltWheel)
                                if v > laneMaxValue then v = laneMaxValue elseif v < laneMinValue then v = laneMinValue end  
                                tV[i] = v
                            end
                        end
                    else -- tiltWheel < 1, so use inverse as power, and also change the sine formula
                        local inverseWheel = 1.0/tiltWheel
                        for id, t in pairs(tID) do
                            local tT, tV, tOldV = t.tT, t.tV, old.tGroups[take][id].tV
                            for i = 1, #tT do
                                local v = 0.5*(1-m_cos(m_pi*(tT[i] - leftTick)/range))
                                v = tOldV[i] + tiltHeight - tiltHeight*(v^inverseWheel)
                                if v > laneMaxValue then v = laneMaxValue elseif v < laneMinValue then v = laneMinValue end  
                                tV[i] = v
                            end
                        end
                    end
                else -- tiltShape == "linear"
                    if tiltWheel >= 1 then 
                        for id, t in pairs(tID) do
                            local tT, tV, tOldV = t.tT, t.tV, old.tGroups[take][id].tV
                            for i = 1, #tT do
                                local v = tOldV[i] + tiltHeight*(((rightTick - tT[i])/range)^tiltWheel)
                                if v > laneMaxValue then v = laneMaxValue elseif v < laneMinValue then v = laneMinValue end  
                                tV[i] = v
                            end
                        end
                    else -- tiltWheel < 1
                        local inverseWheel = 1.0/tiltWheel
                        for id, t in pairs(tID) do
                            local tT, tV, tOldV = t.tT, t.tV, old.tGroups[take][id].tV
                            for i = 1, #tT do
                                local v = tOldV[i] + tiltHeight - tiltHeight*(((tT[i] - leftTick)/range)^inverseWheel)
                                if v > laneMaxValue then v = laneMaxValue elseif v < laneMinValue then v = laneMinValue end  
                                tV[i] = v
                            end
                        end
                    end
                end
            else -- tiltRIGHT
                if tiltShape == "sine" then
                    if tiltWheel >= 1 then 
                        for id, t in pairs(tID) do
                            local tT, tV, tOldV = t.tT, t.tV, old.tGroups[take][id].tV
                            for i = 1, #tT do
                                local v = 0.5*(1-m_cos(m_pi*(tT[i] - leftTick)/range))
                                v = tOldV[i] + tiltHeight*(v^tiltWheel)
                                if v > laneMaxValue then v = laneMaxValue elseif v < laneMinValue then v = laneMinValue end  
                                tV[i] = v
                            end
                        end
                    else -- tiltWheel < 1
                        local inverseWheel = 1.0/tiltWheel
                        for id, t in pairs(tID) do
                            local tT, tV, tOldV = t.tT, t.tV, old.tGroups[take][id].tV
                            for i = 1, #tT do
                                local v = 0.5*(1-m_cos(m_pi*(rightTick - tT[i])/range))
                                v = tOldV[i] + tiltHeight - tiltHeight*(v^inverseWheel)
                                if v > laneMaxValue then v = laneMaxValue elseif v < laneMinValue then v = laneMinValue end  
                                tV[i] = v
                            end
                        end
                    end
                else -- tiltShape == "linear"
                    if tiltWheel >= 1 then 
                        for id, t in pairs(tID) do
                            local tT, tV, tOldV = t.tT, t.tV, old.tGroups[take][id].tV
                            for i = 1, #tT do 
                                local v = tOldV[i] + tiltHeight*(((tT[i] - leftTick)/range)^tiltWheel)
                                if v > laneMaxValue then v = laneMaxValue elseif v < laneMinValue then v = laneMinValue end  
                                tV[i] = v
                            end
                        end
                    else -- tiltWheel < 1
                        local inverseWheel = 1.0/tiltWheel
                        for id, t in pairs(tID) do
                            local tT, tV, tOldV = t.tT, t.tV, old.tGroups[take][id].tV
                            for i = 1, #tT do
                                local v = tOldV[i] + tiltHeight - tiltHeight*(((rightTick - tT[i])/range)^inverseWheel)
                                if v > laneMaxValue then v = laneMaxValue elseif v < laneMinValue then v = laneMinValue end  
                                tV[i] = v
                            end
                        end
                    end
                end
            end
        end
        
        -- Draw guidelines
        local tTopY = {}
        local tBottomY = {}
        local apexPixels = (tiltHeight/laneMaxValue) * (ME_TargetTopPixel - ME_TargetBottomPixel)
        -- Guideline ticks are calculated using active take
        local leftTick, rightTick =  tTickFromTime[activeTake][new.globalLeftmostTime], tTickFromTime[activeTake][new.globalRightmostTime]
        local range = rightTick - leftTick
        
        if tiltWheel >= 1 then 
            if tiltShape == "sine" then
                for i, ticks in ipairs(tGuides_Ticks) do
                    if tiltRIGHT then --ticks <= mouseNewPPQPos then
                        local s = apexPixels*((0.5*(1-m_cos(m_pi*(ticks - leftTick)/range)))^tiltWheel)
                        tTopY[i] = ME_TargetTopPixel + s
                        tBottomY[i] = ME_TargetBottomPixel + 1 + s
                    else
                        local s = apexPixels*((0.5*(1-m_cos(m_pi*(rightTick - ticks)/range)))^tiltWheel)
                        tTopY[i] = ME_TargetTopPixel + s
                        tBottomY[i] = ME_TargetBottomPixel + 1 + s
                    end
                end
            else
                for i, ticks in ipairs(tGuides_Ticks) do
                    if tiltRIGHT then --ticks <= mouseNewPPQPos then
                        local s = apexPixels*(((ticks - leftTick)/range)^tiltWheel)
                        tTopY[i] = ME_TargetTopPixel + s
                        tBottomY[i] = ME_TargetBottomPixel + 1 + s
                    else -- tiltLEFT
                        local s = apexPixels*(((rightTick - ticks)/range)^tiltWheel)
                        tTopY[i] = ME_TargetTopPixel + s
                        tBottomY[i] = ME_TargetBottomPixel + 1 + s
                    end
                end
            end
        else
            local inverseWheel = 1.0/tiltWheel
            if tiltShape == "sine" then
                for i, ticks in ipairs(tGuides_Ticks) do
                    if tiltRIGHT then --ticks <= mouseNewPPQPos then
                        local s = apexPixels - apexPixels*((0.5*(1-m_cos(m_pi*(rightTick - ticks)/range)))^inverseWheel)
                        tTopY[i] = ME_TargetTopPixel + s
                        tBottomY[i] = ME_TargetBottomPixel + 1 + s
                    else
                        local s = apexPixels - apexPixels*((0.5*(1-m_cos(m_pi*(ticks - leftTick)/range)))^inverseWheel)
                        tTopY[i] = ME_TargetTopPixel + s
                        tBottomY[i] = ME_TargetBottomPixel + 1 + s
                    end
                end
            else
                for i, ticks in ipairs(tGuides_Ticks) do
                    if tiltRIGHT then --ticks <= mouseNewPPQPos then
                        local s = apexPixels - apexPixels*(((rightTick - ticks)/range)^inverseWheel)
                        tTopY[i] = ME_TargetTopPixel + s
                        tBottomY[i] = ME_TargetBottomPixel + 1 + s
                    else
                        local s = apexPixels - apexPixels*(((ticks - leftTick)/range)^inverseWheel)
                        tTopY[i] = ME_TargetTopPixel + s
                        tBottomY[i] = ME_TargetBottomPixel + 1 + s
                    end
                end
            end
        end
        
        reaper.JS_LICE_Clear(bitmap, 0)
        local x1, t1, b1 = tGuides_X[1], tTopY[1], tBottomY[1] -- Coordinates of left pixel of each line segment
        for i = 2, #tGuides_X do
            x2, t2, b2 = tGuides_X[i], tTopY[i], tBottomY[i]
            reaper.JS_LICE_Line(bitmap, x1, t1, x2, t2, Guides_COLOR_TOP, 1, "COPY", true)
            reaper.JS_LICE_Line(bitmap, x1, b1, x2, b2, Guides_COLOR_BOTTOM, 1, "COPY", true)
            x1, t1, b1 = x2, t2, b2
        end
        
        CONSTRUCT_MIDI_STRING()
        
    end -- mustCalculate stuff
    
    
    -- GO TO NEXT STEP?
    if Check_MouseLeftButtonSinceLastDefer() then
        GetAllEdgeValues(tSteps[#tSteps])
        return "NEXT"
    else
        return "CONTINUE"
    end
    
end -- Defer_Tilt()


local tRel = {} -- Compress formula uses relative values, not absolute.  For fast repeated access, pre-calculate and store relative values here.
local compressWheel, compressTOP, compressBOTTOM, compressSYMMETRIC, compressShape = 1, nil, nil, false, "linear"
--#######################
-------------------------
function Defer_Compress()

    -- Setup stuff at first defer cycle for this step
    if not (continueStep == "CONTINUE") then
        stepStartTime = thisDeferTime
        mouseStateAtStepDragTime = mouseState
        compressTOP = mouseY and (mouseY < (ME_TargetBottomPixel+ME_TargetTopPixel)/2)
        compressBOTTOM = not compressTOP

        tRel = {}
        -- Construct new tStep by copying previous - except those tables/values that will be newly contructed
        local old = tSteps[#tSteps]
        local new = {tGroups = {}, isChangingPositions = false}
        tSteps[#tSteps+1] = new
        for key, entry in pairs(old) do
            if not new[key] then new[key] = entry end
        end
        for take, tID in pairs(old.tGroups) do -- ID divides events into separate lanes and channels
            new.tGroups[take] = {}
            tRel[take] = {}
            for id, t in pairs(tID) do
                new.tGroups[take][id] = {tV = {}}
                for a, b in pairs(t) do
                    if not new.tGroups[take][id][a] then new.tGroups[take][id][a] = b end
                end
                
                -- For faster access, calculate and store the relative values here
                tRel[take][id] = {}
                local r = tRel[take][id]
                local laneHeight = laneMaxValue-laneMinValue
                for i, v in ipairs(t.tV) do
                    r[i] = (v-laneMinValue)/laneHeight
                end
            end
        end
        SetupGuidelineTables() -- Can only get left/right pixels and set up tables *after* constructing new step's table
        mustCalculate = true -- Always calculate when script starts
    end  
    
    --[==[ MOUSEWHEEL
    local peekOK, pass, time, keys, delta = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_MOUSEWHEEL")
    if not (peekOK and time > prevMouseInputTime) then 
        peekOK, pass, time, keys, delta = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_MOUSEHWHEEL")
    end 
    if peekOK and time > prevMouseInputTime + 0.1 then 
        prevMouseInputTime = time
        mustCalculate = true
        --if keys&12 ~= 0 then return false end
        -- Standardize delta values
        delta = ((delta > 0) and 1) or ((delta < 0) and -1) or 0
        if macOS then delta = -delta end -- macOS scrolls up/down with opposite mousewheel than Windows/Linux
        if (compressTOP and mouseY < ME_TargetTopPixel) or (compressBOTTOM and mouseY < ME_TargetBottomPixel) then delta = -delta end
        --[[ Pause a little if flat line has been reached
        if mousewheel <= 0 then
            if delta ~= prevDelta then
                mousewheel = (delta == 1) and 0.025 or 40
            end
        else]]
            
        -- Meradium's suggestion: If mousewheel is turned rapidly, make larger changes to the curve per defer cycle
        if compressWheel == 0 then if delta == 1 then compressWheel = 0.025 else compressWheel = 40 end end
        --else
            local factor = (delta == prevDelta and time-prevMouseInputTime < 1) and 0.04/((time-prevMouseInputTime)^2) or 0.04
            compressWheel = (delta == 1) and (compressWheel*(1+factor)) or (compressWheel/(1+factor))
            --if mousewheel <= 0 then mousewheel = (delta == 1) and 0.025 or 40 end
            -- Snap to flat line (standard compression shape) if either direction goes extreme
            if compressWheel < 0.025 or 40 < compressWheel then 
                compressWheel = 0
                --prevMouseInputTime = prevMouseInputTime + 1
            -- Round to 1 if comes close
            elseif 0.962 < compressWheel and compressWheel < 1.04 then
                compressWheel = 1
                --prevMouseInputTime = prevMouseInputTime + 1
            end
        --end]]
        if compressWheel == 0 or compressWheel == 1 then prevMouseInputTime = prevMouseInputTime + 1 end
        prevDelta = delta
    end]==]
    
    -- MOUSEWHEEL
    local peekOK, pass, time, keys, delta = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_MOUSEWHEEL")
    if not (peekOK and time > prevMouseInputTime) then 
        peekOK, pass, time, keys, delta = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_MOUSEHWHEEL")
    end 
    if peekOK and time > prevMouseInputTime + 0.1 then 
        --if keys&12 ~= 0 then return false end
        -- Standardize delta values
        delta = ((delta > 0) and 1) or ((delta < 0) and -1) or 0
        if macOS then delta = -delta end -- macOS scrolls up/down with opposite mousewheel than Windows/Linux
        if (compressTOP and mouseY < ME_TargetTopPixel) or (compressBOTTOM and mouseY < ME_TargetBottomPixel) then delta = -delta end
        -- Pause a little if flat line has been reached
        if compressWheel == 0 then
            if time > prevMouseInputTime+1 or (delta ~= prevDelta and delta ~= 0 and prevDelta ~= 0) then --or delta ~= prevDelta then
                compressWheel = (delta == 1) and 0.025 or 40
                prevMouseInputTime = time
                mustCalculate = true
            end
        elseif compressWheel == 1 then
            if time > prevMouseInputTime+1 or (delta ~= prevDelta and delta ~= 0 and prevDelta ~= 0) then
                compressWheel = (delta == 1) and 1.04 or 0.962
                prevMouseInputTime = time
                mustCalculate = true
            end
        else
            -- Meradium's suggestion: If mousewheel is turned rapidly, make larger changes to the curve per defer cycle
            local factor = (delta == prevDelta and time-prevMouseInputTime < 1) and 0.04/((time-prevMouseInputTime)^2) or 0.04
            local prevCompressWheel = compressWheel or 1
            compressWheel = (delta == 1) and (compressWheel*(1+factor)) or (compressWheel/(1+factor))
            -- Snap to flat line (standard compression shape) if either direction goes extreme
            if compressWheel < 0.025 or 40 < compressWheel then 
                compressWheel = 0
            -- Round to 1 if comes close
            elseif (compressWheel < 1 and 1 < prevCompressWheel) or (prevCompressWheel < 1 and 1 < compressWheel) then
                compressWheel = 1
            end
            prevMouseInputTime = time
            mustCalculate = true
        end
        prevDelta = delta
    end
    mouseGreaterThanOne = (compressWheel >= 1)
    inversewheel = 1/compressWheel -- Can be infinity
        
    -- MIDDLE BUTTON: Middle button changes curve shape
    peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_MBUTTONDOWN")
    if peekOK and time > prevDeferTime then 
        compressShape = (compressShape == "linear") and "sine" or "linear"
        Tooltip("Curve: "..compressShape)
        prevMouseInputTime = time
        mustCalculate = true
    end
    
    -- RIGHT CLICK: Right click changes script mode
    peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_RBUTTONDOWN")
    if peekOK and time > prevDeferTime then
        compressSYMMETRIC = not compressSYMMETRIC
        prevMouseInputTime = time
        mustCalculate = true
    end
  
    -- MOUSE MOVEMENT:
    if mouseX ~= prevMouseX or mouseY ~= prevMouseY then mustCalculate = true end
    
    ---------------------
    
    if mustCalculate then
    
        local s = tSteps[#tSteps]
         
        -- MOUSE NEW CC VALUE (vertical position)
        mouseNewCCValue    = GetMouseValue()        
        local mouseNewTime = math.max(s.globalLeftmostTime, math.min(s.globalRightmostTime, tTimeFromPixel[mouseX])) -- Unique to this script: limit PPQ pos to CC range, so that curve doesn't change the further mouse goes outside CC range    
                
        -- CALCULATE NEW CC VALUES!
        local newValue, fraction 

        for take, tID in pairs(s.tGroups) do
            local globalLeftmostTick = tTickFromTime[take][s.globalLeftmostTime]
            local globalRightmostTick = tTickFromTime[take][s.globalRightmostTime]
            local mouseTick = tTickFromTime[take][mouseNewTime]
            local leftPPQrange = mouseTick - globalLeftmostTick
            local rightPPQrange = globalRightmostTick - mouseTick
            
            for id, t in pairs(tID) do
                local tOldV = tSteps[#tSteps-1].tGroups[take][id].tV
                local tR    = tRel[take][id]
                local tV    = t.tV
                for i = 1, #tOldV do
                    local ticks = t.tT[i]
                    if ticks == mouseTick or compressWheel == 0 then
                        fraction = 1
                    else
                        if mouseGreaterThanOne then
                            if ticks < mouseTick then
                                fraction = ((ticks - globalLeftmostTick)/leftPPQrange)^compressWheel
                            else
                                fraction = ((globalRightmostTick - ticks)/rightPPQrange)^compressWheel
                            end
                        else
                            if ticks < mouseTick then
                                fraction = 1 - ((mouseTick - ticks)/leftPPQrange)^inversewheel
                            else
                                fraction = 1 - ((ticks - mouseTick)/rightPPQrange)^inversewheel
                            end
                        end
                    end
                    if compressShape == "sine" then fraction = 0.5*(1-m_cos(m_pi*fraction)) end
                        
                    local tempLaneMin, tempLaneMax
                    if compressTOP then
                        tempLaneMax = laneMaxValue + fraction*(mouseNewCCValue-laneMaxValue)
                        if compressSYMMETRIC then
                            tempLaneMin = laneMinValue + fraction*(laneMaxValue-mouseNewCCValue)
                        else
                            tempLaneMin = laneMinValue
                        end
                    else -- compressBOTTON
                        tempLaneMin = laneMinValue + fraction*(mouseNewCCValue-laneMinValue)
                        if compressSYMMETRIC then
                            tempLaneMax = laneMaxValue + fraction*(laneMinValue-mouseNewCCValue)
                        else
                            tempLaneMax = laneMaxValue
                        end
                    end
                    local   newValue = tempLaneMin + tR[i] * (tempLaneMax - tempLaneMin) -- Replace with tRel
                    if      newValue > laneMaxValue then tV[i] = laneMaxValue
                    elseif  newValue < laneMinValue then tV[i] = laneMinValue
                    else tV[i] = newValue
                    end
                end
            end
        end
        
        -------------------------------------------------------
        -- Guidelines
              
        local tTopY = {}
        local tBottomY = {}
        local y
        
        local globalLeftmostTick = tTickFromTime[activeTake][s.globalLeftmostTime]
        local globalRightmostTick = tTickFromTime[activeTake][s.globalRightmostTime]
        local mouseTick = tTickFromTime[activeTake][mouseNewTime]
        local leftPPQrange = mouseTick - globalLeftmostTick
        local rightPPQrange = globalRightmostTick - mouseTick
        
        for i, ticks in ipairs(tGuides_Ticks) do
            if compressWheel == 0 then --or (mouseNewPPQPos-5 < ticks and ticks < mouseNewPPQPos+5) then 
                fraction = 1
            else
                if mouseGreaterThanOne then
                    if ticks < mouseTick then
                        fraction = ((ticks - globalLeftmostTick)/leftPPQrange)^compressWheel
                    else
                        fraction = ((globalRightmostTick - ticks)/rightPPQrange)^compressWheel
                    end
                else
                    if ticks < mouseTick then
                        fraction = 1 - ((mouseTick - ticks)/leftPPQrange)^inversewheel
                    else
                        fraction = 1 - ((ticks - mouseTick)/rightPPQrange)^inversewheel
                    end
                end
            end
            if compressShape == "sine" then fraction = 0.5*(1-m_cos(m_pi*fraction)) end
        
            if compressTOP then
                y = fraction*(mouseY-ME_TargetTopPixel)
                tTopY[i] = ME_TargetTopPixel + y
                if compressSYMMETRIC then tBottomY[i] = ME_TargetBottomPixel + 1 - y end
            else
                y = fraction*(ME_TargetBottomPixel-mouseY)
                tBottomY[i] = ME_TargetBottomPixel + 1 - y
                if compressSYMMETRIC then tTopY[i] = ME_TargetTopPixel + y end
            end
        end
        
        reaper.JS_LICE_Clear(bitmap, 0)
        
        local x1, t1, b1 = tGuides_X[1], tTopY[1], tBottomY[1] -- Coordinates of left pixel of each line segment
        for i = 2, #tGuides_X do
            -- To make sure than pointy curve is correctly drawn, even is point falls between 10-pixel segements, insert extra line to precise position of mouse
            if x1 < mouseX and mouseX < tGuides_X[i] then 
                if compressTOP then
                    reaper.JS_LICE_Line(bitmap, x1, t1, mouseX, mouseY, Guides_COLOR_TOP, 1, "COPY", true)
                    t1 = mouseY
                    if compressSYMMETRIC then
                        reaper.JS_LICE_Line(bitmap, x1, b1, mouseX, (ME_TargetBottomPixel+1) - (mouseY-ME_TargetTopPixel), Guides_COLOR_BOTTOM, 1, "COPY", true)
                        b1 = (ME_TargetBottomPixel+1) - (mouseY-ME_TargetTopPixel)
                    end
                else -- compressSYMMETRIC then
                    reaper.JS_LICE_Line(bitmap, x1, b1, mouseX, mouseY, Guides_COLOR_BOTTOM, 1, "COPY", true)
                    b1 = mouseY
                    if compressSYMMETRIC then
                        reaper.JS_LICE_Line(bitmap, x1, t1, mouseX, ME_TargetTopPixel - (mouseY-ME_TargetBottomPixel), Guides_COLOR_TOP, 1, "COPY", true)
                        t1 = ME_TargetTopPixel - (mouseY-ME_TargetBottomPixel)
                    end
                end
            end
            x2, t2, b2 = tGuides_X[i], tTopY[i], tBottomY[i]
            if compressTOP or compressSYMMETRIC then reaper.JS_LICE_Line(bitmap, x1, t1, x2, t2, Guides_COLOR_TOP, 1, "COPY", true) end
            if compressBOTTOM or compressSYMMETRIC then reaper.JS_LICE_Line(bitmap, x1, b1, x2, b2, Guides_COLOR_BOTTOM, 1, "COPY", true) end
            x1, t1, b1 = x2, t2, b2
        end
        
        if compressTOP and not compressSYMMETRIC then reaper.JS_LICE_Line(bitmap, tGuides_X[1], ME_TargetBottomPixel+1, tGuides_X[#tGuides_X], ME_TargetBottomPixel+1, Guides_COLOR_BOTTOM, 1, "COPY", true) end
        if compressBOTTOM and not compressSYMMETRIC then reaper.JS_LICE_Line(bitmap, tGuides_X[1], ME_TargetTopPixel, tGuides_X[#tGuides_X], ME_TargetTopPixel, Guides_COLOR_TOP, 1, "COPY", true) end
        
        --reaper.JS_Window_InvalidateRect(midiview, Guides_LeftPixel-20, ME_TargetTopPixel-20, Guides_RightPixel+20, ME_TargetBottomPixel+20, false)
        
        CONSTRUCT_MIDI_STRING()
        
    end -- mustCalculate stuff
    
    -- GO TO NEXT STEP?
    if Check_MouseLeftButtonSinceLastDefer() then
        GetAllEdgeValues(tSteps[#tSteps])
        return "NEXT"
    else
        return "CONTINUE"
    end
    
end -- Defer_Compress()


local dragTimeStarted, keysDownAtDragTime = nil, nil
--##################################
------------------------------------
function Check_CommonQuitConditionsAndGetInputs()
    
    -- Must the script terminate?
    -- Must the script go through the entire deferred function to calculate new MIDI stuff?
    --
    -- Both of these questions will be checked by getting mouse and keyboard input.
    -- Each defer edit function may also check further input such as 
    -- MIDI stuff might be changed if the mouse has moved, mousebutton has been clicked, or mousewheel has scrolled, so need to re-calculate.
    -- Otherwise, mustCalculate remains nil, and can skip to end of function.
    
    mustCalculate = false
    prevDeferTime = thisDeferTime or startTime
    thisDeferTime = reaper.time_precise()
    --dragTimeStarted = dragTimeStarted or (thisDeferTime > startTime + dragTime)  -- No need to call time_precise if dragTimeStarted already true   
    
    -- MIDI editor closed or changed mode? 
    if editor and reaper.MIDIEditor_GetMode(editor) ~= 0 then return false end 
    
    -- KEYBOARD: Script can be terminated by pressing key twice to start/stop, or by holding key and releasing after dragTime
    -- Recent versions of js_ReaScriptAPI ignore auto-repeared KEYDOWNs, so checking key presses is much simpler.
    -- BEWARE: REAPER only passes info to the VKey functions *between* defer cycles.  So if the MIDI take is very large and parsing takes longer than dragtime,
    --          Vkey_GetState will not be updated before getting keysDownAtDragTime.  The following code therefore waits at least three cycles:
    if not dragTimeStarted then -- First cycle
        dragTimeStarted = (thisDeferTime > startTime + dragTime)
    elseif not keysDownAtDragTime then -- Second cycle
        keysDownAtDragTime = reaper.JS_VKeys_GetState(startTime-0.5):sub(VKLow, VKHi) -- Only get keyState once, when dragtime has started
    elseif keysDownAtDragTime ~= keyState0 then -- Third cycle
        if reaper.JS_VKeys_GetState(startTime-0.5):sub(VKLow, VKHi) == keyState0 then return false end -- If keys are still held after dragtime, quit when they are released
    end 
    if reaper.JS_VKeys_GetDown(prevDeferTime):sub(VKLow, VKHi) ~= keyState0 then return false end
    
    -- EXTSTATE: Other scripts can communicate with and control the other js_ scripts via ExtStates
    local extState = reaper.GetExtState("js_Mouse actions", "Status") or ""
    if extState == "" or extState == "Must quit" then return(false) end
    
    -- MOUSE MODIFIERS: If any modifier key is pressed, after first releasing them, quit.
    -- This can detect left clicks even if the mouse is outside the MIDI editor
    prevMouseState = mouseState or 0xFF
    mouseState = reaper.JS_Mouse_GetState(0xFF)
    if (mouseState&52) > (prevMouseState&52) then -- 60 = 0b00111100 = Win | Alt | Shift | Ctrl
        return false
    end
    
    -- MOUSE POSITION: (New versions of the script don't quit if mouse moves out of CC lane, but will still quit if moves too far out of midiview.
    prevMouseX, prevMouseY = mouseX, mouseY
    mouseX, mouseY = reaper.GetMousePosition()
    --[[if mouseX ~= prevMouseX or mouseY ~= prevMouseY then
        prevMouseX, prevMouseY = mouseX, mouseY
        mustCalculate = true
    end]]
    
    -- Mouse moved out of window?
    mouseX, mouseY = reaper.JS_Window_ScreenToClient(windowUnderMouse, mouseX, mouseY)
    -- When move out of midiview, WM_SETCURSOR is no longer blocked, so must continually force cursor back to script cursor
    if mouseX < 0 or mouseY < 0 or ME_Width <= mouseX or ME_Height <= mouseY then 
        if cursor then 
            reaper.JS_Mouse_SetCursor(cursor) 
        end
        -- Quit if clicking outside midiview -- unless click on bottom scrollbar, which may be hiding the bottom Compress zone
        if mouseState > prevMouseState then 
            if mouseX < 0 or mouseY < 0 or ME_Width <= mouseX or ME_Height+50 <= mouseY then
                return false 
            end
        end
        --[[
        if cursor then reaper.JS_Mouse_SetCursor(cursor) end
        if mouseState&1 == 0 and (mouseX < -150 or mouseY < -150 or ME_Width+150 < mouseX or ME_Height+150 < mouseY) then
            return false
        elseif cursor then
            reaper.JS_Mouse_SetCursor(cursor)
        end]]
    end
    
    -- TAKE STILL VALID?
    if not reaper.ValidatePtr2(0, activeTake, "MediaItem_Take*") then return false end
    
    -- EVERYTHING CHECKS OUT
    return true
end


--#######################
-------------------------
function GetMinMaxTicks()
    if tSteps[#tSteps].tTicks[1] < tSteps[#tSteps].tTicks[#tTicks] then
        return tSteps[#tSteps].tTicks[1], tSteps[#tSteps].tTicks[#tTicks] + (tSteps[#tSteps].tLengths[#tTicks] or 0)
    else
        return tSteps[#tSteps].tTicks[#tTicks], tSteps[#tSteps].tTicks[1] + (tSteps[#tSteps].tLengths[1] or 0)
    end
end


--#############################
-------------------------------
function GetAllEdgeValues(step)
    step = step or tSteps[#tSteps]
    
    local globalLeftmostTime   = math.huge
    local globalLeftmostValue  = nil
    local globalRightmostTime  = -math.huge
    local globalRightmostValue = nil
    local globalMinValue       = math.huge
    local globalMaxValue       = -math.huge
    local globalNoteOffTime    = -math.huge 

    -- If multiple takes and/or channels have selected events at the same leftmost and rightmost positions, but with different values,
    --    where should the Tilt zones be positioned?  This script gives precedence to the active take and active channel, if these exist.
    local tActive = step.tGroups[activeTake] and step.tGroups[activeTake][activeChannel]
    if tActive and tActive.tT[1] and tActive.tT[#tActive.tT] then
        local activeTime1 = tTimeFromTick[activeTake][tActive.tT[1]]
        local activeTimeT  = tTimeFromTick[activeTake][tActive.tT[#tActive.tT]]
        if activeTime1 < activeTimeT then
            globalLeftmostTime, globalLeftmostValue, globalRightmostTime, globalRightmostValue 
                = activeTime1, tActive.tV[1], activeTimeT, tActive.tV[#tActive.tV]
        else
            globalLeftmostTime, globalLeftmostValue, globalRightmostTime, globalRightmostValue 
                = activeTimeT, tActive.tV[#tActive.tV], activeTime1, tActive.tV[1]
        end
    end
    
    for take, groups in pairs(step.tGroups) do
        local takeLeftmostTick, takeLeftmostValue, takeRightmostTick, takeRightmostValue, takeMinValue, takeMaxValue, takeNoteOffTick = math.huge, nil, -math.huge, nil, math.huge, -math.huge, -math.huge
        for grp, t in pairs(groups) do
            local tV, tT, tOff = t.tV, t.tT, t.tOff
            if grp == "notes" and t.noteWithLastNoteOff then
                local n = t.noteWithLastNoteOff
                local t1 = tOff[1]
                local tn = tOff[n]
                if t1 < tn then 
                    takeNoteOffTick, takeRightmostValue = tn, tV[n] 
                else 
                    takeNoteOffTick, takeRightmostValue = t1, tV[1]
                end
                if tT[1] < takeLeftmostTick then takeLeftmostTick, takeLeftmostValue = tT[1], tV[1] end
                if tT[n] < takeLeftmostTick then takeLeftmostTick, takeLeftmostValue = tT[n], tV[n] end
                if tT[1] > takeRightmostTick then takeRightmostTick = tT[1] end
                if tT[#tT] > takeRightmostTick then takeRightmostTick = tT[#tT] end
            else --if t ~= tActive then --(take == activeTake and grp == activeChannel) then
                if tT[1] < takeLeftmostTick then takeLeftmostTick, takeLeftmostValue = tT[1], tV[1] end
                if tT[#tT] < takeLeftmostTick then takeLeftmostTick, takeLeftmostValue = tT[#tT], tV[#tV] end
                if tT[1] > takeRightmostTick then takeRightmostTick, takeRightmostValue = tT[1], tV[1] end
                if tT[#tT] > takeRightmostTick then takeRightmostTick, takeRightmostValue = tT[#tT], tV[#tV] end
            end
            if grp ~= "text" then
                for i = 1, #tV do
                    if tV[i] < takeMinValue then takeMinValue = tV[i] end -- !!!! Can speed this up with elseif, and one comparison when all done
                    if tV[i] > takeMaxValue then takeMaxValue = tV[i] end
                end
            end
        end
        if takeNoteOffTick < takeRightmostTick then takeNoteOffTick = takeRightmostTick end
        local takeLeftmostTime  = tTimeFromTick[take][takeLeftmostTick]
        local takeRightmostTime = tTimeFromTick[take][takeRightmostTick]
        local takeNoteOffTime   = tTimeFromTick[take][takeNoteOffTick]
        if takeLeftmostTime  < globalLeftmostTime  then globalLeftmostTime,  globalLeftmostValue  = takeLeftmostTime,  takeLeftmostValue end
        if takeRightmostTime > globalRightmostTime then globalRightmostTime, globalRightmostValue = takeRightmostTime, takeRightmostValue end
        if takeNoteOffTime   > globalNoteOffTime   then globalNoteOffTime,   globalRightmostValue = takeNoteOffTime,   takeRightmostValue end
        if takeMinValue < globalMinValue then globalMinValue = takeMinValue end
        if takeMaxValue > globalMaxValue then globalMaxValue = takeMaxValue end
    end

    -- The active take and active channel takes precedence when finding edge values, if multiple CCs at same tick positions, so that Tilt zones correspond to active channel
    step.globalLeftmostTime   = globalLeftmostTime
    step.globalLeftmostValue  = globalLeftmostValue
    step.globalRightmostTime  = globalRightmostTime
    step.globalRightmostValue = globalRightmostValue
    step.globalMinValue       = globalMinValue
    step.globalMaxValue       = globalMaxValue
    step.globalNoteOffTime    = globalNoteOffTime
end


--#############################
-------------------------------
function SetupGuidelineTables()
 
    Guides_LeftPixel  = tPixelFromTime[tSteps[#tSteps].globalLeftmostTime]
    Guides_RightPixel = tPixelFromTime[tSteps[#tSteps].globalRightmostTime]
    if Guides_LeftPixel and Guides_RightPixel 
    and (Guides_LeftPixel ~= prevGuides_LeftPixel) or (Guides_RightPixel ~= prevGuides_RightPixel) 
    then
        prevGuides_LeftPixel = Guides_LeftPixel
        prevGuides_RightPixel = Guides_RightPixel
        -- The line will be calculated at nodes spaced 10 pixels. Get PPQ positions of each node.
        tGuides_Ticks = {}
        tGuides_X = {} -- Pixel positions relative to midiview client area
        if ME_TimeBase == "beats" then
            local ME_LeftmostTick_min_loopStartTick = ME_LeftmostTick - tTakeInfo[activeTake].loopStartTick
            for x = Guides_LeftPixel, Guides_RightPixel-1, 2 do
                tGuides_X[#tGuides_X+1] = x
                tGuides_Ticks[#tGuides_Ticks+1] = ME_LeftmostTick_min_loopStartTick + x/ME_PixelsPerTick
            end
            tGuides_X[#tGuides_X+1] = Guides_RightPixel -- Make sure the line goes up to last event
            tGuides_Ticks[#tGuides_Ticks+1] = ME_LeftmostTick_min_loopStartTick + Guides_RightPixel/ME_PixelsPerTick
        else -- ME_TimeBase == "time"
            for x = Guides_LeftPixel, Guides_RightPixel-1, 2 do
                tGuides_X[#tGuides_X+1] = x
                tGuides_Ticks[#tGuides_Ticks+1] = tTickFromTime[activeTake][ME_LeftmostTime + x/ME_PixelsPerSecond] -- loopStartPPQPos -- tTickFromTime already corrects for loopStartTick
            end
            tGuides_X[#tGuides_X+1] = Guides_RightPixel
            tGuides_Ticks[#tGuides_Ticks+1] = tTickFromTime[activeTake][ME_LeftmostTime + Guides_RightPixel/ME_PixelsPerSecond] -- loopStartPPQPos
        end
    end
end


--##########################
----------------------------
function DisplayZones()    
    
    if not tColors then
        LoadZoneColors()
    end
    
    tZones = {}
    local t = tSteps[#tSteps]
    
    local GUI_LeftPixel  = tPixelFromTime[tSteps[#tSteps].globalLeftmostTime]
    local GUI_RightPixel = tPixelFromTime[tSteps[#tSteps].globalNoteOffTime or tSteps[#tSteps].globalRightmostTime]
    GUI_LeftPixel, GUI_RightPixel = (GUI_LeftPixel-zoneWidth*1.5)//1, (GUI_RightPixel+zoneWidth*1.5)//1
    -- Always show stretch zones, even if MIDI is offscreen, so that stretchig can still be performed
    if GUI_LeftPixel > ME_Width then GUI_LeftPixel = ME_Width-zoneWidth*2 end
    if GUI_RightPixel < 0 then GUI_RightPixel = zoneWidth*2 end
    local GUI_MidPixel = (GUI_LeftPixel+GUI_RightPixel)//2
    if (GUI_RightPixel - GUI_LeftPixel) < zoneWidth*4 then GUI_LeftPixel, GUI_RightPixel = GUI_MidPixel - 2*zoneWidth, GUI_MidPixel + 2*zoneWidth end
    
    local undoLeft = math.max(0, GUI_LeftPixel-2*zoneWidth)
     
    tZones = {}
    
    -- Can the target lane's values be edited -- and, is the lane large enough to accomodate all the zones?
    -- Note: this is re-calculated at each step, since the answer may change if the zone size is changed.
    if (laneIsCC7BIT or laneIsCC14BIT or laneIsPITCH or laneIsCHANPRESS or laneIsPROGRAM or laneIsVELOCITY or laneIsOFFVEL) 
    and (ME_TargetBottomPixel-ME_TargetTopPixel) > 3*zoneWidth
    then
        -- Tilt
        local leftValue, rightValue = t.globalLeftmostValue, t.globalRightmostValue
        if leftValue then
            --if t.tTicks[1] > t.tTicks[#t.tTicks] then leftValue, rightValue = rightValue, leftValue end
            local leftTiltPixel = ME_TargetTopPixel+(1-leftValue/laneMaxValue)*(ME_TargetBottomPixel-ME_TargetTopPixel)
            tZones[#tZones+1] = {func = Defer_Tilt,         wheel = Edit_ChaseLeft,         tooltip = "Tilt / Arch",   cursor = tCursors.Tilt,         color = "tilt", 
                                  left = GUI_LeftPixel,  right = GUI_LeftPixel+zoneWidth-1,  top = leftTiltPixel-zoneWidth/2,    bottom = leftTiltPixel+zoneWidth/2}   
        end
        if rightValue then
            local rightTiltPixel = ME_TargetTopPixel+(1-rightValue/laneMaxValue)*(ME_TargetBottomPixel-ME_TargetTopPixel)
            tZones[#tZones+1] = {func = Defer_Tilt,           wheel = Edit_ChaseRight,          tooltip = "Tilt / Arch",  cursor = tCursors.Tilt,      color = "tilt", 
                                  left = GUI_RightPixel-zoneWidth+1,   right = GUI_RightPixel,  top = rightTiltPixel-zoneWidth/2,  bottom = rightTiltPixel+zoneWidth/2}
        end
        
        -- Undo/Redo        
        tZones[#tZones+1] = {func = Defer_Undo,     wheel = Defer_Undo,     tooltip = "Undo",                       cursor = tCursors.Undo,    color = (#tSteps > 0) and "undo" or "black", 
                             left = undoLeft,       right = undoLeft+zoneWidth-1,      top = ME_TargetTopPixel-2*zoneWidth-2,  bottom = ME_TargetTopPixel-zoneWidth-2}                  
        tZones[#tZones+1] = {func = Defer_Redo,     wheel = Defer_Redo,     tooltip = "Redo",                       cursor = tCursors.Redo,    color = (#tRedo > 0) and "redo" or "black", 
                             left = undoLeft+zoneWidth,      right = undoLeft+2*zoneWidth-1,  top = ME_TargetTopPixel-2*zoneWidth-2,  bottom = ME_TargetTopPixel-zoneWidth-2}                  
        
        -- Scale
        local left, right = GUI_LeftPixel+2*zoneWidth, GUI_RightPixel-2*zoneWidth
        if right-left < 2*zoneWidth then left, right = GUI_MidPixel-zoneWidth, GUI_MidPixel+zoneWidth end
        
        local minValuePixel, maxValuePixel = ME_TargetBottomPixel, ME_TargetTopPixel
        if t.globalMaxValue and t.globalMinValue then 
            maxValuePixel = ME_TargetBottomPixel - (ME_TargetBottomPixel-ME_TargetTopPixel)*(t.globalMaxValue-laneMinValue)/(laneMaxValue-laneMinValue) - zoneWidth/2
            minValuePixel = ME_TargetBottomPixel - (ME_TargetBottomPixel-ME_TargetTopPixel)*(t.globalMinValue-laneMinValue)/(laneMaxValue-laneMinValue) + zoneWidth/2
            if minValuePixel - maxValuePixel < zoneWidth*3 then maxValuePixel = (minValuePixel+maxValuePixel)/2 - zoneWidth*1.5 end
            if maxValuePixel <= ME_TargetTopPixel    then maxValuePixel = ME_TargetTopPixel end
            if minValuePixel - maxValuePixel <= zoneWidth*3 then minValuePixel = maxValuePixel + zoneWidth*3 end
            if minValuePixel >= ME_TargetBottomPixel then minValuePixel = ME_TargetBottomPixel end
            if minValuePixel - maxValuePixel <= zoneWidth*3 then maxValuePixel = minValuePixel - zoneWidth*3 end
            minValuePixel, maxValuePixel = minValuePixel//1, maxValuePixel//1
        end
        tZones[#tZones+1] = {func = Defer_Scale,          wheel = Edit_FlipValuesRelative,     tooltip = "Scale top",      cursor = tCursors.HandTop,     color = "scale", 
                             left = left,     right = right, top = maxValuePixel,    bottom = maxValuePixel+zoneWidth-1,
                             activeTop = ME_TargetTopPixel, activeLeft = -1/0, activeRight = 1/0}
        tZones[#tZones+1] = {func = Defer_Scale,          wheel = Edit_FlipValuesRelative,     tooltip = "Scale bottom",   cursor = tCursors.HandBottom,  color = "scale", 
                              left = left,    right = right, top = minValuePixel-zoneWidth+1, bottom = minValuePixel,
                              activeBottom = ME_TargetBottomPixel, activeLeft = -1/0, activeRight = 1/0}    
        
        -- Stretch
        -- Make sure that the Stretch zones are always visible and separate, even if the pixel range of the selected events is tiny.
        --local leftStretchPixel, rightStretchPixel = GUI_LeftPixel+zoneWidth*2-1, GUI_RightPixel-zoneWidth*2
        --if rightStretchPixel - leftStretchPixel < 0 then leftStretchPixel, rightStretchPixel = (leftStretchPixel+rightStretchPixel)//2, (leftStretchPixel+rightStretchPixel)//2+1 end
        local stretchTopPixel     = maxValuePixel+zoneWidth --(maxValuePixel > ME_TargetTopPixel+zoneWidth+1) and maxValuePixel or (maxValuePixel+zoneWidth+1)
        local stretchBottomPixel  = minValuePixel-zoneWidth --(minValuePixel < ME_TargetBottomPixel-zoneWidth-1) and minValuePixel or (minValuePixel-zoneWidth-1)
        tZones[#tZones+1] = {func = Defer_Stretch_Left,   wheel = Edit_Reverse,               tooltip = "Stretch left",   cursor = tCursors.HandLeft,    color = "stretch", 
                             left = GUI_LeftPixel+zoneWidth,       right = GUI_LeftPixel+zoneWidth*2-1, 
                             top  = stretchTopPixel, bottom = stretchBottomPixel,
                             --activeTop = ME_TargetTopPixel, activeBottom = ME_TargetBottomPixel, 
                             activeLeft = -1/0}
        tZones[#tZones+1] = {func = Defer_Stretch_Right,  wheel = Edit_Reverse,               tooltip = "Stretch right",  cursor = tCursors.HandRight,   color = "stretch", 
                             left = GUI_RightPixel-zoneWidth*2+1,    right = GUI_RightPixel-zoneWidth,                        
                             top  = stretchTopPixel, bottom = stretchBottomPixel,
                             --activeTop = ME_TargetTopPixel, activeBottom = ME_TargetBottomPixel, 
                             activeRight = 1/0}         
        
        -- Warp
        if (GUI_RightPixel - GUI_LeftPixel) > zoneWidth*4 then
            tZones[#tZones+1] = {func = Defer_Warp,           wheel = Edit_SpaceEvenly,   tooltip = "Warp",           cursor = tCursors.ArpeggiateLR,color = "warp", 
                                 left = GUI_LeftPixel+zoneWidth*2, right = GUI_RightPixel-zoneWidth*2, top = stretchTopPixel, bottom = stretchBottomPixel}
        end  
        
        -- Compress top/bottom
        left, right = GUI_LeftPixel+3*zoneWidth, GUI_RightPixel-3*zoneWidth
        if right-left < 2*zoneWidth then left, right = GUI_MidPixel-zoneWidth, GUI_MidPixel+zoneWidth end
        tZones[#tZones+1] = {func = Defer_Compress,   wheel = Edit_FlipValuesAbsolute,   tooltip = "Scale top",      cursor = tCursors.Compress,    color = "compress", 
                              left = left,  right = right,  top = ME_TargetTopPixel-zoneWidth-1, bottom = ME_TargetTopPixel-1,
                              activeLeft = -1/0, activeRight = 1/0}
        tZones[#tZones+1] = {func = Defer_Compress,   wheel = Edit_FlipValuesAbsolute,   tooltip = "Scale bottom",   cursor = tCursors.Compress,    color = "compress", 
                              left = left,  right = right,  top = ME_TargetBottomPixel+1, bottom = ME_TargetBottomPixel+zoneWidth+1,
                              activeLeft = -1/0, activeRight = 1/0}  
                        
    -- Events don't have values, or lane is too narrow, so only edit positions 
    else
        local bottom, top = ME_TargetBottomPixel, ME_TargetTopPixel
        if bottom - top < 2*zoneWidth then
            local midPixel = (bottom + top)//2
            bottom, top = midPixel+40, midPixel-40
        end
        
        -- Undo/Redo     
        local undoTop, undoBottom = top-zoneWidth-1, top-1
        if undoTop < 0 then
            undoTop, undoBottom = bottom+1, bottom+zoneWidth+1
        end   
        tZones[#tZones+1] = {func = Defer_Undo,         wheel = Defer_Undo,       tooltip = "Undo",   cursor = tCursors.Undo,    color = (#tSteps > 0) and "undo" or "black", 
                              left = undoLeft,  right = undoLeft+zoneWidth,  top = undoTop, bottom = undoBottom}                  
        tZones[#tZones+1] = {func = Defer_Redo,         wheel = Defer_Redo,       tooltip = "Redo",   cursor = tCursors.Redo,    color = (#tRedo > 0) and "redo" or "black", 
                              left = undoLeft+zoneWidth+1, right = undoLeft+2*zoneWidth+1,  top = undoTop, bottom = undoBottom}                  
        -- Stretch
        tZones[#tZones+1] = {func = Defer_Stretch_Left,   wheel = Edit_Reverse,   tooltip = "Stretch left",   cursor = tCursors.HandLeft,    color = "stretch", 
                              left = GUI_LeftPixel+zoneWidth, right = GUI_LeftPixel+zoneWidth*2-1,   top = top, bottom = bottom,
                              activeLeft = -1/0}
        tZones[#tZones+1] = {func = Defer_Stretch_Right,  wheel = Edit_Reverse,   tooltip = "Stretch right",  cursor = tCursors.HandRight,   color = "stretch", 
                              left = GUI_RightPixel-zoneWidth*2+1,    right = GUI_RightPixel-zoneWidth,   top = top, bottom = bottom,
                              activeRight = 1/0}
        -- Warp
        tZones[#tZones+1] = {func = Defer_Warp,           wheel = Edit_SpaceEvenly,   tooltip = "Warp",           cursor = tCursors.ArpeggiateLR,color = "warp", 
                              left = GUI_LeftPixel+zoneWidth*2, right = GUI_RightPixel-zoneWidth*2, top = top, bottom = bottom}
    end    
    reaper.JS_LICE_Clear(bitmap, 0)
    for _, z in ipairs(tZones) do
        local color = tColors[z.color]
        reaper.JS_LICE_FillRect(bitmap, z.left//1, z.top//1, (z.right-z.left)//1, (z.bottom-z.top)//1, color, 1, "COPY")
        color = winOS and ((color>>3)&0x1F1F1F1F) or (color&0x1FFFFFFF)
        reaper.JS_LICE_FillRect(bitmap, (z.left+1)//1, (z.top+1)//1, (z.right-z.left-2)//1, (z.bottom-z.top-2)//1, color, 1, "COPY")
    end
    
    reaper.JS_Window_InvalidateRect(windowUnderMouse, 0, 0, ME_Width, ME_Height, false) --GUI_LeftPixel-zoneWidth, ME_TargetTopPixel-zoneWidth, GUI_RightPixel+zoneWidth, ME_TargetBottomPixel+zoneWidth, false)

end


--local zone, prevZone
--####################
----------------------
function Defer_Zones()

    -- continueStep = true means that a deferred function is already running, so no need for GUI setup
    if not (continueStep == "CONTINUE") then
        DisplayZones()
        stepStartTime = thisDeferTime
    end
    
    -- FIND ZONE
    prevZone = zone or false
    zone = nil
    if 0 <= mouseX and mouseX < ME_Width and 0 <= mouseY and mouseY < ME_Height+zoneWidth then -- Add a little leeway at bottom, in case a compress zone is hidden behind scrollbar
        for _, z in ipairs(tZones) do
            if (z.activeLeft or z.left) <= mouseX and mouseX <= (z.activeRight or z.right) and (z.activeTop or z.top) <= mouseY and mouseY <= (z.activeBottom or z.bottom) then
                zone = z
                break
            end
        end
    end
    -- MOUSE CURSOR
    if zone ~= prevZone then
        if zone and zone.cursor then
            --Tooltip(zone.tooltip) -- tooltips seem to flicker when compositing is used
            cursor = zone.cursor
        else
            cursor = tCursors.Cross
        end
        if cursor then reaper.JS_Mouse_SetCursor(cursor) end
    end
    -- MOUSEWHEEL
    local peekOK, pass, time, keys, delta = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_MOUSEWHEEL")
    if not (peekOK and time > stepStartTime) then 
        peekOK, pass, time, keys, delta = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_MOUSEHWHEEL")
    end 
    if peekOK and time > stepStartTime + 0.1 then 
        prevMouseInputTime = time
        if zone and zone.wheel then 
            selectedEditFunction = zone.wheel
            --reaper.JS_LICE_Clear(bitmap, 0)
            --reaper.JS_Window_InvalidateRect(midiview, 0, 0, ME_Width, ME_Height, false)
            return "NEXT", zone.wheel
        else
            return "QUIT"
        end
    end
    -- LEFT CLICK: Run the function linked to zone under mouse
    peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_LBUTTONDOWN")
    if not (peekOK and time > stepStartTime) then
        peekOK, pass, time = reaper.JS_WindowMessage_Peek(windowUnderMouse, "WM_NCLBUTTONDOWN")
    end
    if peekOK and time > stepStartTime then --prevMouseInputTime then
        if zone then 
            selectedEditFunction = zone.func
            reaper.JS_LICE_Clear(bitmap, 0)
            --reaper.JS_Window_InvalidateRect(midiview, 0, 0, ME_Width, ME_Height, false)
            return "NEXT", zone.func
        else
            return "QUIT"
        end
    end
    -- RIGHT CLICK: Context menu
    if (mouseState&2) > (prevMouseState&2) then
        if zone then 
            selectedEditFunction = ContextMenu
            return "NEXT", ContextMenu
        end
    end

    return "CONTINUE"
end


local selectedEditFunction = nil  
--############################################################################################
----------------------------------------------------------------------------------------------
-- Why are the deferred editing functions isolated behind a pcall?
--    If the script encounters an error, all intercepts must first be released, before the script quits.
-- Deferred and other Edit script can return three values: 
--    "CONTINUE" to continue with same function in the next defer cycle,
--    "NEXT" to proceed to show zones and select a new edit function, and
--    "QUIT" to terminate the script.
function DEFER_pcall()  

    local nextFunction
    pcallOK, continueScript = pcall(Check_CommonQuitConditionsAndGetInputs)
    if pcallOK and continueScript then
        pcallOK, continueStep, nextFunction = pcall(selectedEditFunction or Defer_Zones)
        if pcallOK and not (continueStep == "QUIT") then
            selectedEditFunction = (continueStep == "CONTINUE") and selectedEditFunction or nextFunction or Defer_Zones
            reaper.defer(DEFER_pcall)
        end
    end
end


--##########################################################################
----------------------------------------------------------------------------
function AtExit()   
    
    -- Remove intercepts, restore original intercepts.  Do this first, because these are most important to restore, in case anything else goes wrong during AtExit.
    if interceptKeysOK ~= nil then pcall(function() reaper.JS_VKeys_Intercept(-1, -1) end) end
    --if compositeOK and windowUnderMouse and bitmap then pcall(function() reaper.JS_Composite_Unlink(windowUnderMouse, bitmap) end) end
    if bitmap then reaper.JS_LICE_DestroyBitmap(bitmap) end -- Destroying bitmap automatically unlinks and invalidates
    if pcallInterceptWM_OK ~= nil then -- If these are nil, that part of MAIN wasn't reached
        if not (pcallInterceptWM_OK and pcallInterceptWM_Retval) then -- Either an exception or some other error
            reaper.JS_WindowMessage_ReleaseWindow(windowUnderMouse) 
            reaper.MB("Intercepting window messages failed.\n\nAll intercepts for the window under the mouse will be released. (This may affect other scripts that are currently monitoring this window.)", "ERROR", 0) 
        elseif windowUnderMouse and reaper.ValidatePtr(windowUnderMouse, "HWND") then --(isInline or (editor and reaper.MIDIEditor_GetMode(editor) ~= -1)) then
            for message, passthrough in pairs(tWM_Messages) do
                if passthrough then 
                    reaper.JS_WindowMessage_PassThrough(windowUnderMouse, message, true)
                else
                    reaper.JS_WindowMessage_Release(windowUnderMouse, message)    
                end
            end
        end
    end

    --[[ Just something to display table with userdata keys in IDE watchlist
    tTT = {}
    for take, t in pairs(tTakeInfo) do
        tTT[take] = true
    end
    for take in pairs(tTT) do
        local t = tostring(take):sub(-7)
        tTakeInfo[t] = tTakeInfo[take]
        tGroups[t] = tGroups[take]
        tTickFromTime[t] = tTickFromTime[take]
    end
    ]]
    
    -- As when starting the script, restore cursor and toolbar button as soon as possible, in order to seem more responsive.
    -- Was a custom cursur loaded? Restore plain cursor.
    cursor = reaper.JS_Mouse_LoadCursor(32512) -- IDC_ARROW standard arrow
    if cursor then reaper.JS_Mouse_SetCursor(cursor) end
    
    -- Deactivate toolbar button (if it has been toggled)
    if origToggleState and sectionID and commandID and not leaveToolbarButtonArmed then
        reaper.SetToggleCommandState(sectionID, commandID, origToggleState)
        reaper.RefreshToolbar2(sectionID, commandID)
    end  

    -- Communicate with the js_Run.. script that this script is exiting
    reaper.DeleteExtState("js_Mouse actions", "Status", true)        
  
    -- Before getting to errors in MAIN, stuff that could have been changed in MAIN was already cleaned up above.
    if not mainOK then
        reaper.MB("The script encountered an error during startup:\n\n"
                .. "mainretval: "..tostring(mainRetval)
                .."\n\nPlease report these details in the \"MIDI Editor Tools\" thread in the REAPER forums."
                , "ERROR", 0)
    end
    
    -- Double-check that nothing went awry, by checking MIDI source lengths.
    --[[ v5.52: This check sometimes caused problems for some unknown reasons, even after compensating for playrate and rounding. 
                So rather skip.
                
    if pcallOK == true then
        for take in pairs(tGroups) do
            if reaper.ValidatePtr2(0, take, "MediaItem_Take*") and reaper.TakeIsMIDI(take) then
                if tTakeInfo[take] and tTakeInfo[take].sourceLenTicks and not (tTakeInfo[take].sourceLenTicks == (0.5+reaper.BR_GetMidiSourceLenPPQ(take))//1) then -- BEWARE: BR functioh may return float
                    pcallOK = "shifted MIDI"
                    break
                end
            else
                tGroups[take] = nil
            end
        end
    end
    
    if pcallOK == "shifted MIDI" then
        reaper.MB("The script has detected inadvertent shifts in the PPQ positions of unedited events."
              .. "\n\nThis may be due to a bug in the script, or in the MIDI API functions."
              .. "\n\nPlease report the bug in the following forum thread:"
              .. "\nhttp://forum.cockos.com/showthread.php?t=176878"
              .. "\n\nThe original MIDI data will be restored to the take."
              , "ERROR", 0)
    else]]if pcallOK == false then
        reaper.MB("The script encountered an error:\n"
              .. "\ncontinueStep: "..tostring(continueStep)
              .. "\ncontinue: "..tostring(continue)
              .. "\npcallRetval: "..tostring(pcallRetval)
              --.."\n\nPlease report these details in the \"MIDI Editor Tools\" thread in the REAPER forums."
              .."\n\n* The original, unaltered MIDI will be restored to the take."
              , "ERROR", 0)
    end
    
    -- Must MIDI be sorted?  Only if positions have changed.
    local mustSort
    if tSteps then
        for i = 1, #tSteps do 
            if tSteps[i].isChangingPositions then
                mustSort = true
                break
    end end end
        
    -- Sorting and restoring (in case of errors) both loop through all takes, so do both in same loop
    if mustSort or pcallOK == false then
        for take in pairs(tGroups) do
            if tTakeInfo[take] and tTakeInfo[take].origMIDI 
            and reaper.ValidatePtr2(0, take, "MediaItem_Take*") and reaper.TakeIsMIDI(take) then
                if mustSort then
                    reaper.MIDI_Sort(take)
                else
                    reaper.MIDI_SetAllEvts(take, tTakeInfo[take].origMIDI)
                end
            end
        end
    end        
                  
    -- Write nice, informative Undo strings
    if laneIsCC7BIT then
        undoString = "Multi tool: 7-bit CC lane ".. tostring(mouseOrigCCLane)
    elseif laneIsCHANPRESS then
        undoString = "Multi tool: channel pressure"
    elseif laneIsCC14BIT then
        undoString = "Multi tool: 14 bit-CC lanes ".. 
                                  tostring(mouseOrigCCLane-256) .. "/" .. tostring(mouseOrigCCLane-224)
    elseif laneIsPITCH then
        undoString = "Multi tool: pitchwheel events"
    elseif laneIsNOTES then
        undoString = "Multi tool: notes"
    elseif laneIsTEXT then
        undoString = "Multi tool: text events"
    elseif laneIsSYSEX then
        undoString = "Multi tool: sysex events"
    elseif laneIsPROGRAM then
        undoString = "Multi tool: program select events"
    elseif laneIsBANKPROG then
        undoString = "Multi tool: bank/program select events"
    elseif laneIsBANKPROG then
        undoString = "Multi tool: all lanes"
    else
        undoString = "Multi tool"
    end 
    
    -- Undo_OnStateChange_Item is expected to be the fastest undo function, since it limits the info stored 
    --    in the undo point to changes in this specific item.  However, cannot be used if multiple items were edited.
    if isInline then
        if reaper.ValidatePtr2(0, activeItem, "MediaItem*") then 
            reaper.UpdateItemInProject(activeItem)
            reaper.Undo_OnStateChange_Item(0, undoString, activeItem)
        end
    elseif next(tGroups, next(tGroups, nil)) then -- More than one take?
        reaper.Undo_OnStateChange2(0, undoString)
    elseif activeItem then
        if reaper.ValidatePtr2(0, activeItem, "MediaItem*") then
            reaper.Undo_OnStateChange_Item(0, undoString, activeItem)
        end
    end


    -- At the very end, no more notification windows will be opened, 
    --    so restore original focus - except if "Terminate script" dialog box is waiting for user
    if editor and reaper.MIDIEditor_GetMode(editor) ~= -1 then
        curForegroundWindow = reaper.JS_Window_GetForeground()
        if not (curForegroundWindow and reaper.JS_Window_GetTitle(curForegroundWindow) == reaper.JS_Localize("ReaScript task control", "common")) then
            reaper.JS_Window_SetForeground(editor)
            if windowUnderMouse and reaper.ValidatePtr(windowUnderMouse, "HWND") then reaper.JS_Window_SetFocus(windowUnderMouse) end
    end end           
    
end -- function AtExit   



--###############################################################################################
-------------------------------------------------------------------------------------------------
-- Returns true, laneType if CC lane could be parsed, 
--    true, nil if multiple visible lanes were enabled, and 
--    false if target lane is unusable or could not be parsed.
function SetupTargetLaneForParsing(laneID, target)
    -- Since 7bit CC, 14bit CC, channel pressure, and pitch all require somewhat different tweaks,
    --    these must often be distinguished. 
    -- Unlike some other scripts, the Draw ramp script only targets a single lane, not all visible ones.
    local SetupIndividualLane = {} -- Why not make setupIndividualLane a standard function?  Because I don't want this helper function to be listed in the right-click list
    setmetatable(SetupIndividualLane, {__index = function(t, laneType)
                                          if type(laneType) ~= "number" or laneType == 0xFFFF then
                                              laneIsALL = true
                                          elseif laneType == -1 then
                                              laneIsPIANOROLL, laneIsNOTES, laneMinValue, laneMaxValue = true, true, 0, 127
                                          elseif (0 <= laneType and laneType <= 127) then -- CC, 7 bit (single lane)
                                              laneIsCC7BIT, laneMinValue, laneMaxValue = true, 0, 127
                                              --tVisibleCC7Bit[laneType] = true
                                          elseif (laneType == 0x200) then
                                              laneIsVELOCITY, laneIsNOTES, laneMinValue, laneMaxValue = true, true, 1, 127
                                          elseif (laneType == 0x201) then
                                              laneIsPITCH, laneMinValue, laneMaxValue = true, 0, 16383
                                          elseif (laneType == 0x202) then
                                              laneIsPROGRAM, laneMinValue, laneMaxValue = true, 0, 127
                                          elseif (laneType == 0x203) then
                                              laneIsCHANPRESS, laneMinValue, laneMaxValue = true, 0, 127
                                          elseif (laneType == 0x204) then
                                              laneIsBANKPROG, laneMinValue, laneMaxValue = true, 0, 127
                                              --tVisibleCC7Bit[0]  = true
                                              --tVisibleCC7Bit[32] = true
                                          elseif (laneType == 0x205) then
                                              laneIsTEXT = true
                                          elseif (laneType == 0x206) then
                                              laneIsSYSEX = true
                                          elseif (laneType == 0x207) then
                                              laneIsOFFVEL, laneIsNOTES, laneMinValue, laneMaxValue = true, true, 0, 127
                                          elseif (laneType == 0x208) then
                                              laneIsNOTATION = true
                                          elseif (laneType == 0x210) then
                                              laneIsMEDIAITEM = true
                                          elseif (256 <= laneType and laneType <= 287) then -- CC, 14 bit (double lane)
                                              laneIsCC14BIT, laneMinValue, laneMaxValue = true, 0, 16383 
                                              --tVisibleCC7Bit[laneType-256] = true
                                              --tVisibleCC7Bit[laneType-224] = true
                                          else -- not a lane type in which script can be used.
                                             --reaper.MB("One or more of the CC lanes are of unknown type, and could not be parsed by this script.", "ERROR", 0)
                                             return false
                                          end
                                          
                                          return true
                                      end
                                      })

    if tME_Lanes[laneID] then
        ME_TargetTopPixel = tME_Lanes[laneID].topPixel
        ME_TargetBottomPixel = tME_Lanes[laneID].bottomPixel
        --if not (ME_TargetTopPixel and ME_TargetBottomPixel) or (ME_TargetBottomPixel - ME_TargetTopPixel < 
        local laneType = tME_Lanes[laneID].laneType
        
        local ok = SetupIndividualLane[laneType]
        
        return ok, laneType
    end
end


--##############################################################################################
------------------------------------------------------------------------------------------------
-- Lane numbers as used in the chunk's VELLANE field differ from those returned by API functions 
--    such as MIDIEditor_GetSetting_int(editor, "last_clicked").
--[[   last_clicked_cc_lane: returns 0-127=CC, 0x100|(0-31)=14-bit CC, 
       0x200=velocity, 0x201=pitch, 0x202=program, 0x203=channel pressure, 
       0x204=bank/program select, 0x205=text, 0x206=sysex, 0x207=off velocity]]
function ConvertCCTypeChunkToAPI(lane)
    local tLanes = {[ -1] = 0x200, -- Velocity
                    [128] = 0x201, -- Pitch
                    [129] = 0x202, -- Program select
                    [130] = 0x203, -- Channel pressure
                    [131] = 0x204, -- Bank/program
                    [132] = 0x205, -- Text
                    [133] = 0x206, -- Sysex
                    [167] = 0x207, -- Off velocity
                    [166] = 0x208, -- Notation
                    [ -2] = 0x210, -- Media Item lane
                   }    
    if type(lane) == "number" and 134 <= lane and lane <= 165 then 
        return (lane + 122) -- 14 bit CC range from 256-287 in API
    else 
        return (tLanes[lane] or lane) -- If 7bit CC, number remains the same
    end
end


--########################################
------------------------------------------
function GetInlineEditorCoordinates()

    activeTakeNum = activeTakeNum or reaper.GetMediaItemTakeInfo_Value(activeTake, "IP_TAKENUMBER")
    activeItem    = activeItem    or reaper.GetMediaItemTake_Item(activeTake)
    activeTrack   = activeTrack   or reaper.GetMediaItem_Track(activeItem)
    
    --[[
    number reaper.GetMediaItemInfo_Value(MediaItem item, string parmname)
    
    I_LASTY = reaper.GetMediaItemInfo_Value(activeItem, "I_LASTY") -- : int * : Y-position of track in pixels (read-only)
    I_LASTH = reaper.GetMediaItemInfo_Value(activeItem, "I_LASTH") -- : int * : height in track in pixels (read-only)
    F_FREEMODE_Y = reaper.GetMediaItemInfo_Value(activeItem, "F_FREEMODE_Y") -- : float * : free item positioning Y-position, 0=top of track, 1=bottom of track (will never be 1)
    F_FREEMODE_H = reaper.GetMediaItemInfo_Value(activeItem, "F_FREEMODE_H") -- : float * : free item positioning height, 0=no height, 1=full height of track (will never be 0)
    --D_POSITION : double * : item position in seconds
    --D_LENGTH : double * : item length in seconds
    
    --number reaper.GetMediaTrackInfo_Value(MediaTrack tr, string parmname)
    
    I_WNDH = reaper.GetMediaTrackInfo_Value(activeTrack, "I_WNDH") --: int * : current TCP window height in pixels including envelopes (read-only)
    I_TCPH = reaper.GetMediaTrackInfo_Value(activeTrack, "I_TCPH") --: int * : current TCP window height in pixels not including envelopes (read-only)
    I_TCPY = reaper.GetMediaTrackInfo_Value(activeTrack, "I_TCPY") --: int * : current TCP window Y-position in pixels relative to top of arrange view (read-only)
    I_HEIGHTOVERRIDE = reaper.GetMediaTrackInfo_Value(activeTrack, "I_HEIGHTOVERRIDE") -- : int * : custom height override for TCP window, 0 for none, otherwise size in pixels
    B_HEIGHTLOCK = reaper.GetMediaTrackInfo_Value(activeTrack, "B_HEIGHTLOCK") -- : bool * : track height lock (must set I_HEIGHTOVERRIDE before locking)
    B_FREEMODE = reaper.GetMediaTrackInfo_Value(activeTrack, "B_FREEMODE") -- : bool * : track free item positioning enabled (call UpdateTimeline() after changing)
    
    --number reaper.GetHZoomLevel() 
    --    returns pixels/second
    
    -- number start_time, number end_time = reaper.GetSet_ArrangeView2(ReaProject proj, boolean isSet, integer screen_x_start, integer screen_x_end) 
    --    Gets or sets the arrange view start/end time for screen coordinates. use screen_x_start=screen_x_end=0 to use the full arrange view's start/end time
    ]]
--[[
    trackH = reaper.GetMediaTrackInfo_Value(activeTrack, "I_TCPH") -- exclusing envelopes
    trackY = reaper.GetMediaTrackInfo_Value(activeTrack, "I_TCPY")
    if reaper.GetMediaTrackInfo_Value(activeTrack, "B_FREEMODE") then
        itemTop    = trackY  + reaper.GetMediaItemInfo_Value(activeItem, "F_FREEMODE_Y")*trackH
        itemHeight = reaper.GetMediaItemInfo_Value(activeItem, "F_FREEMODE_H")*trackH
        itemBottom = itemTop + itemHeight
    else 
        itemTop    = trackY
        itemHeight = treckH
        itemBottom = itemTop + itemHeight
    end
    ]]
    --[[
    arrangeLeftTime, arrangeRightTime = reaper.GetSet_ArrangeView2(0, false, 0, 0)
    pixelsPerSec = reaper.GetHZoomLevel() 
    mouseTime = arrangeLeftTime + mouseOrigX/pixelsPerSec
    itemLeft = pixelsPerSec * (reaper.GetMediaItemInfo_Value(activeItem, "D_POSITION") - arrangeLeftTime)
    itemRight = itemLeft + (pixelsPerSec * reaper.GetMediaItemInfo_Value(activeItem, "D_LENGTH"))
    ]]
    local itemTop = reaper.GetMediaTrackInfo_Value(activeTrack, "I_TCPY") + reaper.GetMediaItemInfo_Value(activeItem, "I_LASTY")
    local itemHeight = reaper.GetMediaItemInfo_Value(activeItem, "I_LASTH")
    local itemBottom = itemTop + itemHeight - 1
    
    local showTakesInLanes = (reaper.GetToggleCommandState(40435) == 1)
    if not showTakesInLanes then -- Options: Show all takes in lanes (when room)
        inline_TakeTopPixel, inline_TakeBottomPixel = itemTop, itemBottom
    else
        local tT = {}
        showEmptyTakes = (reaper.GetToggleCommandState(41346) == 1) -- Options: Show empty take lanes (align takes by recording pass)?   Must skip empty take lanes
        if not showEmptyTakes then -- Must skip empty take lanes
            for t = 0, reaper.CountTakes(activeItem)-1 do
                local take = reaper.GetTake(activeItem, t)
                if reaper.ValidatePtr2(0, activeTake, "MediaItem_Take*") then
                    tT[#tT+1] = t
                end
            end
        else 
            for t = 0, reaper.CountTakes(activeItem)-1 do
                tT[#tT+1] = t
            end
        end
        local takeHeight = itemHeight/#tT
        for t = 1, #tT do
            if tT[t] == activeTakeNum then 
                inline_TakeTopPixel    = (itemTop + (t-1)*takeHeight)//1
                inline_TakeBottomPixel = (inline_TakeTopPixel + takeHeight - 0.5)//1
                break 
            end
        end
    end
    return inline_TakeTopPixel, inline_TakeBottomPixel
end


--#############################################################################################
-----------------------------------------------------------------------------------------------
function SetupMIDIEditorInfoFromTakeChunk()
    -- This function assumes that activeTake and activeItem have already been determined and validated
    
    -- First, get the active take's part of the item's chunk.
    -- In the item chunk, each take's data is separate, and in the same order as the take numbers.
    local activeItem = activeItem or reaper.GetMediaItemTake_Item(activeTake)
    local chunkOK, chunk = reaper.GetItemStateChunk(activeItem, "", false)
        if not chunkOK then 
            reaper.MB("Could not get the state chunk of the active item.", "ERROR", 0) 
            return false
        end
    local takeNum = reaper.GetMediaItemTakeInfo_Value(activeTake, "IP_TAKENUMBER")
    local takeChunkStartPos = 1
    for t = 1, takeNum do
        takeChunkStartPos = chunk:find("\nTAKE[^\n]-\nNAME", takeChunkStartPos+1)
        if not takeChunkStartPos then 
            reaper.MB("Could not find the active take's part of the item state chunk.", "ERROR", 0) 
            return false
        end
    end
    local takeChunkEndPos = chunk:find("\nTAKE[^\n]-\nNAME", takeChunkStartPos+1)
    activeTakeChunk = chunk:sub(takeChunkStartPos, takeChunkEndPos)    
        
    -- MIDI editor and inline editor both need to know then active channel.  Inline is always timebase = time.
    activeChannel, ME_TimeBase = activeTakeChunk:match("\nCFGEDIT %S+ %S+ %S+ %S+ %S+ %S+ %S+ %S+ (%S+) %S+ %S+ %S+ %S+ %S+ %S+ %S+ %S+ %S+ (%S+)")
    
    -- Get editor coordinates, size and zoom.
    _, ME_Width, ME_Height = reaper.JS_Window_GetClientSize(windowUnderMouse) --takeChunk:match("CFGEDIT %S+ %S+ %S+ %S+ %S+ %S+ %S+ %S+ %S+ %S+ %S+ %S+ (%S+) (%S+) (%S+) (%S+)") 
        if not _ then reaper.MB("Could not determine the MIDI editor's client window pixel coordinates.", "ERROR", 0) return(false) end
        if ME_Width < 100 or ME_Height < 100 then reaper.MB("The MIDI editor is too small for editing with the mouse", "ERROR", 0) return(false) end
    if isInline then
        ME_LeftmostTime, ME_RightmostTime = reaper.GetSet_ArrangeView2(0, false, 0, 0)
        ME_LeftmostTick = reaper.MIDI_GetPPQPosFromProjTime(activeTake, ME_LeftmostTime)
        ME_PixelsPerSecond = reaper.GetHZoomLevel() 
        ME_TimeBase = "time"
        inline_TakeTopPixel, inline_TakeBottomPixel = GetInlineEditorCoordinates()
        if not (inline_TakeTopPixel and inline_TakeBottomPixel) then reaper.MB("Could not determine the coordinates of the inline editor.", "ERROR", 0) return false end
    else
        -- The MIDI editor scroll and zoom are hidden within the CFGEDITVIEW field 
        -- If the MIDI editor's timebase = project synced or project time, horizontal zoom is given as pixels per second.  If timebase is beats, pixels per tick
        local ME_HorzZoom
        ME_LeftmostTick, ME_HorzZoom, ME_TopPitch, ME_PixelsPerPitch = activeTakeChunk:match("\nCFGEDITVIEW (%S+) (%S+) (%S+) (%S+)")
        ME_LeftmostTick, ME_HorzZoom, ME_TopPitch, ME_PixelsPerPitch = tonumber(ME_LeftmostTick), tonumber(ME_HorzZoom), 127-tonumber(ME_TopPitch), tonumber(ME_PixelsPerPitch)
            if not (ME_LeftmostTick and ME_HorzZoom and ME_TopPitch and ME_PixelsPerPitch) then 
                reaper.MB("Could not determine the MIDI editor's zoom and scroll positions.", "ERROR", 0) 
                return(false) 
            end
        ME_LeftmostTime = reaper.MIDI_GetProjTimeFromPPQPos(activeTake, ME_LeftmostTick)
        
        ME_TimeBase = (ME_TimeBase == "0" or ME_TimeBase == "4") and "beats" or "time"
        if ME_TimeBase == "beats" then
            ME_PixelsPerTick = ME_HorzZoom
        else
            ME_PixelsPerSecond = ME_HorzZoom
        end
    end

    -- Now get the heights and types of all the CC lanes.
    -- !!!! WARNING: IF THE EDITOR DISPLAYS TWO LANE OF THE SAME TYPE/NUMBER, FOR EXAMPLE TWO MODWHEEL LANES, THE CHUNK WILL ONLY LIST ONE, AND THIS CODE WILL THEREFORE FAIL !!!!
    -- !!!! WARNING: IF THE NOTES AREA IS TOO SMALL, CHUNK VALUES ARE ALSO INACCURATE !!!!
    -- Chunk lists CC lane from top to bottom, so must first get each lane's height, from top to bottom, 
    --    then go in reverse direction, from bottom to top, calculating screen coordinates.
    -- Lane heights include lane divider (9 pixels high in MIDI editor, 8 in inline editor)
    local laneDividerHeight = isInline and 6 or 9
    
    local laneID = -1 -- lane = -1 is the notes area
    tME_Lanes[-1]   = {laneType = -1} --, inlineHeight = 100} -- inlineHeight is not accurate, but will simply be used to indicate that this "lane" is large enough to be visible.
    tME_Lanes[-1.5] = {laneType = "ruler"} --, inlineHeight = 100}
    for vellaneStr in activeTakeChunk:gmatch("\nVELLANE [^\n]+") do 
        local laneType, ME_LaneHeight, inline_LaneHeight = vellaneStr:match("VELLANE (%S+) (%d+) (%d+)")
        -- Lane number as used in the chunk differ from those returned by API functions such as MIDIEditor_GetSetting_int(editor, "last_clicked")
        laneType, ME_LaneHeight, inline_LaneHeight = ConvertCCTypeChunkToAPI(tonumber(laneType)), tonumber(ME_LaneHeight), tonumber(inline_LaneHeight)
        if not (laneType and ME_LaneHeight and inline_LaneHeight) then
            reaper.MB("Could not parse the VELLANE fields in the item state chunk.", "ERROR", 0)
            return(false)
        end    
        laneID = laneID + 1   
        tME_Lanes[laneID] = {VELLANE = vellaneStr, laneType = laneType, height = isInline and inline_LaneHeight or ME_LaneHeight}
        tME_Lanes[laneID-0.5] = {laneType = "divider", height = laneDividerHeight} --, inlineHeight = laneDividerHeight}
    end
    
        
    -- Now that we have the MIDI editor width, can calculate rightmost time for MIDI editor.
    -- Inline editor already got arrange view rightmostTime above
    if not isInline then
        if ME_TimeBase == "beats" then
            ME_RightmostTick = ME_LeftmostTick + (ME_Width-1)/ME_PixelsPerTick
            ME_RightmostTime = reaper.MIDI_GetProjTimeFromPPQPos(activeTake, ME_RightmostTick)
        else
            ME_RightmostTime = ME_LeftmostTime + (ME_Width-1)/ME_PixelsPerSecond
            --ME_RightmostTick = reaper.MIDI_GetPPQPosFromProjTime(activeTake, ME_RightmostTime)
        end
    end
        
    -- And now, calculate top and bottom pixels of each lane -- AND lane divider
    local laneBottomPixel   = isInline and inline_TakeBottomPixel or ME_Height-1
    local rulerHeight       = isInline and 17 or 62
    for i = #tME_Lanes, 0, -1 do
        tME_Lanes[i].bottomPixel = laneBottomPixel 
        tME_Lanes[i].topPixel    = laneBottomPixel - tME_Lanes[i].height + laneDividerHeight + 1
        tME_Lanes[i-0.5].bottomPixel = tME_Lanes[i].topPixel - 1
        tME_Lanes[i-0.5].topPixel    = tME_Lanes[i].topPixel - 9
        laneBottomPixel = laneBottomPixel - tME_Lanes[i].height
    end
        
    -- Notes area height is remainder after deducting 1) total CC lane height and 2) height (62 pixels) of Ruler/Marker/Region area at top of midiview
    tME_Lanes[-1].bottomPixel = laneBottomPixel
    tME_Lanes[-1].topPixel    = isInline and (inline_TakeTopPixel+rulerHeight) or rulerHeight
    tME_Lanes[-1].height      = laneBottomPixel-rulerHeight+1
    --ME_BottomPitch = ME_TopPitch - math.floor(tME_Lanes[-1].height / ME_PixelsPerPitch)
    
    -- Ruler/Marker/Region
    tME_Lanes[-1.5].bottomPixel = tME_Lanes[-1].topPixel - 1
    tME_Lanes[-1.5].topPixel    = isInline and inline_TakeTopPixel or 0
    tME_Lanes[-1.5].height      = rulerHeight
    
 
    -- Finally, finalize active channel info
    editAllChannels = activeTakeChunk:match("\nEVTFILTER (%S+) %S+ %S+ %S+ %S+ %S+ %S+ ")
    activeChannel   = tonumber(activeChannel)
    if not (activeChannel and editAllChannels) then
        reaper.MB("Could not determine the MIDI filter and active MIDI channel.", "ERROR", 0)
        return false
    else
        editAllChannels = (editAllChannels == "0")
        activeChannel = activeChannel - 1 
    end
    
    return true
    
end -- function SetupMIDIEditorInfoFromTakeChunk


--#########################################
-------------------------------------------
-- x and y are *client* coordinates
function GetCCLaneIDFromPoint(x, y)
    if 0 <= x and x < ME_Width then
        for i = -1, #tME_Lanes do
            if y < tME_Lanes[i].topPixel then
                return i - 0.5
            elseif y <= tME_Lanes[i].bottomPixel then
                return i
            end
        end
        return #tME_Lanes + 0.5
    end
end


--###########################
-----------------------------
function SetupEditableTakes()
    
    -- Get mouse starting TIME position, which will then be converted to ticks for each editable take
    if ME_TimeBase == "beats" then
        mouseOrigPPQPos = ME_LeftmostTick + mouseOrigX/ME_PixelsPerTick
        mouseOrigTimePos = reaper.MIDI_GetProjTimeFromPPQPos(activeTake, mouseOrigPPQPos)
    else -- ME_TimeBase == "time"
        mouseOrigTimePos = ME_LeftmostTime + mouseOrigX/ME_PixelsPerSecond
        mouseOrigPPQPos  = reaper.MIDI_GetPPQPosFromProjTime(activeTake, mouseOrigTimePos)
    end
    
    activeItem  = activeItem  or reaper.GetMediaItemTake_Item(activeTake)
    activeTrack = activeTrack or reaper.GetMediaItem_Track(activeItem)
    tTakeInfo[activeTake] = {item = activeItem, track = activeTrack}
    
    if not isInline then
        local midiSettingOK, midiSetting = reaper.get_config_var_string("midieditor") -- One MIDI editor per project?
        if midiSettingOK and tonumber(midiSetting)&3 == 1
        --and reaper.GetToggleCommandStateEx(sectionID, 40874) == 1 -- Options: Draw and edit CC events on all tracks
        and reaper.GetToggleCommandStateEx(sectionID, 40892) == 1 -- Options: MIDI track list/media item lane selection is linked to visibility
        and reaper.GetToggleCommandStateEx(sectionID, 40891) == 1 -- Options: MIDI track list/media item lane selection is linked to editability
        then
            local allTracks = (reaper.GetToggleCommandStateEx(sectionID, 40901) == 0) -- Options: Avoid automatically setting MIDI items from other tracks editable
            for i = 0, reaper.CountSelectedMediaItems(0)-1 do
                local item = reaper.GetSelectedMediaItem(0, i)
                if item and item ~= activeItem and reaper.ValidatePtr2(0, item, "MediaItem*") then -- Active take has already been saved
                    local track = reaper.GetMediaItem_Track(item)
                    if allTracks or track == activeTrack then
                        local take = reaper.GetActiveTake(item)
                        if take and reaper.ValidatePtr2(0, take, "MediaItem_Take*") and reaper.TakeIsMIDI(take) then                  
                            tTakeInfo[take] = {item = item, track = track} --, source = source, ppq = ppq, sourceLenTicks = sourceLenTicks, loopStartTick = loopStartTick}
                        end
                    end
                end
            end
        end
    end

    globalLeftmostItemStartTimePos = math.huge
    globalRightmostItemEndTimePos  = -math.huge
    
    for take, t in pairs(tTakeInfo) do
        -- Find MIDI source length and PPQ.  
        -- Source length will be used in other contexts too: When script terminates, check that no inadvertent shifts in PPQ position occurred.
        t.source = reaper.GetMediaItemTake_Source(take)
        local sourceLenQN, isQN = reaper.GetMediaSourceLength(t.source)
        local sourceStartQN = reaper.MIDI_GetProjQNFromPPQPos(take, 0)
        local playRate = reaper.GetMediaItemTakeInfo_Value(take, "D_PLAYRATE")
        t.ppq = (0.5 + reaper.MIDI_GetPPQPosFromProjQN(take, sourceStartQN + 1)/playRate)//1 -- Playrate is floating point, so must round 
        t.sourceLenTicks = (sourceLenQN*t.ppq)//1
        -- Find loop iteration closest to mouse position
        t.itemStartTimePos = reaper.GetMediaItemInfo_Value(t.item, "D_POSITION")
        t.sourceStartTimePos = t.itemStartTimePos - reaper.GetMediaItemTakeInfo_Value(take, "D_STARTOFFS")
        t.itemEndTimePos = t.itemStartTimePos + reaper.GetMediaItemInfo_Value(t.item, "D_LENGTH")
        
        if t.itemStartTimePos < globalLeftmostItemStartTimePos then globalLeftmostItemStartTimePos = t.itemStartTimePos end
        if t.itemEndTimePos > globalRightmostItemEndTimePos then globalRightmostItemEndTimePos = t.itemEndTimePos end
        
        local mouseTime = mouseOrigTimePos
        if mouseTime < t.itemStartTimePos then mouseTime = t.itemStartTimePos+0.0001 end
        if mouseTime > t.itemEndTimePos then mouseTime = t.itemEndTimePos-0.0001 end
        local mouseTick = reaper.MIDI_GetPPQPosFromProjTime(take, mouseTime)//1
        t.loopStartTick = (mouseTick // t.sourceLenTicks) * t.sourceLenTicks -- When converting ticks and time, must always add loopStartTick to event posision.
        
        t.itemFirstVisibleTick = math.ceil(reaper.MIDI_GetPPQPosFromProjTime(take, t.itemStartTimePos)) 
        t.itemLastVisibleTick  = math.floor(reaper.MIDI_GetPPQPosFromProjTime(take, t.itemEndTimePos)) -- 1 -- -1 is important, since this function returns tick that immediately *follows* the time position.
        t.minimumTick = math.max(0, t.itemFirstVisibleTick)
        t.maximumTick = math.min(t.sourceLenTicks, t.itemLastVisibleTick)
    end
end


--[[ Why parse using two passes?  
        1) In order to improve responsiveness, the script must display zones as quickly as possible. Zones require only global left/right positions and values.
        2) If every individual event is separated into a separate table entry in tMIDI, concatenation will be much slower.  
            Therefore, only events that may be altered by the script will be separated.  This include unselected CCs that fall in the same channel 
            as selected CCs, and that may therefore be deleted while stretching, if they overlap with the stretched selected CCs. 
            In order to know which channels contain selected CCs, the selected CCs must first be parsed, *after* which the unselected ones can be parsed in a second pass.
]]
--############################
------------------------------
function ParseMidi_FirstPass()

    -- Note that the global positions use time, whereas the within-take positions use ticks.  
    origLeftmostTime, origLeftmostValue, origRightmostTime, origRightmostValue, origNoteOffTime, origMaxValue, origMinValue = math.huge, nil, -math.huge, nil, -math.huge, -math.huge, math.huge
    
    for take, tInfo in pairs(tTakeInfo) do
        
        local t = {} -- Each distinct lane/channel that is used in this take, will get a table entry in t, which will later be stored in tGroups.
        local i = - 1 -- Starting index for enumeration of events 
        local takeMinValue, takeMaxValue, takeLeftmostTick, takeRightmostTick, takeNoteOffTick, takeLeftmostValue, takeRightmostValue = math.huge, -math.huge, nil, nil, -math.huge, nil, nil
        
        if laneIsALL then
        
            do ::getNextEvt::
                i = reaper.MIDI_EnumSelEvts(take, i)
                if i == -1 then 
                    goto gotAllEvts 
                else
                    local ok, selected, muted, ppqpos, msg = reaper.MIDI_GetEvt(take, i, true, false, 0, "")
                    local status = msg:byte(1)&0xF0
                    -- Each event type gets a distinctive group key.  Note that CCs require two bytes, for status, channel and number.
                    if msg:byte(1) == 0xFF then
                        if not t.text then t.text = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}} end
                    elseif status == 0xF0 then
                        if not t.sysex then t.sysex = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}} end
                    elseif status == 0x90 then
                        if not t.notes then t.notes = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}} end
                    elseif status == 0xB0 then
                        if not t[msg:sub(1,2)] then t[msg:sub(1,2)] = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}} end
                    elseif status > 0xB0 then
                        if not t[msg:byte(1)] then t[msg:byte(1)] = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}} end                           
                    end
                    takeLeftmostTick    = takeLeftmostTick or ppqpos
                    takeRightmostTick   = ppqpos
                    goto getNextEvt
                end
            ::gotAllEvts:: end
    
        elseif laneIsNOTES then
        
            do ::getNextNote:: 
                i = reaper.MIDI_EnumSelNotes(take, i)
                if i == -1 then 
                    goto gotAllNotes
                else
                    local retval, selected, muted, startppqpos, endppqpos, chan, pitch, vel = reaper.MIDI_GetNote(take, i)
                    takeLeftmostTick    = takeLeftmostTick or startppqpos
                    takeLeftmostValue   = takeLeftmostValue or vel
                    takeRightmostTick   = startppqpos
                    if vel > takeMaxValue then takeMaxValue = vel end
                    if vel < takeMinValue then takeMinValue = vel end
                    if endppqpos > takeNoteOffTick then 
                        takeNoteOffTick   = endppqpos 
                        takeRightmostValue  = vel
                    end 
                    goto getNextNote
                end
            ::gotAllNotes:: end
            if takeLeftmostTick then t.notes = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}} end
            
        elseif laneIsCC7BIT or laneIsCC14BIT then
        
            local ccType = laneIsCC14BIT and (mouseOrigCCLane-256) or mouseOrigCCLane -- Since we are only interested in finding ticks positions and used channels, no need to get LSB for 14 bit CCs
            do ::getNextCC::
                i = reaper.MIDI_EnumSelCC(take, i)
                if i == -1 then 
                    goto gotAllCCs
                else
                    local OK, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, i)
                    if msg2 == ccType and chanmsg == 0xB0 then --and (editAllChannels or chan == activeChannel) then 
                        if not t[chan] then t[chan] = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}, tChase = {}} end
                        takeLeftmostValue   = takeLeftmostValue or msg3
                        takeRightmostValue  = msg3
                        takeLeftmostTick    = takeLeftmostTick or ppqpos
                        takeRightmostTick   = ppqpos
                        if msg3 > takeMaxValue then takeMaxValue = msg3 end
                        if msg3 < takeMinValue then takeMinValue = msg3 end
                    end
                    goto getNextCC
                end
            ::gotAllCCs:: end
            if laneIsCC14BIT and takeLeftmostValue then takeMinValue, takeMaxValue, takeLeftmostValue, takeRightmostValue = takeMinValue<<7, takeMaxValue<<7, takeLeftmostValue<<7, takeRightmostValue<<7 end
            
        elseif laneIsPROGRAM then
        
            do ::getNextCC::
                i = reaper.MIDI_EnumSelCC(take, i)
                if i == -1 then 
                    goto gotAllCCs
                else
                    local OK, selected, muted, ppqpos, chanmsg, chan, msg2 = reaper.MIDI_GetCC(take, i)
                    if chanmsg == 0xC0 then 
                        if not t[chan] then t[chan] = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}, tChase = {}} end
                        takeLeftmostValue   = takeLeftmostValue or msg2
                        takeRightmostValue  = msg2
                        takeLeftmostTick    = takeLeftmostTick or ppqpos
                        takeRightmostTick   = ppqpos
                        if msg2 > takeMaxValue then takeMaxValue = msg2 end
                        if msg2 < takeMinValue then takeMinValue = msg2 end
                    end
                    goto getNextCC
                end
            ::gotAllCCs:: end
            
        elseif laneIsCHANPRESS then
        
            do ::getNextCC::
                i = reaper.MIDI_EnumSelCC(take, i)
                if i == -1 then 
                    goto gotAllCCs
                else
                    local OK, selected, muted, ppqpos, chanmsg, chan, msg2 = reaper.MIDI_GetCC(take, i)
                    if chanmsg == 0xD0 then 
                        if not t[chan] then t[chan] = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}, tChase = {}} end
                        takeLeftmostValue   = takeLeftmostValue or msg2
                        takeRightmostValue  = msg2
                        takeLeftmostTick    = takeLeftmostTick or ppqpos
                        takeRightmostTick   = ppqpos
                        if msg2 > takeMaxValue then takeMaxValue = msg2 end
                        if msg2 < takeMinValue then takeMinValue = msg2 end
                    end
                    goto getNextCC
                end
            ::gotAllCCs:: end
            
        elseif laneIsPITCH then
        
            do ::getNextCC::
                i = reaper.MIDI_EnumSelCC(take, i)
                if i == -1 then 
                    goto gotAllCCs
                else
                    local OK, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, i)
                    if chanmsg == 0xE0 then --and (editAllChannels or chan == activeChannel) then 
                        local value = ((msg3<<7) | msg2)
                        if not t[chan] then t[chan] = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}, tChase = {}} end
                        takeLeftmostValue   = takeLeftmostValue or value
                        takeRightmostValue  = value
                        takeLeftmostTick    = takeLeftmostTick or ppqpos
                        takeRightmostTick   = ppqpos
                        if value > takeMaxValue then takeMaxValue = value end
                        if value < takeMinValue then takeMinValue = value end
                    end
                    goto getNextCC
                end
            ::gotAllCCs:: end
            
        elseif laneIsTEXT then
            
            do ::getNextEvt::
                i = reaper.MIDI_EnumSelEvts(take, i)
                if i == -1 then 
                    goto gotAllEvts 
                else
                    local ok, selected, muted, ppqpos, msg = reaper.MIDI_GetEvt(take, i, true, false, 0, "")
                    if msg:byte(1) == 0xFF and msg:byte(2) ~= 0xF then
                        if not t.text then t.text = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}} end
                        takeLeftmostTick    = takeLeftmostTick or ppqpos
                        takeRightmostTick   = ppqpos
                    end
                    goto getNextEvt
                end
            ::gotAllEvts:: end
    
        elseif laneIsSYSEX then
            
            do ::getNextEvt::
                i = reaper.MIDI_EnumSelEvts(take, i)
                if i == -1 then 
                    goto gotAllEvts 
                else
                    local ok, selected, muted, ppqpos, msg = reaper.MIDI_GetEvt(take, i, true, false, 0, "")
                    if msg:byte(1)&0xF0 == 0xF0 and msg:byte(1) ~= 0xFF then
                        if not t.sysex then t.sysex = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}} end
                        takeLeftmostTick    = takeLeftmostTick or ppqpos
                        takeRightmostTick   = ppqpos
                    end
                    goto getNextEvt
                end
            ::gotAllEvts:: end
            
        elseif laneIsBANKPROG then
        
            do ::getNextCC::
                i = reaper.MIDI_EnumSelCC(take, i)
                if i == -1 then 
                    goto gotAllCCs
                else
                    local OK, selected, muted, ppqpos, chanmsg, chan, msg2, msg3 = reaper.MIDI_GetCC(take, i)
                    local id
                    if chanmsg == 0xC0 then -- Program
                        id = chanmsg|chan
                    elseif chanmsg == 0xB0 and (msg2 == 0 or msg2 == 32) then -- Bank select, MSB or LSB
                        id = string.char(chanmsg|chan, msg2)
                    end
                    if id then
                        if not t[id] then t[id] = {tT = {}, tA = {}, tI = {}, tM = {}, tM2 = {}, tV = {}, tT = {}, tC = {}, tF = {}, tF2 = {}, tP = {}, tOff = {}, tQ = {}, tD = {}} end
                        takeLeftmostTick    = takeLeftmostTick or ppqpos
                        takeRightmostTick   = ppqpos
                    end
                    goto getNextCC
                end
            ::gotAllCCs:: end
        
        end
        
        if takeLeftmostTick and takeRightmostTick and takeLeftmostTick <= takeRightmostTick then
            takeRightmostTick  = takeRightmostTick or takeNoteOffTick
            if takeNoteOffTick < takeRightmostTick then takeNoteOffTick = takeRightmostTick end
            local takeLeftmostTime  = tTimeFromTick[take][takeLeftmostTick]
            local takeRightmostTime = tTimeFromTick[take][takeRightmostTick]
            local takeNoteOffTime   = tTimeFromTick[take][takeNoteOffTick]
            
            -- When calculating the edge *values*, the active take and active channel takes precedence, so the the Tilt zone, will be drawn next to 
            if take == activeTake then 
                if takeLeftmostTime  <= origLeftmostTime  then origLeftmostTime, origLeftmostValue = takeLeftmostTime, takeLeftmostValue end
                if takeRightmostTime >= origRightmostTime then origRightmostTime, origRightmostValue = takeRightmostTime, takeRightmostValue end
            else
                if takeLeftmostTime  < origLeftmostTime  then origLeftmostTime, origLeftmostValue = takeLeftmostTime, takeLeftmostValue end
                if takeRightmostTime > origRightmostTime then origRightmostTime, origRightmostValue = takeRightmostTime, takeRightmostValue end
            end
            if takeNoteOffTime > origNoteOffTime then origNoteOffTime = takeNoteOffTime end
            if takeMaxValue > origMaxValue then origMaxValue = takeMaxValue end
            if takeMinValue < origMinValue then origMinValue = takeMinValue end
            tInfo.origLeftmostTick = takeLeftmostTick
            tInfo.origRightmostTick = takeRightmostTick
            tInfo.origNoteOffTick = takeNoteOffTick

            tGroups[take] = t
        else
            --tTakeInfo[take] = nil
        end
    end -- for take, t in pairs(tGroups)
    
    tSteps[0] = { --tGroups = tGroups,
                  globalLeftmostTime  = origLeftmostTime,   globalRightmostTime   = origRightmostTime, 
                  globalMaxValue      = origMaxValue,       globalMinValue        = origMinValue,
                  globalLeftmostValue = origLeftmostValue,  globalRightmostValue  = origRightmostValue,
                  globalNoteOffTime   = origNoteOffTime
                }

end


--##########################################################################
----------------------------------------------------------------------------
--[[ Why parse using two passes?  
        1) In order to improve responsiveness, the script must display zones as quickly as possible. Zones require only global left/right positions and values.
        2) If every individual event is separated into a separate table entry in tMIDI, concatenation will be much slower.  
            Therefore, only events that may be altered by the script will be separated.  This include unselected CCs that fall in the same channel 
            as selected CCs, and that may therefore be deleted while stretching, if they overlap with the stretched selected CCs. 
            In order to know which channels contain selected CCs, the selected CCs must first be parsed, *after* which the unselected ones can be parsed in a second pass.
]]
function ParseMidi_SecondPass()
    
    for take, tID in pairs(tGroups) do
    
        local getAllEvtsOK, MIDI = reaper.MIDI_GetAllEvts(take, "")
            if not getAllEvtsOK then reaper.MB("MIDI_GetAllEvts could not load the raw MIDI data.", "ERROR", 0) return "QUIT" end
          
        tTakeInfo[take].origMIDI = MIDI
        tMIDI[take] = {}
        local tMIDI = tMIDI[take]
        -- The abstracted info of targeted MIDI events (that will be edited) will be will be stored in
        --    several new tables such as tTicks and tValues.
        --[[ Clean up these tables in case starting again after sorting.
        local tI  = tIndices -- Indices of target events inside tMIDI -- will not change during editing
        local tO  = tPrevTicks -- Original offsets to events -- will not change during editing
        local tT  = tTicks -- Tick position of edited events -- tSteps[0] contain the original tick positions
        local tM  = tMsg
        local tM2 = tMsg2
        local tV  = tValues -- CC values, 14bit CC combined values, note velocities
        local tC  = tChannels
        local tF  = tFlags
        local tF2 = tFlags2 -- Flags of second event of multi-part events: 14bit CC LSB, or note note-offs.
        local tP  = tPitches -- This table will only be filled if laneIsVELOCITY / laneIsPIANOROLL / laneIsOFFVEL / laneIsNOTES
        local tOff  = tLengths -- Not lengths.  When editing all, lanes, will only be filled at indices that refer to notes.
        local tQ  = tMeta -- Meta events such as notation or Bézier tension.  Will only be filled at indices where notes have notation or CCs have tension.
        local e = 0]]
        
        -- This script does not scroll the MIDI editor if the mouse moves out of the client area, so the only CCs that
        --    may need to be deleted, are those visible in the editor, or within the range of the selected events. Only those will be separated into entries in tMIDI.
        local leftTickLimit  = math.min(tTakeInfo[take].origLeftmostTick,  tTickFromTime[take][ME_LeftmostTime]) -- tTakeInfo[take].loopStartTick)
        local rightTickLimit = math.max(tTakeInfo[take].origNoteOffTick, tTickFromTime[take][ME_RightmostTime]) -- tTakeInfo[take].loopStartTick) -- !!!!!!!!!!!!!!!!! length 
        tTakeInfo[take].leftTickLimit  = leftTickLimit
        tTakeInfo[take].rightTickLimit = rightTickLimit
        
        local origNoteOffTick = tTickFromTime[take][origNoteOffTime]
        
        -- Store LSB and MSB info in this table, so that can be combined with next matching CC while parsing.
        local t14 = {}
        local tNotes = {}
        for chan = 0, 15 do 
            t14[chan], tNotes[chan] = {}, nil --{} 
        end        
        
        -- The entire MIDI string does not need to be parsed.  
        -- Instead, go on till ticks reached beyond rightTickLimit, *and* got at least one further event that can be chased in each group.
        local tBeyond = {}
        for grp, t in pairs(tID) do
            if not (grp == "sysex" or grp == "text") then
                tBeyond[grp] = true
            end
        end
        --[[ Store note-on info
        local tNotes = {}
        if laneIsVELOCITY or laneIsPIANOROLL or laneIsOFFVEL then   
            for chan = 0, 15 do 
                tNotes[chan] = {} 
                for pitch = 0, 127 do
                    tNotes[chan][pitch] = {}
                end
            end
        end]]
        
        local prevPos, savePos = 1, 1 -- Position inside MIDI string while parsing / Last position not yet stored in tMIDI
        local ticks = 0 -- Running PPQ position of events while parsing
        --local offset, flags, msg
        
        local MIDILen = #MIDI
        local targetLane = mouseOrigCCLane
        local s_unpack, s_pack = string.unpack, string.pack
    
        if laneIsALL or laneIsPIANOROLL or laneIsBANKPROG then
            local tGrpN, tGrpT, tGrpS = tID.notes, tID.text, tID.sysex
            while prevPos < MIDILen do
                local offset, flags, msg, pos = s_unpack("i4Bs4", MIDI, prevPos)
                ticks = ticks + offset
                if ticks > rightTickLimit then break end
                if #msg >= 2 then
                    local status = msg:byte(1)&0xF0
                    local tGrpCC = tID[  (status == 0xB0) and msg:sub(1,2) or msg:byte(1)  ] -- CCs require two byte to distinguish their group: channel + lane
                    -- Text and notation
                    if msg:byte(1) == 0xFF then
                        -- Notation meta
                        -- Unlike Bezier meta events, notation events don't immediately follow their correspnding notes (prior to v5.9??)
                        --    but this code assumes that notation follows *before* the note-off.
                        if offset == 0 and msg:sub(2,6) == "\15NOTE" then
                            if tGrpN then
                                local notationChannel, notationPitch = msg:match("NOTE (%d+) (%d+) ")
                                if notationChannel and notationPitch then
                                    notationChannel = tonumber(notationChannel)
                                    notationPitch   = tonumber(notationPitch)
                                    local saved = tNotes[(notationPitch<<4) | notationChannel]
                                    if saved then
                                        if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                                        tMIDI[#tMIDI+1] = s_pack("i4Bs4", offset, 0, 0) -- Delete form tMIDI, since will be combined with note-on and note-off at note-on's entry
                                        tGrpN.tQ[saved] = MIDI:sub(prevPos, pos-1)
                                        savePos = pos
                                    end
                                end
                            end
                        elseif flags&1 == 1 then 
                            if tGrpT then
                                if prevPos > savePos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                                tMIDI[#tMIDI+1] = MIDI:sub(prevPos, pos-1) --(pos-#msg-5, pos-1)
                                savePos = pos
                                local i = #tGrpT.tT + 1
                                tGrpT.tI[i], tGrpT.tA[i] = #tMIDI, ticks-offset
                                tGrpT.tT[i], tGrpT.tM[i] = ticks, MIDI:sub(prevPos+4, pos-1)
                            end
                        end
                    elseif status == 0xF0 then
                        if tGrpS and flags&1 == 1 then
                            if prevPos > savePos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                            tMIDI[#tMIDI+1] = MIDI:sub(prevPos, pos-1)
                            savePos = pos
                            local i = #tGrpS.tT + 1
                            tGrpS.tI[i], tGrpS.tA[i] = #tMIDI, ticks-offset
                            tGrpS.tT[i], tGrpS.tM[i] = ticks, MIDI:sub(prevPos+4, pos-1)
                        end
                    -- Notes
                    -- Note-on
                    elseif status == 0x90 and msg:byte(3) ~= 0 then
                        if tGrpN and flags&1 == 1 then
                            if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                            tMIDI[#tMIDI+1] = ""
                            savePos = pos
                            local i = #tGrpN.tT+1
                            tGrpN.tI[i], tGrpN.tA[i] = #tMIDI, ticks-offset
                            tGrpN.tT[i], tGrpN.tM[i] = ticks, MIDI:sub(prevPos+4, pos-1)
                            local id = (msg:byte(2)<<4) | (msg:byte(1)&0x0F)
                            if tNotes[id] then 
                                reaper.MB("The script encountered overlapping notes, which cannot be parsed.\n\nOverlapping notes can be removed using the \"Correct overlapping notes\" action", "ERROR", 0)
                                return "QUIT"
                            else 
                                tNotes[id] = i 
                            end
                        end
                    -- Note-off
                    elseif status == 0x80 or (status == 0x90 and msg:byte(3) == 0) then
                        if tGrpN and flags&1 == 1 then
                            if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                            tMIDI[#tMIDI+1] = s_pack("i4", offset) .. "\0\0\0\0\0" -- Delete note-off from this position. If note-off has no note-on partner, will remain deleted.
                            savePos = pos
                            local id = (msg:byte(2)<<4) | (msg:byte(1)&0x0F)
                            local saved = tNotes[id]
                            if saved then
                                tGrpN.tOff[saved] = ticks
                                --t.tF2[saved]  = flags
                                tGrpN.tM2[saved]  = MIDI:sub(prevPos+4, pos-1) --msg
                            end
                            if ticks >= origNoteOffTick then tGrpN.noteWithLastNoteOff = saved end
                            tNotes[id] = nil
                        end
                    -- CCs
                    elseif tGrpCC then    
                        if flags&1 == 1 then 
                            if prevPos > savePos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                            tMIDI[#tMIDI+1] = MIDI:sub(prevPos, pos-1)
                            --local t = tID[msg:byte(1)]
                            local i = #tGrpCC.tT + 1
                            tGrpCC.tI[i], tGrpCC.tA[i], tGrpCC.tT[i] = #tMIDI, ticks-offset, ticks
                            if MIDI:sub(pos, pos+15) == "\0\0\0\0\0\12\0\0\0\255\15CCBZ " then 
                                tGrpCC.tM[i] = MIDI:sub(prevPos+4, pos+20) 
                                pos = pos + 21
                            else
                                tGrpCC.tM[i] = MIDI:sub(prevPos+4, pos-1)
                            end
                            savePos = pos
                        elseif leftTickLimit < ticks and ticks < rightTickLimit then
                            tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos+3) --pos-#msg-6) -- Exclude offset, which won't change when deleting with empty event
                            tMIDI[#tMIDI+1] = MIDI:sub(prevPos+4, pos-1) --(pos-#msg-5, pos-1)
                            savePos = pos
                            tGrpCC.tD[#tGrpCC.tD+1] = {index = #tMIDI, id = msg:byte(1)&0x0F, ticks = ticks, flagsMsg = tMIDI[#tMIDI]}
                        end
                    end
                end
                prevPos = pos
            end
        elseif laneIsCC7BIT then
            while prevPos < MIDILen do -- and next(tBeyond) do
                local offset, flags, msg, pos = s_unpack("i4Bs4", MIDI, prevPos)
                ticks = ticks + offset
                if #msg ~= 0 and msg:byte(2) == targetLane and (msg:byte(1))>>4 == 11 then
                    local grp = msg:byte(1)&0x0F
                    local t = tID[grp]
                    if t then
                        if flags&1==1 then
                            if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end --pos-#msg-10)
                            tMIDI[#tMIDI+1] = "" --if tMIDI[#tMIDI] ~= "" then tMIDI[#tMIDI+1] = "" end
                            local i = #t.tT + 1
                            if MIDI:sub(pos, pos+15) == "\0\0\0\0\0\12\0\0\0\255\15CCBZ " then t.tQ[i] = MIDI:sub(pos, pos+20) pos = pos + 21 end
                            savePos = pos
                            t.tI[i], t.tA[i] = #tMIDI, ticks-offset
                            t.tT[i], t.tF[i], t.tC[i], t.tV[i] = ticks, flags, msg:byte(1)&0x0F, msg:byte(3) -- tC not actually necessary, since ID = chan
                        else
                            if ticks < leftTickLimit then
                                t.tChase[1] = {ticks = ticks, value = msg:byte(3)} --chaseIndex = 1 --local tChase = tID[msg:byte(1)&0x0F].tChase[1] = {ticks = ticks, value = msg:byte(3)}
                            elseif ticks <= rightTickLimit then
                                t.tChase[#t.tChase+1] = {ticks = ticks, value = msg:byte(3)}
    
                                tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos+3) --pos-#msg-6) -- Exclude offset, which won't change when deleting with empty event
                                tMIDI[#tMIDI+1] = MIDI:sub(prevPos+4, pos-1) --(pos-#msg-5, pos-1)
                                savePos = pos
                                local tD = t.tD
                                tD[#tD+1] = {index = #tMIDI, id = msg:byte(1)&0x0F, ticks = ticks, flagsMsg = tMIDI[#tMIDI]}
                            elseif tBeyond[grp] then
                                t.tChase[#t.tChase+1] = {ticks = ticks, value = msg:byte(3)}
                                tBeyond[grp] = nil
                                if not next(tBeyond) then break end
                            end
                        end
                    end
                end
                prevPos = pos
            end
        elseif laneIsCC14BIT then
            local targetLaneMSB, targetLaneLSB = targetLane-256, targetLane-224
            local tRunning = {} -- Running 14-bit value.  Its MSB and LSB will be updated whenever a MSB or LSB is parsed.
            for grp in pairs(tID) do tRunning[grp] = 0 end
            while prevPos < MIDILen do
                local offset, flags, msg, pos = s_unpack("i4Bs4", MIDI, prevPos)
                ticks = ticks + offset
                if #msg ~= 0 and (msg:byte(1))>>4 == 11 then
                    local grp = msg:byte(1)&0x0F
                    local t = tID[grp]
                    if t then
                        local lane
                        if msg:byte(2) == targetLaneMSB and "MSB" then
                            lane = "MSB"
                            tRunning[grp] = (msg:byte(3)<<7)|(tRunning[grp]&0x7F)
                        elseif msg:byte(2) == targetLaneLSB then
                            lane = "LSB"
                            tRunning[grp] = (tRunning[grp]&0xFF80)|msg:byte(3)
                        end
                        if lane then
                            if flags&1==1 then           
                                if lane == "MSB" then --msg:byte(2) == targetLaneMSB then
                                    tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1)
                                    tMIDI[#tMIDI+1] = s_pack("i4Bs4", offset, 0, "")
                                    local meta = (MIDI:sub(pos, pos+15) == "\0\0\0\0\0\12\0\0\0\255\15CCBZ ") and MIDI:sub(pos, pos+20) or nil
                                    if meta then pos = pos + 21 end
                                    savePos = pos                               
                                    local saved = t14[grp][ticks]
                                    if saved and saved.valueLSB then -- combine with saved values, store in tID, delete record
                                        local i = #t.tT + 1
                                        t.tI[i], t.tA[i], t.tQ[i]   = #tMIDI, ticks-offset, meta
                                        t.tT[i], t.tF[i], t.tF2[i]  = ticks, flags, saved.flagsLSB
                                        t.tC[i], t.tV[i]            = grp, (msg:byte(3)<<7)|(saved.valueLSB) -- tC not actually necessary, since ID = chan
                                        t14[grp][ticks] = nil
                                    else -- save info, delete from midi string
                                        t14[grp][ticks] = {valueMSB = msg:byte(3), flagsMSB = flags, meta = meta}
                                    end
                                else --if msg:byte(2) == targetLaneLSB then
                                    tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1)
                                    tMIDI[#tMIDI+1] = s_pack("i4Bs4", offset, 0, "") -- LSB does not have envelope meta data
                                    savePos = pos
                                    local saved = t14[grp][ticks]
                                    if saved and saved.valueMSB then -- combine with saved values, store in tID, delete record
                                        local i = #t.tT + 1
                                        t.tI[i], t.tA[i], t.tQ[i]   = #tMIDI, ticks-offset, saved.meta
                                        t.tT[i], t.tF[i], t.tF2[i]  = ticks, saved.flagsMSB, flags
                                        t.tC[i], t.tV[i]            = grp, ((saved.valueMSB)<<7)|msg:byte(3) -- tC not actually necessary, since ID = chan
                                        t14[grp][ticks] = nil
                                    else -- save info, delete from midi string
                                        t14[grp][ticks] = {valueLSB = msg:byte(3), flagsLSB = flags}
                                    end
                                end -- if msg:byte(2) == targetLaneMSB then
                            else -- Unselected
                                if ticks < leftTickLimit then
                                    t.tChase[1] = {ticks = ticks, value = tRunning[grp]}
                                elseif ticks <= rightTickLimit then
                                    if #t.tChase ~= 0 and ticks == t.tChase[#t.tChase].ticks then
                                        t.tChase[#t.tChase].value = tRunning[grp]
                                    else
                                        t.tChase[#t.tChase+1] = {ticks = ticks, value = tRunning[grp]}
                                    end
                                    tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos+3) --pos-#msg-6) -- Exclude offset, which won't change when deleting with empty event
                                    tMIDI[#tMIDI+1] = MIDI:sub(prevPos+4, pos-1) --(pos-#msg-5, pos-1)
                                    savePos = pos
                                    local tD = t.tD
                                    tD[#tD+1] = {index = #tMIDI, id = msg:byte(1)&0x0F, ticks = ticks, flagsMsg = tMIDI[#tMIDI]}
                                elseif tBeyond[grp] then
                                    if #t.tChase ~= 0 and ticks == t.tChase[#t.tChase].ticks then
                                        t.tChase[#t.tChase].value = tRunning[grp]
                                        tBeyond[grp] = nil
                                        if not next(tBeyond) then break end
                                    else
                                        t.tChase[#t.tChase+1] = {ticks = ticks, value = tRunning[grp]}
                                    end                  
                                end
                                
                                --if chaseIndex then t.tChase[chaseIndex] = {ticks = ticks, value = tRunning[grp]} end
                                --if not next(tBeyond) then break end
                                
                                --[[local chaseIndex = (ticks < leftTickLimit and 1) or 
                                    local oldValue = 0
                                    if t.tChase[#t.tChase] and t.tChase[#t.tChase].ticks == ticks then
                                        local oldValue = t.tChase[#t.tChase].value
                                        tChase[#t.tChase] = {ticks = ticks, value = (oldValue&0xFF80)|(msg:byte(3))}
                                    end
                                        
                                        
                                --local lane = (msg:byte(2) == targetLaneMSB and "MSB") or (msg:byte(2) == targetLaneLSB and "LSB") or nil
                                --if lane then
                                    if lane == "MSB" then --msg:byte(2) == targetLaneMSB then
                                        
                                        tChase[1] = {ticks = ticks, value = (msg:byte(3)<<7)|(oldValue&0x007F)}
                                    else --if msg:byte(2) == targetLaneLSB then
                                        local tChase1 = tID[msg:byte(1)&0x0F].tChase
                                        local 
                                    end
                                elseif ticks <= rightTickLimit then
                                    tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos+3) -- Exclude offset, which won't change when deleting with empty event
                                    tMIDI[#tMIDI+1] = MIDI:sub(prevPos+4, pos-1)
                                    savePos = pos
                                    local tD = tID[msg:byte(1)&0x0F].tD
                                    tD[#tD+1] = {index = #tMIDI, id = msg:byte(1)&0x0F, ticks = ticks, flagsMsg = tMIDI[#tMIDI]}
                                end]]
                            end
                        end
                    end -- if t
                end -- if #msg ~= 0 and (msg:byte(1))>>4 == 11 then
                prevPos = pos
            end -- while prevPos < MIDILen do
        elseif laneIsPITCH then
            while prevPos < MIDILen do
                local offset, flags, msg, pos = s_unpack("i4Bs4", MIDI, prevPos)
                ticks = ticks + offset
                if #msg ~= 0 and (msg:byte(1)&0xF0) == 0xE0 then
                    local grp = msg:byte(1)&0x0F
                    local t = tID[grp]
                    if t then
                        if flags&1==1 then
                            if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                            tMIDI[#tMIDI+1] = ""
                            local e = #t.tT + 1
                            if MIDI:sub(pos, pos+15) == "\0\0\0\0\0\12\0\0\0\255\15CCBZ " then t.tQ[e] = MIDI:sub(pos, pos+20) pos = pos + 21 end
                            savePos = pos
                            t.tI[e], t.tA[e] = #tMIDI, ticks-offset
                            t.tT[e], t.tF[e], t.tC[e], t.tV[e] = ticks, flags, msg:byte(1)&0x0F, (msg:byte(3)<<7)|msg:byte(2) -- tC not actually necessary, since ID = chan
                        else
                            if ticks < leftTickLimit then
                                t.tChase[1] = {ticks = ticks, value = (msg:byte(3)<<7)|msg:byte(2)} --chaseIndex = 1 --local tChase = tID[msg:byte(1)&0x0F].tChase[1] = {ticks = ticks, value = msg:byte(3)}
                            elseif ticks <= rightTickLimit then
                                t.tChase[#t.tChase+1] = {ticks = ticks, value = (msg:byte(3)<<7)|msg:byte(2)}
    
                                tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos+3) --pos-#msg-6) -- Exclude offset, which won't change when deleting with empty event
                                tMIDI[#tMIDI+1] = MIDI:sub(prevPos+4, pos-1) --(pos-#msg-5, pos-1)
                                savePos = pos
                                local tD = t.tD
                                tD[#tD+1] = {index = #tMIDI, id = msg:byte(1)&0x0F, ticks = ticks, flagsMsg = tMIDI[#tMIDI]}
                            elseif tBeyond[grp] then
                                t.tChase[#t.tChase+1] = {ticks = ticks, value = (msg:byte(3)<<7)|msg:byte(2)}
                                tBeyond[grp] = nil
                                if not next(tBeyond) then break end
                            end
                        end
                    end
                end
                prevPos = pos
            end
        elseif laneIsPROGRAM then 
            while prevPos < MIDILen do
                local offset, flags, msg, pos = s_unpack("i4Bs4", MIDI, prevPos)
                ticks = ticks + offset
                if #msg ~= 0 and (msg:byte(1)&0xF0) == 0xC0 then
                    local grp = msg:byte(1)&0x0F
                    local t = tID[grp]
                    if t then
                        if flags&1==1 then
                            if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                            tMIDI[#tMIDI+1] = ""
                            local t = tID[msg:byte(1)&0x0F]
                            local e = #t.tT + 1
                            if MIDI:sub(pos, pos+15) == "\0\0\0\0\0\12\0\0\0\255\15CCBZ " then t.tQ[e] = MIDI:sub(pos, pos+20) pos = pos + 21 end
                            savePos = pos
                            t.tI[e], t.tA[e] = #tMIDI, ticks-offset
                            t.tT[e], t.tF[e], t.tC[e], t.tV[e] = ticks, flags, msg:byte(1)&0x0F, msg:byte(2) -- tC not actually necessary, since ID = chan
                        else
                            if ticks < leftTickLimit then
                                t.tChase[1] = {ticks = ticks, value = msg:byte(2)} --chaseIndex = 1 --local tChase = tID[msg:byte(1)&0x0F].tChase[1] = {ticks = ticks, value = msg:byte(3)}
                            elseif ticks <= rightTickLimit then
                                t.tChase[#t.tChase+1] = {ticks = ticks, value = msg:byte(2)}
                            
                                tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos+3) --pos-#msg-6) -- Exclude offset, which won't change when deleting with empty event
                                tMIDI[#tMIDI+1] = MIDI:sub(prevPos+4, pos-1) --(pos-#msg-5, pos-1)
                                savePos = pos
                                local tD = t.tD
                                tD[#tD+1] = {index = #tMIDI, id = msg:byte(1)&0x0F, ticks = ticks, flagsMsg = tMIDI[#tMIDI]}
                            elseif tBeyond[grp] then
                                t.tChase[#t.tChase+1] = {ticks = ticks, value = msg:byte(2)}
                                tBeyond[grp] = nil
                                if not next(tBeyond) then break end
                            end
                        end
                    end
                end
                prevPos = pos
            end
        elseif laneIsCHANPRESS then 
            while prevPos < MIDILen do
                local offset, flags, msg, pos = s_unpack("i4Bs4", MIDI, prevPos)
                ticks = ticks + offset
                if #msg ~= 0 and (msg:byte(1)&0xF0) == 0xD0 then
                    local grp = msg:byte(1)&0x0F
                    local t = tID[grp]
                    if t then
                        if flags&1==1 then
                            if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                            tMIDI[#tMIDI+1] = ""
                            local t = tID[msg:byte(1)&0x0F]
                            local e = #t.tT + 1
                            if MIDI:sub(pos, pos+15) == "\0\0\0\0\0\12\0\0\0\255\15CCBZ " then t.tQ[e] = MIDI:sub(pos, pos+20) pos = pos + 21 end
                            savePos = pos
                            t.tI[e], t.tA[e] = #tMIDI, ticks-offset
                            t.tT[e], t.tF[e], t.tC[e], t.tV[e] = ticks, flags, msg:byte(1)&0x0F, msg:byte(2) -- tC not actually necessary, since ID = chan
                        else                        
                            if ticks < leftTickLimit then
                                t.tChase[1] = {ticks = ticks, value = msg:byte(2)} --chaseIndex = 1 --local tChase = tID[msg:byte(1)&0x0F].tChase[1] = {ticks = ticks, value = msg:byte(3)}
                            elseif ticks <= rightTickLimit then
                                t.tChase[#t.tChase+1] = {ticks = ticks, value = msg:byte(2)}
                            
                                tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos+3) --pos-#msg-6) -- Exclude offset, which won't change when deleting with empty event
                                tMIDI[#tMIDI+1] = MIDI:sub(prevPos+4, pos-1) --(pos-#msg-5, pos-1)
                                savePos = pos
                                local tD = t.tD
                                tD[#tD+1] = {index = #tMIDI, id = msg:byte(1)&0x0F, ticks = ticks, flagsMsg = tMIDI[#tMIDI]}
                            elseif tBeyond[grp] then
                                t.tChase[#t.tChase+1] = {ticks = ticks, value = msg:byte(2)}
                                tBeyond[grp] = nil
                                if not next(tBeyond) then break end
                            end
                        end
                    end
                end
                prevPos = pos
            end
        --[[elseif laneIsVELOCITY or laneIsOFFVEL then 
            local t = tID.notes
            while prevPos < MIDILen do
                local offset, flags, msg, pos = s_unpack("i4Bs4", MIDI, prevPos)
                ticks = ticks + offset
                if flags&1==1 and #msg == 3 then 
                    -- Note-on
                    if msg:byte(1)>>4 == 9 and msg:byte(3) ~= 0 then
                        if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                        tMIDI[#tMIDI+1] = ""
                        savePos = pos
                        local i = #t.tT+1
                        t.tI[i], t.tA[i] = #tMIDI, ticks-offset
                        t.tT[i], t.tM[i] = ticks, MIDI:sub(prevPos+4, pos-1)
                        tNotes[msg:byte(1)&0x0F][msg:byte(2)] = i 
                    -- Note-off
                    elseif msg:byte(1)>>4 == 8 or (msg:byte(1)>>4 == 9 and msg:byte(3) == 0) then
                        if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                        tMIDI[#tMIDI+1] = s_pack("i4", offset) .. "\0\0\0\0\0" -- Delete note-off from this position. If note-off has no note-on partner, will remain deleted.
                        savePos = pos
                        local saved = tNotes[msg:byte(1)&0x0F][msg:byte(2)]
                        if saved then
                            t.tOff[saved] = ticks
                            --t.tF2[saved]  = flags
                            t.tM2[saved]  = MIDI:sub(prevPos+4, pos-1)
                        end
                        if ticks >= origNoteOffTick then t.noteWithLastNoteOff = saved end
                        tNotes[msg:byte(1)&0x0F][msg:byte(2)] = nil
                    end
                -- Notation meta
                -- Unlike Bezier meta events, notation events don't immediately follow their correspnding notes (prior to v5.9??)
                --    but this code assumes that notation follows *before* the note-off.
                elseif offset == 0 and msg:sub(1,6) == "\255\15NOTE" then
                    local notationChannel, notationPitch = msg:match("NOTE (%d+) (%d+) ")
                    if notationChannel and notationPitch then
                        notationChannel = tonumber(notationChannel)
                        notationPitch   = tonumber(notationPitch)
                        local saved = tNotes[notationChannel] and tNotes[notationChannel][notationPitch]
                        if saved then
                            if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                            tMIDI[#tMIDI+1] = s_pack("i4Bs4", offset, 0, 0) -- Delete form tMIDI, since will be combined with note-on and note-off at note-on's entry
                            t.tQ[saved] = MIDI:sub(prevPos, pos-1)
                            savePos = pos
                        end
                    end
                end            
                prevPos = pos
            end]]
        -- The data that is stored for Velocity and off-velocity only differ in tV.
        elseif laneIsVELOCITY or laneIsOFFVEL then 
            local t = tID.notes
            while prevPos < MIDILen do
                local offset, flags, msg, pos = s_unpack("i4Bs4", MIDI, prevPos)
                ticks = ticks + offset
                if flags&1==1 and #msg == 3 then 
                    -- Note-on
                    if msg:byte(1)>>4 == 9 and msg:byte(3) ~= 0 then
                        if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                        tMIDI[#tMIDI+1] = ""
                        savePos = pos
                        local i = #t.tT+1
                        t.tI[i], t.tA[i] = #tMIDI, ticks-offset
                        t.tT[i], t.tF[i], t.tC[i], t.tP[i], t.tM[i] = ticks, flags, msg:byte(1)&0x0F, msg:byte(2), msg
                        local id = (msg:byte(2)<<4) | msg:byte(1)&0x0F
                        if tNotes[id] then 
                            reaper.MB("The script encountered overlapping notes, which cannot be parsed.\n\nOverlapping notes can be removed using the \"Correct overlapping notes\" action", "ERROR", 0)
                            return "QUIT"
                        else
                            tNotes[id] = i 
                        end
                    -- Note-off
                    elseif msg:byte(1)>>4 == 8 or (msg:byte(1)>>4 == 9 and msg:byte(3) == 0) then
                        if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                        tMIDI[#tMIDI+1] = s_pack("i4", offset) .. "\0\0\0\0\0" -- Delete note-off from this position. If note-off has no note-on partner, will remain deleted.
                        savePos = pos
                        local id = (msg:byte(2)<<4) | msg:byte(1)&0x0F
                        local saved = tNotes[id]
                        if saved then
                            t.tOff[saved] = ticks -- - t.tT[saved]
                            t.tF2[saved]  = flags
                            t.tM2[saved]  = msg
                        end
                        if ticks >= origNoteOffTick then t.noteWithLastNoteOff = saved end
                        tNotes[id] = nil
                    end
                -- Notation meta
                -- Unlike Bezier meta events, notation events don't immediately follow their correspnding notes (prior to v5.9??)
                --    but this code assumes that notation follows *before* the note-off.
                elseif offset == 0 and msg:sub(1,6) == "\255\15NOTE" then
                    local notationChannel, notationPitch = msg:match("NOTE (%d+) (%d+) ")
                    if notationChannel and notationPitch then
                        notationChannel = tonumber(notationChannel)
                        notationPitch   = tonumber(notationPitch)
                        local saved = tNotes[(notationPitch<<4) | notationChannel]
                        if saved then
                            if savePos < prevPos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                            tMIDI[#tMIDI+1] = s_pack("i4Bs4", offset, 0, 0) -- Delete form tMIDI, since will be combined with note-on and note-off at note-on's entry
                            t.tQ[saved] = MIDI:sub(prevPos, pos-1)
                            savePos = pos
                        end
                    end
                end            
                prevPos = pos
            end
            -- The data that is stored for Velocity and off-velocity only differ in tV.
            local tM = laneIsVELOCITY and t.tM or t.tM2
            local tV = t.tV
            for i = 1, #tM do
                tV[i] = tM[i]:byte(3)
            end
        elseif laneIsTEXT then
            local tGrpT = tID.text
            while prevPos < MIDILen and ticks <= rightTickLimit do
                local offset, flags, msg, pos = s_unpack("i4Bs4", MIDI, prevPos)
                ticks = ticks + offset
                if flags&1 == 1 and msg ~= 0 and msg:byte(1) == 0xFF and msg:byte(2) ~= 0x0F then
                    if prevPos > savePos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                    tMIDI[#tMIDI+1] = MIDI:sub(prevPos, pos-1)
                    savePos = pos
                    local i = #tGrpT.tT + 1
                    tGrpT.tI[i], tGrpT.tA[i] = #tMIDI, ticks-offset
                    tGrpT.tT[i], tGrpT.tM[i] = ticks, MIDI:sub(prevPos+4, pos-1)
                end
                prevPos = pos
            end
        elseif laneIsSYSEX then
            local tGrpT = tID.sysex
            while prevPos < MIDILen and ticks <= rightTickLimit do
                local offset, flags, msg, pos = s_unpack("i4Bs4", MIDI, prevPos)
                ticks = ticks + offset
                if flags&1 == 1 and msg ~= 0 and msg:byte(1)&0xF0 == 0xF0 and msg:byte(1) ~= 0xFF then
                    if prevPos > savePos then tMIDI[#tMIDI+1] = MIDI:sub(savePos, prevPos-1) end
                    tMIDI[#tMIDI+1] = MIDI:sub(prevPos, pos-1)
                    savePos = pos
                    local i = #tGrpT.tT + 1
                    tGrpT.tI[i], tGrpT.tA[i] = #tMIDI, ticks-offset
                    tGrpT.tT[i], tGrpT.tM[i] = ticks, MIDI:sub(prevPos+4, pos-1)
                end
                prevPos = pos
            end
        end
        
        -- Insert all unselected events remaining
        tMIDI[#tMIDI+1] = MIDI:sub(savePos, nil)    
        
    end
    
    tSteps[0] = {tGroups = tGroups}
    GetAllEdgeValues(tSteps[0])
    
    return "NEXT"    
end


--###################################################################
---------------------------------------------------------------------
-- Set this script as the armed command that will be called by the 
--    "js_Mouse editing - Run script that is armed in toolbar" script
function ArmToolbarButton()
    
    if not (sectionID and commandID) then
        _, _, sectionID, commandID = reaper.get_action_context()
        if sectionID == nil or commandID == nil or sectionID == -1 or commandID == -1 then
            reaper.MB("Could not determine the action context of the script.", "ERROR", 0)
            return false
        end  
    end

    -- Make doubly sure all previous scripts were properly deactivated (set to NO state, not merely OFF, otherwise right-click arming won't work)
    prevCommandIDs = reaper.GetExtState("js_Mouse actions", "Previous commandIDs") or ""
    for prevCommandID in prevCommandIDs:gmatch("%d+") do
        prevCommandID = tonumber(prevCommandID)
        if prevCommandID == commandID then
            alreadyGotOwnCommand = true
        else
            reaper.SetToggleCommandState(sectionID, prevCommandID, -1)
            reaper.RefreshToolbar2(sectionID, prevCommandID)
        end
    end
    if not alreadyGotOwnCommand then
        prevCommandIDs = prevCommandIDs .. tostring(commandID) .. "|"
        reaper.SetExtState("js_Mouse actions", "Previous commandIDs", prevCommandIDs, false)
    end
    
    -- Toggle arming
    armedCommand = tonumber(reaper.GetExtState("js_Mouse actions", "Armed commandID") or "")
    if armedCommand == commandID then -- already armed, so disarm
        reaper.DeleteExtState("js_Mouse actions", "Armed commandID", true)
        reaper.SetToggleCommandState(sectionID, commandID, -1)
        reaper.RefreshToolbar2(sectionID, commandID)
        Tooltip("All scripts disarmed")
    else
        -- In this version of the Mouse editing scripts, the toolbar button is activated in the MAIN function, so no need to do it here too.
        reaper.SetExtState("js_Mouse actions", "Armed commandID", tostring(commandID), false)
        --reaper.SetToggleCommandState(sectionID, commandID, 1)
        --reaper.RefreshToolbar2(sectionID, commandID)
        Tooltip("Armed: Multi tool")
    end

    -- Must notify the AtExit function that button should not be deactivated when exiting.
    leaveToolbarButtonArmed = true
    
end -- ArmToolbarButton()


--######################
------------------------
-- This function displays a tooltip next to the mouse cursor, and moves the tooltip with the cursor for 0.5 seconds
local tooltipTime = 0
local tooltipText = ""
function Tooltip(text)
    if text then -- New tooltip text, so new tooltip
        tooltipTime = reaper.time_precise()
        tooltipText = text
        local x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip(tooltipText, x+10, y+10, true)
        reaper.defer(Tooltip)
    elseif pcallOK and continue and reaper.time_precise() < tooltipTime+1 then -- if not (pcallOK and pcallRetval), then script is quitting, so don't defer
        local x, y = reaper.GetMousePosition()
        reaper.TrackCtl_SetToolTip(tooltipText, x+10, y+10, true)
        reaper.defer(Tooltip)
    else
        reaper.TrackCtl_SetToolTip("", 0, 0, false)
    end
end


--############################
------------------------------
function CONSTRUCT_MIDI_STRING()

    local s_pack = string.pack
    local spacer = "\0\0\0\0\0"

    for take, tID in pairs(tSteps[#tSteps].tGroups) do
    
        local tMIDI = tMIDI[take]
        
        for id, t in pairs(tID) do
            local tI  = t.tI
            local tA  = t.tA
            local tT  = t.tT
            local tO  = tSteps[0].tGroups[take][id].tT -- Original tick positions
            local tV  = t.tV
            local tOff  = t.tOff
            local tM  = t.tM
            local tM2 = t.tM2
            local tC  = t.tC 
            local tF  = t.tF
            local tF2 = t.tF2
            local tP  = t.tP
            local tMeta = t.tQ -- Extra REAPER-specific non-MIDI metadata such as notation or Bezier tension.
            local sourceLengthTicks = tTakeInfo[take].sourceLenTicks
            --local tR  = tRanges
            
            local step = (tT[1] <= tT[#tT]) and 1 or -1
            local e    = (tT[1] <= tT[#tT]) and 0 or #tT+1
           
            for i = 1, #tI do          
                e = e + step
                
                local ticks = (tT[e]+0.5)//1
                local offTicks = tOff[e] and (tOff[e]+0.5)//1
                
                -- If event is out of bounds, delete and replace with spacer
                if ticks > sourceLengthTicks -- Beyond item bounds
                or (offTicks and offTicks <= 0) -- Note, and entire note is before item start
                or (not offTicks and ticks < 0) -- Not note, and before item start
                then
                    tMIDI[tI[i]] = s_pack("i4", tO[i]-tA[i]) .. spacer
                    
                -- Otherwise
                else
                    -- If note is partly inside items, trim to boundaries
                    if offTicks then 
                        if ticks < 0 then ticks = 0 end
                        if offTicks > sourceLengthTicks then offTicks = sourceLengthTicks end
                    end          
                
                    -- Trim values to lane min max values
                    local value = tV[e]
                    if value then
                        if      value < laneMinValue then value = laneMinValue
                        elseif  value > laneMaxValue then value = laneMaxValue
                        else    value = (value+0.5)//1
                        end
                    end
                                            
                    if laneIsCC7BIT then
                        tMIDI[tI[i]] = s_pack("i4BI4BBB", ticks-tA[i], tF[e], 3, 0xB0 | tC[e], mouseOrigCCLane, value) 
                                    .. (tMeta[e] or "") 
                                    .. ((ticks ~= tO[i]) and (s_pack("i4", tO[i]-ticks) .. spacer) or "")
                    elseif laneIsPITCH then
                        tMIDI[tI[i]] = s_pack("i4BI4BBB", ticks-tA[i], tF[e], 3, 0xE0 | tC[e], value&127, value>>7) 
                                    .. (tMeta[e] or "") 
                                    .. ((ticks ~= tO[i]) and (s_pack("i4", tO[i]-ticks) .. spacer) or "")
                    elseif laneIsCHANPRESS then
                        tMIDI[tI[i]] = s_pack("i4BI4BB", ticks-tA[i], tF[e], 2, 0xD0 | tC[e], value) 
                                    .. (tMeta[e] or "") 
                                    .. ((ticks ~= tO[i]) and (s_pack("i4", tO[i]-ticks) .. spacer) or "")
                    elseif laneIsCC14BIT then
                        tMIDI[tI[i]] = s_pack("i4BI4BBB", ticks-tA[i], tF[e], 3, 0xB0 | tC[e], mouseOrigCCLane-256, value>>7) 
                                    .. (tMeta[e] or "")
                                    .. s_pack("i4BI4BBB", 0, tF2[e], 3, 0xB0 | tC[e], mouseOrigCCLane-224, value&127)
                                    .. ((ticks ~= tO[i]) and (s_pack("i4", tO[i]-ticks) .. spacer) or "")
                    elseif laneIsVELOCITY then
                        tMIDI[tI[i]] = s_pack("i4BI4BBB", ticks-tA[i], tF[e], 3, 0x90 | tC[e], tP[e], value) 
                                    .. (tMeta[e] or "")
                                    .. s_pack("i4Bs4", offTicks-ticks, tF2[e], tM2[e])
                                    .. s_pack("i4", tO[i]-offTicks) .. spacer
                    elseif laneIsOFFVEL then
                        tMIDI[tI[i]] = s_pack("i4Bs4", ticks-tA[i], tF[e], tM[e]) 
                                    .. (tMeta[e] or "")
                                    .. s_pack("i4BI4BBB", offTicks-ticks, tF2[e], 3, 0x80 | tC[e], tP[e], value)
                                    .. s_pack("i4", tO[i]-offTicks) .. spacer
                    elseif laneIsPROGRAM then
                        tMIDI[tI[i]] = s_pack("i4Bi4BB", ticks-tA[i], tF[e], 2, 0xC0 | tC[e], value) 
                                    .. (tMeta[e] or "") 
                                    .. ((ticks ~= tO[i]) and (s_pack("i4", tO[i]-ticks) .. spacer) or "")
                    else -- all lanes that only move horizontally: if laneIsALL or laneIsTEXT or laneIsSYSEX or or laneIsBANKPROG or laneIsONLYHORZ then
                        if id == "notes" then
                            tMIDI[tI[i]] = s_pack("i4", ticks-tA[i]) .. tM[e] 
                                    .. (tMeta[e] or "")
                                    .. s_pack("i4", offTicks-ticks) .. tM2[e]
                                    .. s_pack("i4", tO[i]-offTicks) .. "\0\0\0\0\0"
                        else
                            tMIDI[tI[i]] = s_pack("i4", ticks-tA[i]) .. tM[e]
                                    .. (tMeta[e] or "") 
                                    .. ((ticks ~= tO[i]) and (s_pack("i4", tO[i]-ticks) .. spacer) or "")
                        end
                    end
                end
            end -- for i = 1, #tI do 
            
            -- If changing positions, delete overlapped CCs.  All CCs between original and new boundaries will be deleted -- not only those between new boundaries.
            if tSteps[#tSteps].isChangingPositions then
                local tD  = t.tD
                if tD and #tD > 0 then
                    local left, right         = tT[1], tT[#tT]
                    local origLeft, origRight = tSteps[0].tGroups[take][id].tT[1], tSteps[0].tGroups[take][id].tT[#tT] -- step 0 was sorted
                    if left > right then left, right = right, left end
                    if origLeft < left then left = origLeft end
                    if origRight > right then right = origRight end
                    
                    -- Binary search
                    local hi, lo = #tD, 1
                    while hi-lo > 1 do 
                        local mid = (lo+hi)//2
                        if tD[mid].ticks < left then
                            lo = mid
                        else 
                            hi = mid
                        end
                    end
    
                    -- Check each target event until one is reached that is beyond left/right bounds, and also not deleted.
                    --    Since overlapped events are always deleted in a contiguous block, the first non-deleted one is 
                    for i = hi, 1, -1 do
                        local d = tD[i]
                        if     right < d.ticks  then tMIDI[d.index] = d.flagsMsg
                        elseif left <= d.ticks  then tMIDI[d.index] = spacer
                        elseif tMIDI[d.index] == spacer then tMIDI[d.index] = d.flagsMsg
                        elseif d.ticks < left   then break
                        end
                    end
                    
                    for i = hi+1, #tD do
                        local d = tD[i]
                        if     d.ticks < left   then tMIDI[d.index] = d.flagsMsg
                        elseif d.ticks <= right then tMIDI[d.index] = spacer
                        elseif tMIDI[d.index] == spacer then tMIDI[d.index] = d.flagsMsg
                        elseif right < d.ticks  then break
                        end
                    end
                end
            end -- if tSteps[#tSteps].isChangingPositions then
        end -- for id, t in pairs(tID) do
        
        reaper.MIDI_SetAllEvts(take, table.concat(tMIDI))
        
    end -- for take, tID in pairs(tSteps[#tSteps].tGroups) do  
                  
    if isInline then reaper.UpdateItemInProject(activeItem) 
    elseif activeTakeForceUpdateMsg then reaper.MIDI_SetEvt(activeTake, 0, nil, nil, nil, activeTakeForceUpdateMsg, true)
    end
end


--#####################################################################################################
-------------------------------------------------------------------------------------------------------
function MAIN()
    
    -- Before doing anything that may terminate the script, use this trick to avoid automatically 
    --    creating undo states if nothing actually happened.
    -- Undo_OnStateChange will only be used if reaper.atexit(exit) has been executed
    --reaper.defer(function() end)  
    

    -- Check whether SWS and my own extension are available, as well as the required version of REAPER
    if not reaper.PromptForAction then
        reaper.MB("This script requires REAPER v6.12 or higher.", "ERROR", 0)
        return(false) 
    elseif not reaper.JS_LICE_LoadJPG then
        reaper.ShowConsoleMsg("\n\nURL to add ReaPack repository:\nhttps://github.com/ReaTeam/Extensions/raw/master/index.xml")
        reaper.ShowConsoleMsg("\n\nURL for direct download:\nhttps://github.com/juliansader/ReaExtensions")
        reaper.MB("This script requires an up-to-date version of the js_ReaScriptAPI extension."
               .. "\n\nThe js_ReaScripAPI extension can be installed via ReaPack, or can be downloaded manually."
               .. "\n\nTo install via ReaPack, ensure that the ReaTeam/Extensions repository is enabled. "
               .. "This repository should be enabled by default in recent versions of ReaPack, but if not, "
               .. "the repository can be added using the URL that should now be displayed in REAPER's Console."
               .. "\n\n(In REAPER's menu, go to Extensions -> ReaPack -> Import a repository.)"
               .. "\n\nTo install the extension manually, download the most recent version from Github, "
               .. "using the second URL displayed in the console, and copy it to REAPER's UserPlugins directory."
                , "ERROR", 0)
        return(false)
    -- Older versions of SWS had bugs in BR_GetMouseCursorContext
    elseif not reaper.SN_FocusMIDIEditor then 
        reaper.MB("This script requires an up-to-date version of the SWS/S&M extension, "
               .. "which can be downloaded from www.sws-extension.org."
                , "ERROR", 0)
        return(false) 
    end 
    
    
    -- ATEXIT BECOMES RELEVANT
    -- If anyting goes wrong during main(), a dialog box will pop up, so Exit() will try to return focus to original windows,
    -- This can only be done if the ReaScriptAPI extension is installed.
    reaper.atexit(AtExit)
    
    
    -- GET MOUSE AND KEYBOARD STARTING STATE
    -- as soon as possible.  Hopefully, if script is started with mouse click, mouse button will still be down.
    -- VKeys_Intercept is also urgent, because must prevent multiple WM_KEYDOWN message from being sent, which may trigger script termination.
    interceptKeysOK = (reaper.JS_VKeys_Intercept(-1, 1) > 0)
        if not interceptKeysOK then reaper.MB("Could not intercept keyboard input.", "ERROR", 0) return false end
    mouseState = reaper.JS_Mouse_GetState(0xFF)    
    mouseOrigScreenX, mouseOrigScreenY = reaper.GetMousePosition() -- In rest of script, x and y will be client coordinates
    startTime = reaper.time_precise()
    prevMouseInputTime = startTime + 0.5 -- In case mousewheel sends multiple messages, don't react to messages sent too closely spaced, so wait till little beyond startTime.
    keyState = reaper.JS_VKeys_GetState(-2):sub(VKLow, VKHi)
 
    
    -- CONFLICTING SCRIPTS
    -- Check whether other js_Mouse editing scripts are running
    if reaper.HasExtState("js_Mouse actions", "Status") then
        reaper.DeleteExtState("js_Mouse actions", "Status", true) -- Force other script to quit, or if previous script did not quit cleanly, clean up.
        return false
    else
        reaper.SetExtState("js_Mouse actions", "Status", "Running", false)
    end
    
    
    -- MOUSE CURSOR AND TOOLBAR BUTTON
    -- To give an impression of quick responsiveness, the script must change the cursor and toolbar button as soon as possible.
    -- (Later, the script will block "WM_SETCURSOR" to prevent REAPER from changing the cursor back after each defer cycle.)
    -- filename will also later be used to load cursors from the folder path.
    _, filename, sectionID, commandID = reaper.get_action_context()    
    if sectionID ~= nil and commandID ~= nil and sectionID ~= -1 and commandID ~= -1 then
        origToggleState = reaper.GetToggleCommandStateEx(sectionID, commandID)
        reaper.SetToggleCommandState(sectionID, commandID, 1)
        reaper.RefreshToolbar2(sectionID, commandID)
    end                  

    
    -- GET MIDI EDITOR UNDER MOUSE
    -- Unfortunately, REAPER's windows don't have the same titles or classes on all three platforms, so must use roundabout way
    -- If platform is Windows, the piano roll area is title "midiview", but not in Linux, and I'm not sure about MacOS.
    -- SWS uses Z order to find the midiview. In ReaScriptAPI, the equivalent would be JS_Window_GetRelated(parent, "CHILD"), "NEXT").
    -- But this is also not always reliable!  
    -- It seems to me that Window ID seems to me more cross-platform reliable than title or Z order.
    windowUnderMouse = reaper.JS_Window_FromPoint(mouseOrigScreenX, mouseOrigScreenY) 
    if windowUnderMouse then 

        mouseOrigX, mouseOrigY = reaper.JS_Window_ScreenToClient(windowUnderMouse, mouseOrigScreenX, mouseOrigScreenY) -- Always use client coordinates
        parentWindow = reaper.JS_Window_GetParent(windowUnderMouse)
        if parentWindow then

            -- Is the mouse over the piano roll of a MIDI editor?
            
            -- MIDI EDITOR:
            if reaper.MIDIEditor_GetMode(parentWindow) == 0 -- got a window in a MIDI editor
            and windowUnderMouse == reaper.JS_Window_FindChildByID(parentWindow, 1001) then -- The piano roll child window, titled "midiview" in Windows.

                isInline = false
                editor = parentWindow
                midiview, trackview = windowUnderMouse, nil           
                
                activeTake = reaper.MIDIEditor_GetTake(editor)
                activeTakeOK = activeTake and reaper.ValidatePtr2(0, activeTake, "MediaItem_Take*") and reaper.TakeIsMIDI(activeTake)
                if activeTakeOK then
                
                    activeItem = reaper.GetMediaItemTake_Item(activeTake)
                    activeItemOK = activeItem and reaper.ValidatePtr(activeItem, "MediaItem*") 
                end
                
            -- INLINE EDITOR:
            elseif parentWindow == reaper.GetMainHwnd() then
            
                isInline = true
                editor = nil
                midiview, trackview = nil, windowUnderMouse
                
                activeItem, activeTake = reaper.GetItemFromPoint(mouseOrigScreenX, mouseOrigScreenY, false)
                activeTakeOK = activeTake and reaper.ValidatePtr2(0, activeTake, "MediaItem_Take*") and reaper.TakeIsMIDI(activeTake) and reaper.BR_IsMidiOpenInInlineEditor(activeTake)
                activeItemOK = activeTakeOK and reaper.ValidatePtr(activeItem, "MediaItem*")
                
            end

            if activeItemOK then 
            
                -- Get MIDI editor structure from chunk, and store in tME_Lanes table.
                chunkStuffOK = SetupMIDIEditorInfoFromTakeChunk() 
                if chunkStuffOK then
                    
                    gotEditablesOK = pcall(SetupEditableTakes) -- Eh, should probably return false if encounter problem, rather than pcall
                    if gotEditablesOK then
                    
                        -- Get the part of the MIDI editor that is under the mouse. The lane IDs are slightly different (and more informative) 
                        --    then those returned by SWS's BR_ functions: -1.5 = ruler, -1 = piano roll, fractions are lane dividers
                        mouseOrigCCLaneID = GetCCLaneIDFromPoint(mouseOrigX, mouseOrigY)
                        if mouseOrigCCLaneID then
                            
                            -- Convert lane ID to the codes returned by reaper.MIDIEditor_GetSetting_int(editor, "last_clicked_lane")
                            --    Also set laneMinValue and laneMaxValue, and set the appropriate laneIsXXX to true.
                            targetLaneOK, mouseOrigCCLane = SetupTargetLaneForParsing(mouseOrigCCLaneID) 
                            if targetLaneOK then                                    
                                
                                gotEverythingOK  = true 
    end end end end end end end
   
   
    -- To keep things neater, all these error messages are here together
    if not gotEverythingOK then
        if not windowUnderMouse then
            reaper.MB("Could not determine the window under the mouse.", "ERROR", 0)
        elseif not parentWindow then
            reaper.MB("Could not determine the parent window of the window under the mouse.", "ERROR", 0)
        elseif (not isInline and not midiview) then
            ArmToolbarButton()
        elseif not activeTakeOK then
            if isInline then
                reaper.MB("The mouse should be positioned over an inline MIDI editor.", "ERROR", 0)
            else
                reaper.MB("Could not determine a valid MIDI take in the editor under the mouse.", "ERROR", 0)
            end
        elseif not activeItemOK then
            reaper.MB("Could not determine the media item to which the active take belongs.", "ERROR", 0)
        elseif not chunkStuffOK then
            -- The chunk functions give their own detailed error messages if something goes awry.
        elseif not gotEditablesOK then
            reaper.MB("Could not determine all editable takes", "ERROR", 0)        
        elseif not targetLaneOK then
            reaper.MB("One or more of the CC lanes are of unknown type, and could not be parsed by this script.", "ERROR", 0)
        end
        return false
    end   
    if laneIsNOTATION or laneIsMEDIAITEM then
        reaper.MB("This script cannot edit events in the notation or media item lanes.", "ERROR: Multi Tool", 0)
        return false
    end
    
    
    -- IS SNAPPING ENABLED?
    -- If snapping is enabled, the PPQ position must be adjusted to nearest grid.
    -- If snapping is not enabled, snappedOrigPPQPos = mouseOrigPPQPos, snapped to nearest tick
    -- NB: The rest of the function will work with snappedOrigPPQPos.
    if isInline then
        isSnapEnabled = (reaper.GetToggleCommandStateEx(0, 1157) == 1)
        -- Even is snapping is disabled, need PPperGrid and QNperGrid for LFO length
        local _, gridDividedByFour = reaper.GetSetProjectGrid(0, false) -- Arrange grid and MIDI grid are returned in different units
        QNperGrid = gridDividedByFour*4
    else
        isSnapEnabled = (reaper.MIDIEditor_GetSetting_int(editor, "snap_enabled") == 1)
        QNperGrid, _, _ = reaper.MIDI_GetGrid(activeTake) -- Quarter notes per grid
    end
    
    
    -- GET AND PARSE MIDI
    -- Time to process the MIDI of the take!
    -- As mentioned in the header, this script does not use the old-fashioned MIDI API functions such as 
    --    MIDI_InsertCC, since these functions are far too slow when dealing with thousands of events.
    --if not GetAndParseMIDIString() then return false end
    ParseMidi_FirstPass()
    if not next(tGroups) then
        reaper.MB("Could not find a sufficient number of selected events in the target lane(s)."
                --.. "\n\nNB: If the MIDI editor's filter is set to \"Edit active channel only\", the script will only edit events in the active channel."
                , "ERROR", 0)
        return false
    end
    -- If active take isn't edited, the MIDI editor doesn't update during defer cycles!  
    -- So get just one little piece of info from active take, that can be written in each cycle without changing anything.
    -- A MIDI take should never be completely empty, since it always has the All-Notes-Off at the end.
    if not tGroups[activeTake] then 
        activeTakeForceUpdateMsg = ({reaper.MIDI_GetEvt(activeTake, 0, true, false, 0, "")})[5]
        if not activeTakeForceUpdateMsg then
            reaper.MB("The active take appears to be completely devoid of any MIDI.\n\nThis is probably an error, since all MIDI takes should contain at least an All-Notes-Off marker."
                    , "ERROR", 0)
            return false
        end
    end
    selectedEditFunction = ParseMidi_SecondPass
    
        
    -- COMPOSITE GRAPHICS
    -- Display something onscreen as quickly as possible, for better user responsiveness
    OS = reaper.GetOS() 
    macOS = OS:match("OSX") -- On macOS, mouse events use opposite sign
    winOS = OS:match("Win")
    bitmap = reaper.JS_LICE_CreateBitmap(true, ME_Width, ME_Height)
        if not bitmap then reaper.MB("Could not create LICE bitmap", "ERROR", 0) return false end 
    compositeOK = reaper.JS_Composite(windowUnderMouse, 0, 0, ME_Width, ME_Height, bitmap, 0, 0, ME_Width, ME_Height)
    if compositeOK ~= 1 then reaper.MB("Cannot draw guidelines.\n\nCompositing error: "..tostring(compositeOK), "ERROR", 0) return false end
    DisplayZones()
    

    -- LOAD CURSORS
    filename = filename:gsub("\\", "/") -- Change Windows format to cross-platform
    filename = filename:match("^.*/") or "" -- Remove script filename, keeping directory
    tCursors = {HandTop       = "js_Mouse editing - Scale top.cur", -- The first time that the cursor is loaded in the session will be slow, but afterwards the extension will re-use previously loaded cursor
                HandBottom    = "js_Mouse editing - Scale bottom.cur",
                HandRight     = 431,
                HandLeft      = 430,
                Compress      = "js_Mouse editing - Multi compress.cur",
                ArpeggiateLR  = 502,
                ArpeggiateUD  = 503, -- REAPER's own arpeggiate up/down cursor
                Tilt          = 189, --"js_Mouse editing - Arch and Tilt.cur")
                Cross         = 464, -- Arrow with cross
                Arrow         = 32512, -- Standard IDC_ARROW
                Undo          = "js_Mouse editing - Undo.cur",
                Redo          = "js_Mouse editing - Redo.cur",
               }
    for name, source in pairs(tCursors) do
        if type(source) == "string" then
            tCursors[name] = reaper.JS_Mouse_LoadCursorFromFile(filename..source, true) -- The first time that the cursor is loaded in the session will be slow, but afterwards the extension will re-use previously loaded cursor
            if not tCursors[name] then reaper.MB("Could not load the \""..source.."\" cursor file.\n\nPlease ensure that this file is located in the same folder as the Lua script file.", "ERROR", 0) return false end
        else
            tCursors[name] = reaper.JS_Mouse_LoadCursor(source)
            if not tCursors[name] then reaper.MB("Could not load REAPER's native \""..name.."\" cursor, with number "..tostring(source)..".", "ERROR", 0) return false end
        end
    end

    
    -- INTERCEPT WINDOW MESSAGES:
    -- Do the magic that will allow the script to track mouse button and mousewheel events!
    -- The code assumes that all the message types will be blocked.  (Scripts that pass some messages through, must use other code.)
    -- tWM_Messages entries that are currently being intercepted but passed through, will temporarily be blocked and then restored when the script terminates.
    -- tWM_Messages entries that are already being intercepted and blocked, do not need to be changed or restored, so will be deleted from the table.
    pcallInterceptWM_OK, pcallInterceptWM_Retval = pcall(function()
        for message in pairs(tWM_Messages) do 
            local interceptWM_OK = -1  
            interceptWM_OK = reaper.JS_WindowMessage_Intercept(windowUnderMouse, message, false)
            -- Is message type already being intercepted by another script?
            if interceptWM_OK == 0 then 
                local prevIntercepted, prevPassthrough = reaper.JS_WindowMessage_Peek(windowUnderMouse, message)
                if prevIntercepted then
                    if prevPassthrough == false then
                        interceptWM_OK = 1 
                        tWM_Messages[message] = nil -- No need to change or restore this message type
                    else
                        interceptWM_OK = reaper.JS_WindowMessage_PassThrough(windowUnderMouse, message, false)
                        tWM_Messages[message] = true
                    end
                end
            end
            -- Intercept OK?
            if interceptWM_OK ~= 1 then 
                return false
            end
        end
        return true
    end)
    if not (pcallInterceptWM_OK and pcallInterceptWM_Retval) then return false end
    
    
    ------------------------------------------------------------
    -- Finally, startup completed OK, so can continue with loop! 
    
    return true 

end -- function Main()


--################################################
--------------------------------------------------
mainOK, mainRetval = pcall(MAIN)
if mainOK and mainRetval then DEFER_pcall() end -- START LOOPING!