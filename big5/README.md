# 中文

執行bat檔案會關閉windows搜尋wifi功能，在開啟的cmd視窗提示`案任意鍵繼續`後會恢復wifi搜尋功能。

若執行失敗，請參考顯示資訊修改bat檔案內容，把**所有**`"Wi-Fi"`替換成顯示的介面卡名稱，需保留`"`。

bat檔案最後的`:launch_programs`可自行修改加上要一併開啟的程式。

# 下載

右鍵另存連結為

https://github.com/k8188219/wifi-autoconfig-toggle/raw/main/big5/wifi%20autoconfig%20toggle.bat

# 建議使用方式

- 簡易
    - 直接使用bat檔案

- 複雜
    1. 建立捷徑
        - 把bat檔案丟到想存放的位置
        - 對bat檔案按下右鍵建立捷徑
        - 對建立的捷徑按下右鍵選擇內容
        - 在捷徑tab下把執行改為最小化
        - 確定完成編輯
    2. 修改捷徑圖示
        - 對建立的捷徑按下右鍵選擇內容
        - 在捷徑tab下選變更圖示
        - 在`尋找這個檔案裡的圖示`中貼上`%SystemRoot%\System32\pnidui.dll`並按下`Enter`確定
        - 選擇你喜歡的wifi圖示並確定
        - 確定完成編輯
    3. 把捷徑放到方便存取的位置
