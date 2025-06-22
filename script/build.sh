#!/bin/bash

# =============================================================================
# 📦 HTML Games 構建腳本
# 將 src 目錄內容複製到 dist 目錄，準備部署
# =============================================================================

set -e

echo "🔨 開始構建 HTML Games..."
echo "================================"

# 設定目錄路徑
SRC_DIR="src"
DIST_DIR="dist"

# 檢查 src 目錄是否存在
if [ ! -d "$SRC_DIR" ]; then
    echo "❌ 找不到 $SRC_DIR 目錄"
    exit 1
fi

# 檢查 src 目錄中是否有檔案
if [ -z "$(ls -A $SRC_DIR)" ]; then
    echo "❌ $SRC_DIR 目錄是空的"
    exit 1
fi

echo "📁 來源目錄: $SRC_DIR"
echo "📁 目標目錄: $DIST_DIR"

# 清理或創建 dist 目錄
if [ -d "$DIST_DIR" ]; then
    echo "🧹 清理現有的 $DIST_DIR 目錄..."
    rm -rf "$DIST_DIR"
fi

echo "📂 創建 $DIST_DIR 目錄..."
mkdir -p "$DIST_DIR"

# 複製檔案
echo "📋 複製檔案從 $SRC_DIR 到 $DIST_DIR..."
cp -r "$SRC_DIR"/* "$DIST_DIR"/

# 顯示複製的檔案
echo ""
echo "✅ 已複製的檔案："
find "$DIST_DIR" -type f | sort | sed 's/^/   /'

# 檢查 HTML 檔案數量
HTML_COUNT=$(find "$DIST_DIR" -name "*.html" -type f | wc -l)
echo ""
echo "📊 統計資訊："
echo "   HTML 檔案: $HTML_COUNT 個"

# 計算目錄大小
DIST_SIZE=$(du -sh "$DIST_DIR" | cut -f1)
echo "   總大小: $DIST_SIZE"

# =============================================================================
# 🔮 未來的構建步驟可以在這裡添加
# =============================================================================

# 範例：CSS/JS 最小化
# echo "🎨 最小化 CSS 和 JS 檔案..."
# find "$DIST_DIR" -name "*.css" -exec echo "Processing: {}" \;
# find "$DIST_DIR" -name "*.js" -exec echo "Processing: {}" \;

# 範例：圖片優化
# echo "🖼️  優化圖片檔案..."
# find "$DIST_DIR" -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" | while read img; do
#     echo "Optimizing: $img"
# done

# 範例：生成版本文件
# echo "📝 生成版本資訊..."
# echo "{\"version\":\"$(date +%Y%m%d-%H%M%S)\",\"built\":\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"}" > "$DIST_DIR/version.json"

echo ""
echo "🎉 構建完成！"
echo "💡 $DIST_DIR 目錄已準備好部署"
echo "" 