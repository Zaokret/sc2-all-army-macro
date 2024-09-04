#Requires AutoHotkey v2.0

; Runs only if SC2_x64.exe is focused
#HotIf WinActive("ahk_exe SC2_x64.exe")

SetDefaultMouseSpeed(0)

ScreenWidth := A_ScreenWidth
ScreenHeight := A_ScreenHeight
CenterX := ScreenWidth // 2
CenterY :=  (ScreenHeight // 2) - 100 

ClickCenter() {
    Send("{Shift down}")
    Click(CenterX, CenterY)
    Send("{Shift up}")
}

armygroup() {
    Send "^{``}"                        ; Create camera location
    Send "{;}"                          ; Select all army hotkey
    Send "^3"                           ; Assign Selected Units To Hotkey 3
    Send ("00")                         ; Jump to hotkey 0 location
    Sleep(10)                           ; Wait for camera to jump
    ClickCenter()                       ; Deselects the centered unit 
    Send "4"                            ; Select Hotkey 4
    Send "!4"                           ; Steal Selected Units To Hotkey 4
    Send ("0")                          ; Select hotkey 0
    Click("M")                          ; Prevents double clicks 
    ClickCenter()                       ; Deselects the centered unit 
    Send "5"                            ; Select Hotkey 5
    Send "!5"                           ; Steal Selected Units To Hotkey 5
    Send "{``}"                         ; Jump to initial camera location
}

+F2::armygroup                     

#HotIf                             
