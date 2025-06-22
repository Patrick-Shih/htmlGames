#!/bin/bash

# =============================================================================
# 🚀 AWS Amplify 快速部署腳本
# 最適合靜態網站和前端專案
# =============================================================================

set -e

# 設定 AWS Profile 和 Region
export AWS_PROFILE=shedoh
export AWS_DEFAULT_REGION=ap-northeast-1

echo "🎮 HTML Games 快速部署工具"
echo "================================"
echo "🔧 使用 AWS Profile: $AWS_PROFILE"
echo "🌏 使用 AWS Region: $AWS_DEFAULT_REGION (台灣)"

# 檢查 AWS CLI 是否安裝
if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI 未安裝，請先安裝 AWS CLI"
    exit 1
fi

# 檢查 Node.js
if ! command -v node &> /dev/null; then
    echo "❌ 需要安裝 Node.js"
    echo "💡 請前往 https://nodejs.org/ 下載安裝"
    exit 1
fi

# 檢查 src 資料夾和 HTML 檔案
if [ ! -d "src" ]; then
    echo "❌ 找不到 src 資料夾"
    exit 1
fi

# 檢查 src 資料夾中是否有 HTML 檔案
if ! find src -name "*.html" -type f | grep -q .; then
    echo "❌ src 資料夾中沒有找到任何 HTML 檔案"
    exit 1
fi

echo "📁 找到以下 HTML 檔案："
find src -name "*.html" -type f | sed 's/^/   /'

# 檢查 Amplify CLI 是否安裝
if ! command -v amplify &> /dev/null; then
    echo "❌ Amplify CLI 未安裝，正在安裝..."
    npm install -g @aws-amplify/cli
fi

# 檢查 AWS Profile
if ! aws configure list-profiles | grep -q "shedoh"; then
    echo "❌ AWS Profile 'shedoh' 不存在，請先設定："
    echo "   aws configure --profile shedoh"
    exit 1
fi

echo "✅ 找到 AWS Profile: shedoh"

# 檢查和顯示 Region 設定
CURRENT_REGION=$(aws configure get region --profile shedoh 2>/dev/null || echo "")
if [ -z "$CURRENT_REGION" ]; then
    echo "⚠️  shedoh profile 沒有設定 region，將使用預設的 ap-northeast-1 (東京)"
elif [ "$CURRENT_REGION" != "ap-northeast-1" ]; then
    echo "ℹ️  shedoh profile 的 region 是 $CURRENT_REGION，但部署時會使用 ap-northeast-1 (東京)"
fi

# 檢查是否已經初始化 Amplify
if [ ! -f "amplify/.config/project-config.json" ]; then
    echo "🔧 首次部署，正在初始化 Amplify..."
    echo "📋 將使用 AWS Profile: $AWS_PROFILE"
    
    # 自動化 Amplify 初始化
    amplify init \
      --appId $(uuidgen) \
      --envName dev \
      --yes \
      --amplify "{\"envName\":\"dev\",\"defaultEditor\":\"code\"}" \
      --providers "{\"awscloudformation\":{\"configLevel\":\"project\",\"useProfile\":true,\"profileName\":\"$AWS_PROFILE\"}}"
    
    echo "✅ Amplify 初始化完成"
else
    echo "✅ Amplify 已初始化"
fi

# 檢查是否已經設定 hosting
if [ ! -f "amplify/backend/hosting/amplifyhosting/amplifyhosting-template.json" ]; then
    echo "🌐 設定靜態網頁 Hosting..."
    
    # 自動化 hosting 設定
    amplify add hosting \
      --yes \
      --hostingType manual \
      --app-type static \
      --framework none
    
    echo "✅ Hosting 設定完成"
else
    echo "✅ Hosting 已設定"
fi

# 設定固定自訂域名
CUSTOM_DOMAIN="games.shedoh.com"
echo ""
echo "🌐 使用自訂域名: $CUSTOM_DOMAIN"
export AMPLIFY_CUSTOM_DOMAIN=$CUSTOM_DOMAIN

echo ""
echo "🔨 準備部署文件..."

# 執行構建腳本
if [ -f "script/build.sh" ]; then
    echo "📦 執行構建腳本..."
    ./script/build.sh
else
    echo "📂 沒有找到構建腳本，手動創建 dist 目錄..."
    mkdir -p dist
    cp -r src/* dist/
    echo "✅ 檔案已複製到 dist 目錄"
fi

# 檢查 dist 目錄
if [ ! -d "dist" ]; then
    echo "❌ dist 目錄不存在，部署失敗"
    exit 1
fi

echo ""
echo "🚀 開始部署..."

# 執行部署，指定 dist 目錄
amplify publish \
  --yes \
  --path dist

# 顯示自訂域名資訊
echo ""
echo "🌐 自訂域名部署完成！"
echo "================================"
echo "🎮 遊戲網址: https://$CUSTOM_DOMAIN"
echo "📝 如需手動設定域名，請前往 Amplify 控制台"
echo "🔗 控制台: https://ap-northeast-1.console.aws.amazon.com/amplify/home?region=ap-northeast-1"

echo ""
echo "🎉 部署完成！"
echo "💡 你的遊戲網站已經上線了！"
echo ""
echo "📋 有用的指令："
echo "   amplify console         # 打開 AWS 控制台"
echo "   amplify status          # 檢查狀態"  
echo "   amplify publish         # 重新部署"
echo "   amplify delete          # 刪除所有資源" 