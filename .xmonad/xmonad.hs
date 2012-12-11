--
-- xmonad example config file for xmonad-0.9
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
-- NOTE: Those updating from earlier xmonad versions, who use
-- EwmhDesktops, safeSpawn, WindowGo, or the simple-status-bar
-- setup functions (dzen, xmobar) probably need to change
-- xmonad.hs, please see the notes below, or the following
-- link for more details:
--
-- http://www.haskell.org/haskellwiki/Xmonad/Notable_changes_since_0.8
--


import XMonad hiding ((|||)) -- Hide default layout combination function |||

import XMonad.Prompt.Shell


import System.Posix.Env (getEnv)
import Data.Maybe (maybe)
import Data.Ratio
import Data.List
import Data.Monoid
import System.Exit
import System.IO
import XMonad.Util.Image
 
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
 
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

import XMonad.Layout.Tabbed
import XMonad.Layout.Spiral
import XMonad.Layout.LayoutHints
import XMonad.Layout.Combo
import XMonad.Layout.TwoPane
import XMonad.Layout.SubLayouts
import XMonad.Layout.Simplest
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Circle
import XMonad.Layout.Cross
import XMonad.Layout.SimplestFloat
import XMonad.Layout.LayoutScreens
import XMonad.Layout.SimpleFloat
import XMonad.Layout.ShowWName



--import XMonad.Layout.WindowNavigation
import XMonad.Layout.Renamed
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Magnifier
import XMonad.Layout.NoBorders
import XMonad.Layout.TabBarDecoration
import XMonad.Layout.MagicFocus
import XMonad.Layout.Spacing


import XMonad.Util.Run(spawnPipe)
import XMonad.Actions.GridSelect
import XMonad.Actions.CycleWS
import XMonad.Actions.Submap
import XMonad.Actions.WindowBringer --not working in F18
import XMonad.Actions.CycleWindows
import XMonad.Actions.SwapWorkspaces
import XMonad.Actions.FloatSnap
import XMonad.Actions.FloatKeys
import XMonad.Actions.WithAll
import XMonad.Actions.SpawnOn

import XMonad.Prompt
import XMonad.Prompt.Window


-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
 
-- Width of the window border in pixels.
--
myBorderWidth   = 2


myGridConfig = ( buildDefaultGSConfig defaultColorizer) { gs_navigate = navNSearch, gs_cellwidth = 400 }

myTabTheme = defaultTheme
    { activeColor         = "black"
    , activeTextColor     = "#87d7ff"
    , activeBorderColor   = "#87d7ff"
    , inactiveColor       = "black"
    , inactiveTextColor   = "#9C9C9C"
    , inactiveBorderColor = "#9C9C9C"
    , urgentColor         = "red"
    , urgentTextColor     = "yellow"
    , urgentBorderColor   = "yellow"
    }
myPromptConfig = defaultXPConfig
        { font                  = "xft:Bitstream Vera Sans Mono:size=08:antialias=true" 
        , bgColor               = "#000000"
        , fgColor               = "#ffffff"
        , fgHLight              = "#00ff00"
        , bgHLight              = "#212121"
        , borderColor           = "#000000"
        , promptBorderWidth     = 1
        , height                = 26
        , position              = Top
        --, autoComplete          = Just 500000
        }
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
 
-- NOTE: from 0.9.1 on numlock mask is set automatically. The numlockMask
-- setting should be removed from configs.
--
-- You can safely remove this even on earlier xmonad versions unless you
-- need to set it to something other than the default mod2Mask, (e.g. OSX).
--
-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--
-- myNumlockMask   = mod2Mask -- deprecated in xmonad-0.9.1
------------------------------------------------------------
 
 
-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
--
xmobarEscape = concatMap doubleLts where doubleLts '<' = "<<"; doubleLts x = [x]


myWorkspaceKeys   = [xK_grave] ++ [xK_1 .. xK_9] ++ [xK_0, xK_minus, xK_equal]
--myWorkspaces    = ["`:terminal","1:terminal","2:browser","3:browser","4:browser","5:remote","6:remote","7:remote","8:remote","9:eclipse","0:chat","-:minimized","=:misc"]
myWorkspaces      = ["`","1","2","3","4","5","6","7","8","9","0","-","="]
myWorkspaceLabels = ["terminal", "terminal", "browser", "browser", "browser", "remote", "remote", "remote", "remote", "eclipse", "chat", "minimized", "misc"]
myWorkspacePresentations workspaces labels = [ workspaces!!i ++ ":" ++ labels!!i 
                        | (i) <- [0..length(workspaces)-1] ]
-- clickableXmonadWorkspaces workspaces workspacePresentations = [ "<<action=xdotool key alt+" ++ show(workspaces!!i) ++ ">" ++ show(workspacePresentations!!i) ++ "<</action>" 
--                           | (i) <- [0..length(workspaces)-1]]


-- myWorkspaces    = ["1:terminal","2:browser","3:browser","4:eclipse","5:git","6:remote","7:remote","8:xchat","9:junk","0:misc","-:minimized","=:misc"]
 
-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#ff0000"
 
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
  -- launch a terminal
  [ 
  ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
  ,((mod4Mask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

  -- launch dmenu
  , ((modm,               xK_p     ), spawn "exe=`dmenu_run` && eval \"exec $exe\"")

  -- launch gmrun
  , ((modm .|. shiftMask, xK_p     ), spawn "google-chrome")

  -- display laptop only
  , ((modm .|. controlMask,               xK_l     ), spawn "find /home/dustin/.screenlayout | dmenu | xargs sh ")

  -- close focused window
  , ((modm .|. shiftMask, xK_c     ), kill)
  , ((mod4Mask          , xK_w     ), kill)

   -- Rotate through the available layout algorithms
  , ((modm,               xK_space ), sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default
  --  asks (layoutHook . config) >>= setLayout 
  , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size
  , ((modm,               xK_n     ), refresh)

  -- Move focus to the next window
  , ((modm,               xK_Tab   ), windows W.focusDown)

  -- Move focus to the next window
  , ((modm,               xK_j     ), windows W.focusDown )

  -- Move focus to the previous window
  , ((modm,               xK_k     ), windows W.focusUp  )

  -- Move focus to the master window
  , ((modm,               xK_m     ), windows W.focusMaster  )

  -- Swap the focused window and the master window
  , ((modm,               xK_Return), windows W.swapMaster)

  -- Swap the focused window with the next window
  , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

  -- Swap the focused window with the previous window
  , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

  -- Shrink the master area
  , ((modm,               xK_h     ), sendMessage Shrink)

  -- Expand the master area
  , ((modm,               xK_l     ), sendMessage Expand)

  -- Push window back into tiling
  , ((modm,               xK_t     ), withFocused $ windows . W.sink)
  , ((mod4Mask,           xK_t     ), sinkAll )

  -- Increment the number of windows in the master area
  , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

  -- Deincrement the number of windows in the master area
  , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

-- jumpt to urgnt
  , ((mod4Mask              , xK_Return), focusUrgent)

-- view in full screen
  ,((mod4Mask          , xK_space), do 
      withFocused $ windows . W.sink
      windows W.swapMaster 
      sendMessage $ JumpToLayout "Tabbed" )


--- Run stuff
    , ((mod4Mask, xK_r), submap . M.fromList $
        [ ((0, xK_c),     spawn "google-chrome")
        , ((0, xK_f),     spawn "firefox")
        , ((0, xK_m),     spawn "terminator -e 'alsamixer --view=all'")
        ])
--- Window Bringer
    , ((mod4Mask, xK_f), submap . M.fromList $
        [ ((0, xK_g),   gotoMenu  )
        , ((0, xK_b),   bringMenu )
        , ((mod4Mask , xK_g     ), windowPromptGoto  myPromptConfig )
        , ((mod4Mask , xK_b     ), windowPromptBring myPromptConfig )
        ])

  -- Toggle the status bar gap
  -- Use this binding with avoidStruts from Hooks.ManageDocks.
  -- See also the statusBar function from Hooks.DynamicLog.
  --
  -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

  -- Quit xmonad
  , ((modm .|. shiftMask .|. mod4Mask, xK_q     ), io (exitWith ExitSuccess))

  -- Restart xmonad
  , ((modm .|. shiftMask             , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

--spltwindow
  , ((modm                              , xK_backslash) , layoutSplitScreen 2 (TwoPane 0.5 0.5))
  , ((modm .|. controlMask              , xK_backslash) , layoutSplitScreen 2 (TwoPane 0.3 0.7))
  , ((modm .|. controlMask .|. mod4Mask , xK_backslash) , layoutSplitScreen 2 (TwoPane 0.7 0.3))
  , ((modm .|. shiftMask                , xK_backslash) , rescreen)
  , ((mod4Mask  .|. shiftMask           , xK_backslash) , rescreen)
  , ((mod4Mask                          , xK_backslash) , layoutSplitScreen 2 (Mirror(Tall 1 (2/100) (1/2))))
-- Tall 1 2/100 1/2

-- new evernote note
  , ((mod4Mask ,                 xK_n), spawn "google-chrome https://www.evernote.com/edit?newNote")
-- new evernote note
  , ((mod4Mask ,                 xK_e), spawn "google-chrome 'https://www.evernote.com/Home.action#ses=2&sh=5&sds=4&'")
-- magnifier
  , ((mod4Mask ,                 xK_m), sendMessage Toggle)

-- window nav
--    , (( mod4Mask, xK_l), sendMessage $ Go R)
--    , (( mod4Mask, xK_h), sendMessage $ Go L)
--    , (( mod4Mask, xK_k), sendMessage $ Go U)
--    , (( mod4Mask, xK_j), sendMessage $ Go D)
--    , (( mod4Mask .|. controlMask, xK_l), sendMessage $ Move R)
--    , (( mod4Mask .|. controlMask, xK_h), sendMessage $ Move L)
--    , (( mod4Mask .|. controlMask, xK_k), sendMessage $ Move U)
--    , (( mod4Mask .|. controlMask, xK_j), sendMessage $ Move D)

--cycle
  , ((modm,                   xK_Tab),toggleWS )
  , ((mod4Mask,                   xK_Tab),toggleWS )
  , ((mod4Mask .|. modm,               xK_j),  moveTo Next NonEmptyWS)
  , ((mod4Mask .|. modm,               xK_k),  moveTo Prev NonEmptyWS)
  , ((mod4Mask,               xK_j),  moveTo Next NonEmptyWS)
  , ((mod4Mask,               xK_k),  moveTo Prev NonEmptyWS)
  , ((mod4Mask .|. modm.|. shiftMask, xK_j),  shiftToNext >> nextWS )
  , ((mod4Mask .|. modm.|. shiftMask, xK_k),  shiftToPrev >> prevWS )
  , ((mod4Mask,               xK_z),  toggleWS)


--cycle windows
 --,((modm ,  xK_grave), cycleRecentWindows [controlMask] xK_grave xK_k )
      --,((modm ,  xK_grave), rotUnfocusedUp )
--grid
--import XMonad.Actions.GridSelect
    ,((mod4Mask, xK_g), goToSelected myGridConfig )
    ,((mod4Mask, xK_b), bringSelected myGridConfig )

--volume control
   , ((0, 0x1008FF12), spawn "amixer -q set Master toggle")
   , ((0, 0x1008FF11), spawn "amixer -q set Master 10%-")
   , ((0, 0x1008FF13), spawn "amixer -q set Master 10%+")

-- brightness
    , ((mod4Mask .|. shiftMask      , xK_minus ), spawn "xbacklight -dec 10%")
    , ((mod4Mask .|. shiftMask      , xK_equal), spawn "xbacklight -inc 10%")

  ]
  ++

 [((m .|. mod4Mask, k), windows $ f i)
       | (i, k) <- zip (XMonad.workspaces conf)(myWorkspaceKeys)
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

  ++


  [((m .|. modm, k), windows $ f i)
       | (i, k) <- zip (XMonad.workspaces conf)(myWorkspaceKeys)
       , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)
                   , (\i -> W.greedyView i . W.shift i, mod4Mask )]] 

 ++

 [((mod4Mask .|. modm , k), windows $ swapWithCurrent i)
     | (i, k) <- zip (XMonad.workspaces conf)( myWorkspaceKeys )]

 ++
  --
  -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
  --
  [((m .|. mod4Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_a, xK_s, xK_d] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
 
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

 
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
 
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
 
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
 
  -- Mouse scroll wheel to raise/lower windows
    , ((modm                 , button5), \w -> windows W.swapDown)
    , ((modm                 , button4), \w -> windows W.swapUp  )

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
      , ((mod4Mask, button4), \w -> moveTo Prev NonEmptyWS)
      , ((mod4Mask, button5), \w -> moveTo Next NonEmptyWS)
    ]
 
------------------------------------------------------------------------
-- Layouts:
 
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by defaultaass.
--
-- * NOTE: XMonad.Hooks.EwmhDesktops users must remove the obsoletaasse
-- ewmhDesktopsLayout modifier from layoutHook. It no longer exists.
-- Instead use the 'ewmh' function from that module to modify your
-- defaultConfig as a whole. (See also logHook, handleEventHook, anasd
-- startupHook ewmh notes.)
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
--myLayout = tiled ||| Mirror tiled ||| Full ||| simpleTabbed ||| Full 
--myLayout =  tall ||| mtall ||| myTabbed ||| mySpiral ||| (layoutHints(float)) 
myLayout =  mySpiral ||| mtall ||| myTabbed
  where
    -- float    = renamed [Replace "float"] (spacing 20 $ magicFocus $ tabBar shrinkText myTabTheme Top simplestFloat)
    -- float    = renamed [Replace "float"] (tabBar shrinkText myTabTheme Top $  spacing 26 $ magicFocus $ simplestFloat)
    -- circle   = renamed [Replace "circle"] (tabBar shrinkText myTabTheme Top Circle )
    halfTab  = renamed [Replace "hTabbed"] ( myTabbed *|* myTabbed )
    mySpiral = renamed [Replace "Spiral"] ( spiral (golden_ratio) )
    myTabbed = renamed [Replace "Tabbed"] (tabbed shrinkText myTabTheme )
    mtall    = renamed [Replace "mTiled"] ( Mirror (Tall nmaster delta half ))
    tall     = renamed [Replace "Tiled"] (Tall nmaster delta ratio)

    -- The default number of windows in the master pane
    nmaster = 1
 
    -- Default proportion of screen occupied by master pane
    ratio = 2/3
    golden_ratio = (2/(1+(toRational(sqrt(5)::Double))))
    half = 1/2

    -- Percent of screen to increment by when resizing panes
    delta   = 2/100
 
------------------------------------------------------------------------
-- Window rules:
 
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [
      title =? "Hangouts"        --> doShift "0:chat"
    , className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "Xchat"          --> doShift "8:xchat"
    , className =? "Eclipse"        --> doShift "9:eclipse"
    , className =? "Firefox"        --> doShift "3:browser"
    , className =? "virt-manager"   --> doShift "7:remote"
    , className =? "vinagre"        --> doShift "7:remote"
    , className =? "remmina"        --> doShift "7:remote"
    , className =? "Remmina"        --> doShift "7:remote"
    ,  fmap ( "Call with" `isInfixOf`) title --> doFloat
    , resource  =? "desktop_window" --> doIgnore
--    , resource  =? "desktop"        --> doIgnore
    , resource  =? "xfdesktop"      --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    , isFullscreen                  --> doFullFloat
    ]
 
------------------------------------------------------------------------
-- Event handling
 
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH event handling to your custom event hooks by
-- combining them with ewmhDesktopsEventHook.
--
 
------------------------------------------------------------------------
-- Status bars and logging
 
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH logHook actions to your custom log hook by
-- combining it with ewmhDesktopsLogHook.
--
 
------------------------------------------------------------------------
-- Startup hook
 
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add initialization of EWMH support to your custom startup
-- hook by combining it with ewmhDesktopsStartup.
--
 
------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
 
-- Run xmonad with the settings you specify. No need to modify this.
--
--main = xmonad defaults
 
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- ue the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
--


-- default desktop configuration for Fedora


--import System.Posix.Env (getEnv)
--import Data.Maybe (maybe)
--
--import XMonad
--import XMonad.Config.Desktop
--import XMonad.Config.Gnome
--import XMonad.Config.Kde
--import XMonad.Config.Xfce
--

myDzenPP x = dzenPP {
  ppOutput             =  hPutStrLn x
  , ppCurrent          =  dzenColor "#ffff87" "" . pad . wrap "| " " |"
  , ppVisible          =  dzenColor "#d0d0d0" "#1B1D1E" . pad
  , ppHidden           =  dzenColor "#d0d0d0" "#1B1D1E" . pad
  -- , ppHiddenNoWindows  =  dzenColor "#7b7b7b" "#1B1D1E" . pad
  , ppUrgent           =  dzenColor "yellow" "red" . dzenStrip
  , ppTitle            =  dzenColor "#87d7ff" "" . shorten 100
  , ppWsSep            =  " "
  , ppSep              =  " | "
  , ppLayout           =  dzenColor "#ff8787" "" 
}

myXmobarPP x = xmobarPP { 
  ppOutput             =  hPutStrLn x
  , ppCurrent          =  xmobarColor "#ffff87" "" . pad . wrap "|" "|"
  , ppVisible          =  xmobarColor "#d0d0d0" "#1B1D1E" . pad
  , ppHidden           =  xmobarColor "#d0d0d0" "#1B1D1E" . pad
  -- , ppHiddenNoWindows  =  xmobarColor "#7b7b7b" "#1B1D1E" . pad
  , ppUrgent           =  xmobarColor "yellow" "red" . xmobarStrip
  , ppTitle            =  xmobarColor "#87d7ff" "" . shorten 100
  , ppWsSep            =  " "
  , ppSep              =  "<fc=#AFAF87> | </fc>"
  , ppLayout           =  xmobarColor "#ff8787" "" 
  , ppOrder = \(ws:_:t:_) -> [ws,t]
}

urgentConfig = UrgencyConfig { suppressWhen = XMonad.Hooks.UrgencyHook.Never, remindWhen = Every 10 }
myUrgencyHook = SpawnUrgencyHook "aplay /home/dustin/.local/sounds/xmonad_urgent.wav 2> /tmp/err;"
main = do
     xmproc <- spawnPipe "xmobar"
     xmproc2 <- spawnPipe "dzen2 -p -xs 2 -ta l -e 'onstart=lower' -fn 'Bitstream Vera Sans Mono:size=10:antialias=true'"
--     xmonad  $ withUrgencyHookC myUrgencyHook urgentConfig $ defaultConfig
     xmonad  $ withUrgencyHookC myUrgencyHook urgentConfig $ xfceConfig
       { 
         workspaces = myWorkspacePresentations myWorkspaces myWorkspaceLabels
       , manageHook = myManageHook <+> manageDocks  <+> manageHook defaultConfig
       , layoutHook = showWName $ avoidStruts $  smartBorders $ magnifierOff $ myLayout 
       , logHook = dynamicLogWithPP (myXmobarPP xmproc) <+> logHook desktopConfig <+> dynamicLogWithPP (myDzenPP xmproc2)
       , startupHook = do
          setWMName "LG3D" 
          spawn "sleep 20;$HOME/.xmonad/hook startup"
       , borderWidth        = 2
       , terminal           = "terminator || xterm"
       , normalBorderColor  = "#505050"
       , focusedBorderColor = "#009DFF" 
       ,  focusFollowsMouse = True
       , keys               = myKeys
       --, modMask     = mod4Mask
       }
--
--desktop "gnome" = gnomeConfig
--desktop "kde" = kde4Config
--desktop "xfce" = xfceConfig
--desktop "xmonad-gnome" = gnomeConfig
--desktop _ = desktopConfig
desktop _ = xfceConfig
