# 🎮 HTML Games Collection

一個現代化的 HTML 遊戲合集，採用原生 JavaScript 開發，提供流暢的遊戲體驗和美觀的用戶界面。

## 🎯 專案特色

- **🎨 現代化設計** - 漸層背景、毛玻璃效果、響應式佈局
- **⚡ 高效能** - 60 FPS 流暢遊戲體驗，優化的渲染引擎
- **🎮 多種遊戲** - 目前包含乒乓球對戰遊戲，持續擴展中
- **🤖 智能 AI** - 8 個難度等級，智能移動邏輯
- **🚀 一鍵部署** - 支援 AWS Amplify 雲端部署
- **🛠️ 開發友好** - 熱重載、本地開發服務器

## 🎮 遊戲列表

### 🏓 乒乓球對戰遊戲
- **8 個難度等級** - 從新手到專家
- **智能 AI 對手** - 兩階段移動邏輯，戰術性擊球
- **視覺效果** - 粒子特效、動畫反饋
- **操作簡單** - 方向鍵移動，空白鍵發球/加速

## 🚀 快速開始

### 📋 系統需求
- Node.js 16+ 
- 現代瀏覽器（Chrome、Firefox、Safari、Edge）

### 🔧 安裝步驟

```bash
# 1. 克隆專案
git clone <repository-url>
cd htmlGames

# 2. 安裝依賴
npm install

# 3. 啟動開發服務器
npm run dev
```

### 🌐 訪問遊戲
開啟瀏覽器，訪問 `http://localhost:3000`

## 📜 可用指令

### 🛠️ 開發指令
```bash
# 啟動開發服務器（熱重載）
npm run dev

# 啟動靜態服務器
npm start
npm run serve

# 自動開啟瀏覽器
npm run open
```

### 🚀 部署指令
```bash
# 完整部署流程（推薦）
npm run deploy

# 快速重新部署
npm run deploy:amplify

# 初始化部署環境
npm run deploy:init

# 檢查部署狀態
npm run deploy:status

# 打開 AWS 控制台
npm run deploy:console

# 刪除所有 AWS 資源
npm run deploy:delete
```

## 🎮 遊戲操作說明

### 🏓 乒乓球遊戲
- **移動橫桿：** ← → 方向鍵
- **發球：** 空白鍵
- **加速擊球：** 在球接近時按空白鍵
- **勝利條件：** 先得 5 分獲勝

### 🎯 難度說明
| 難度 | 特色 | 適合對象 |
|------|------|----------|
| 1-2  | 基礎速度，中心點追球 | 新手玩家 |
| 3-4  | 增加速度，開始戰術性移動 | 進階玩家 |
| 5-6  | 高速移動，智能擊球策略 | 熟練玩家 |
| 7-8  | 極限挑戰，專業級 AI | 專家玩家 |

## 🏗️ 專案結構

```
htmlGames/
├── src/                    # 遊戲源碼
│   ├── index.html         # 遊戲選單主頁
│   └── pingpong.html      # 乒乓球遊戲
├── amplify.yml            # AWS Amplify 配置
├── package.json           # 專案配置
├── quick-deploy.sh        # 部署腳本
├── serve-local.sh         # 本地服務器腳本
└── README.md             # 專案說明
```

## 🚀 部署說明

### AWS Amplify 部署（推薦）

1. **準備 AWS 帳戶**
   ```bash
   # 安裝 AWS CLI（如需要）
   npm install -g @aws-amplify/cli
   
   # 配置 shedoh profile（如果尚未配置）
   aws configure --profile shedoh
   # 建議設定 region 為 ap-northeast-1 (台灣)
   ```

   **🌏 Region 設定說明：**
   - 自動使用 `ap-northeast-1` (亞太地區-東京/台灣)
   - 提供最佳的台灣地區連線速度
   - 降低延遲，提升用戶體驗

2. **一鍵部署**
   ```bash
   npm run deploy
   ```

3. **後續更新**
   ```bash
   npm run deploy:amplify
   ```

### 其他部署選項
- **GitHub Pages** - 上傳到 GitHub 並啟用 Pages
- **Netlify** - 拖拽 `src/` 資料夾到 Netlify
- **Vercel** - 連接 GitHub 倉庫自動部署

## 🛠️ 開發指南

### 🎯 添加新遊戲
1. 在 `src/` 資料夾創建新的 HTML 檔案
2. 在 `src/index.html` 中添加遊戲卡片
3. 遵循現有的設計風格和結構

### 🎨 自定義樣式
- 所有樣式都內嵌在 HTML 檔案中
- 使用 CSS 變數便於主題切換
- 響應式設計支援各種螢幕尺寸

### ⚡ 效能優化
- 使用 `requestAnimationFrame` 確保流暢動畫
- 實現固定時間步長的遊戲迴圈
- 優化渲染減少不必要的重繪

## 🤝 貢獻指南

1. Fork 本專案
2. 創建功能分支 (`git checkout -b feature/新功能`)
3. 提交更改 (`git commit -m 'Add 新功能'`)
4. 推送到分支 (`git push origin feature/新功能`)
5. 創建 Pull Request

## 📝 更新日誌

### v1.0.0 (2024-01-XX)
- ✨ 初始版本發布
- 🏓 乒乓球遊戲完成
- 🎮 遊戲選單系統
- 🚀 AWS Amplify 部署支援
- 🛠️ 開發工具鏈完善

## 📄 授權協議

本專案採用 ISC 授權協議 - 詳見 [LICENSE](LICENSE) 檔案

## 🙏 致謝

- 感謝所有測試和反饋的朋友們
- 靈感來源於經典的 Pong 遊戲
- 使用了現代 Web 技術棧

---

**🎮 開始遊戲，享受樂趣！**

如有問題或建議，歡迎提交 Issue 或 Pull Request。

## 🏗️ AWS Amplify 運作機制

### Amplify 提供的服務
AWS Amplify 不只是將檔案上傳到 S3，而是提供完整的靜態網站託管服務：

| 服務 | 功能 | 自動提供 |
|------|------|----------|
| **Amazon S3** | 靜態檔案儲存 | ✅ |
| **CloudFront CDN** | 全球內容分發網路 | ✅ |
| **SSL/TLS 憑證** | HTTPS 加密連線 | ✅ |
| **自動域名** | `.amplifyapp.com` 子域名 | ✅ |
| **CI/CD 管道** | 自動建置和部署 | ✅ |

### 部署後的網站存取

1. **自動提供的域名**：
   ```
   https://[app-id].amplifyapp.com
   ```

2. **檔案對應關係**：
   ```
   https://[app-id].amplifyapp.com/           → src/index.html (遊戲選單)
   https://[app-id].amplifyapp.com/pingpong.html → src/pingpong.html (乒乓球遊戲)
   ```

3. **CloudFront CDN 優勢**：
   - 全球節點快速載入
   - 自動快取優化
   - 台灣地區低延遲存取

### 自訂域名設定（shedoh.com）

✅ **你的域名 `shedoh.com` 已在 Route 53 中設定好！**

#### 🌐 推薦的域名選項：
- `games.shedoh.com` - 專門用於遊戲（推薦）
- `play.shedoh.com` - 遊戲平台
- `shedoh.com` - 主域名

#### 🚀 自訂域名部署步驟：
1. **一鍵部署**：
   ```bash
   npm run deploy
   ```
   自動使用 `games.shedoh.com` 域名

2. **手動設定**：
   - 前往 [AWS Amplify 控制台](https://ap-northeast-1.console.aws.amazon.com/amplify/home?region=ap-northeast-1)
   - 選擇你的應用程式
   - 點擊「Domain management」
   - 添加自訂域名
   - 等待 SSL 憑證驗證

3. **域名管理指令**：
   ```bash
   npm run domain:console    # 開啟域名管理控制台
   npm run domain:status     # 檢查域名狀態
   ```

#### 🎯 設定完成後的存取方式：
```
https://games.shedoh.com/              → 遊戲選單
https://games.shedoh.com/pingpong.html → 乒乓球遊戲
```

**優勢**：
- 🔐 自動 SSL 憑證
- 🌍 全球 CDN 加速
- 📱 完全響應式設計
- ⚡ 亞洲地區優化（東京 region） 