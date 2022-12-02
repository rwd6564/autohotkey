;=================================Gui==========================================
Gui, Add, Tab, w400 h450, 인터파크티켓|멜론티켓
Gui, Tab, 인터파크티켓
Gui, Add, Text, c1266FF , 마우스 현재좌표 얻기(ctrl+q)
Gui, Add, Text, w60 vNowX, X:
Gui, Add, Text, xp+50 w60 vNowY, Y:
Gui, Add, Text,, 좌표입력 버튼을 누르면 위의 좌표가 입력됩니다.

Gui, Add, GroupBox, c1266FF w80 x25 y100 r4, 날짜
Gui, Add, Edit, xp+10 yp+20 w60 vEX1
Gui, Add, Edit, w60 vEY1
Gui, Add, Button, gXY1, 좌표입력

Gui, Add, GroupBox, c1266FF w80 x25 y200 r4, 회차
Gui, Add, Edit, xp+10 yp+20 w60 vEX2
Gui Add, Edit, w60 vEY2
Gui, Add, Button, gXY2, 좌표입력

Gui, Add, GroupBox, c1266FF w80 x25 y300 r4, 예매하기
Gui, Add, Edit, xp+10 yp+20 w60 vEX3
Gui Add, Edit, w60 vEY3
Gui, Add, Button, gXY3, 좌표입력

Gui, Add, Button, x30 y410 gRun, 1단계 실행

Gui, Add, GroupBox, c1266FF w240 x115 y100 r5, 색상
Gui, Add, Radio, xp+10 yp+20 c7B68EE vPurple, ■
Gui, Add, Radio, cFB7242 vOrange, ■
Gui, Add, Radio, c1CA814 vGreen, ■
Gui, Add, Radio, c17B3FF vSkyBlue, ■
Gui, Add, Radio, cA0D53F vLightGreen, ■
Gui, Add, Button, gSel , 2단계 실행

Gui, Add, Text, xp+40 yp-95, 시작범위
Gui, Add, Edit, xp+10 yp+20 w60 vRange1X, 
Gui, Add, Edit, w60 vRange1Y,
Gui, Add, Button, gRange1, 좌표입력
Gui, Add, Text, xp+80 yp-73, 끝범위
Gui, Add, Edit, xp+10 yp+20 w60 vRange2X, 
Gui, Add, Edit, w60 vRange2Y,
Gui, Add, Button, gRange2, 좌표입력


Gui, Tab, 멜론티켓
Gui Show, , 티켓을 구하자   ; 프로그램 이름을 띄워줌

return 
;==================================func========================================
; X버튼을 눌렀을때 프로그램을 완전히 종료
GuiClose:
    {
	ExitApp
    }
    return 
    
F1::
    {
	ExitApp
    }
    return 


^q::   ; ctrl + q를 눌렀을때 실행할 코드
    CoordMode, Mouse, Screen   ; 마우스와 스크린의 좌표를 맞춰줌
    MouseGetPos, vx, vy   ; 마우스의 x, y좌표를 얻음
    GuiControl,, NowX, X:%vx%   ; EX에 vx값을 넣어 화면에 나타냄
    GuiControl,, NowY, Y:%vy%   ; EY에 vy값을 넣어 화면에 나타냄
    return

Run:
    ;MsgBox 좌표확인 %vEX1% %vEY1% %vEX2% %vEY2% %vEX3% %vEY3% 
    CoordMode, Mouse, Screen 
    if (vEX1 ) {
    Click %vEX1%, %vEY1%  ; 해당 좌표를 클릭
    Sleep, 50
    }
    if (vEX2 ) {
    Click %vEX2%, %vEY2%   ; 해당 좌표를 클릭
    Sleep, 50
    }
    if (vEX3 ) {
    Click %vEX3%, %vEY3%   ; 해당 좌표를 클릭
    Sleep, 50
    }
    return

XY1:
    GuiControl,, EX1, %vx%   ; EX에 vx값을 넣어 화면에 나타냄
    vEX1 = %vx%
    GuiControl,, EY1, %vy%   ; EY에 vy값을 넣어 화면에 나타냄
    vEY1 = %vy%
    return

XY2:
    GuiControl,, EX2, %vx%   ; EX에 vx값을 넣어 화면에 나타냄
    vEX2 = %vx%
    GuiControl,, EY2, %vy%   ; EY에 vy값을 넣어 화면에 나타냄
    vEY2 = %vy%
    return

XY3:
    GuiControl,, EX3, %vx%   ; EX에 vx값을 넣어 화면에 나타냄
    vEX3 = %vx%
    GuiControl,, EY3, %vy%   ; EY에 vy값을 넣어 화면에 나타냄
    vEY3 = %vy%
    return

Sel:
    gui,submit,nohide
    if (Purple = 1) {
    vColor = 7B68EE
    } else if (Orange = 1) {
    vColor = FB7242
    } else if (Green = 1) {
    vColor = 1CA814
    } else if (SkyBlue = 1) {
    vColor = 17B3FF
    } else if (vLightGreen = 1){
    vColor = A0D53F
    } else {
        MsgBox, 색상을 선택하세요.
    }

    CoordMode, Pixel, Screen
    CoordMode, Mouse, Screen

    vColorT = 0x%vColor%
    Loop {

            PixelSearch, vOutPutVarX, vOutPutVarY, %vRange1X%, %vRange1Y%, %vRange2X%, %vRange2Y%, vColorT, 2, Fast RGB
            if (errorlevel = 0) {
                ;MsgBox, %vColor% 찾았습니다. %vOutPutVarX% %vOutPutVarY%
                Click %vOutPutVarX% %vOutPutVarY%

                ImageSearch, vx, vy, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 red2.png
                if (ErrorLevel = 0)
                {
                  ;MsgBox, 이미지를 찾았습니다! `n찾은 좌표: %vx%`, %vy%
                  ;CoordMode, Mouse, Screen 
                  Click %vx%, %vy%
                }
                else
                {
                  ImageSearch, vx, vy, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 orange2.png
                  Click %vx%, %vy%
                 ;MsgBox, 이미지를 못 찾았습니다. (ErrorLevel = %ErrorLevel%)
                }
                  ImageSearch, vx, vy, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 ok.png
                  if (errorlevel = 0) {
                      Click %vx%, %vy%              
                      ;MsgBox, 확인찾음
                      sleep, 100                      
                  }else {
                    ;MsgBox, 확인못찾음
                  }

            } else if (errorlevel = 1) {
            ;MsgBox, %vRange1X%, %vRange1Y%, %vRange2X%, %vRange2Y%, 0x%vColor% 못찾았습니다.
            ;MsgBox, 색상을 찾지 못했습니다.
            break
            }
            
    }
    return

Range1:
    GuiControl,, Range1X, %vx%   
    vRange1X = %vx%
    GuiControl,, Range1Y, %vy%  
    vRange1Y = %vy%
    return

Range2:
    GuiControl,, Range2X, %vx%   
    vRange2X = %vx%
    GuiControl,, Range2Y, %vy%  
    vRange2Y = %vy%
    return    

