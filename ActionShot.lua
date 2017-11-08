
-- SCREENSHOT_SUCCESS = "" -- 스크린샷 찍은 후 화면에 표시되는 "스크린샷 저장"이란 메세지 숨기기

local ActionShot = CreateFrame("Frame", "ActionShot", UIParent);

ActionShot:RegisterEvent("UNIT_SPELLCAST_SENT");      -- 주문을 시전했을 때
ActionShot:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED"); -- 주문이 성공했을 때

ActionShot:SetScript("OnEvent", function(Self, event, ...)
    if (event == "UNIT_SPELLCAST_SENT") then
	    local spellName = select(2, ...); -- 주문 이름 가져오기
        if (spellName == "돌진") then
        	C_Timer.After(0.5, Screenshot);
        elseif (spellName == "영웅의 도약") then
        	C_Timer.After(0.8, Screenshot);
        end
    elseif (event == "UNIT_SPELLCAST_SUCCEEDED") then
	    local spellName = select(2, ...); -- 주문 이름 가져오기
        if (spellName == "거인의 강타") then
        	C_Timer.After(0.1, Screenshot);
        	--Screenshot();
        elseif (spellName == "격돌"
            or spellName == "들이치기"
            or spellName == "마무리 일격"
            or spellName == "연전연승"
            or spellName == "투사의 혼"
            or spellName == "필사의 일격"
            or spellName == "회전베기"
            ) then
            C_Timer.After(0.3, Screenshot);
        end
    end
end);