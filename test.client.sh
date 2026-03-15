#!/bin/bash

# 测试HTTP API服务 - 使用kimi-k2.5模型

BASE_URL="http://192.168.31.184:8080"
API_KEY="sk-xxx"

echo "=========================================="
# echo "测试1: 非流式请求 (kimi-k2.5)"
# echo "=========================================="
# curl -s -X POST "${BASE_URL}/v1/chat/completions" \
#   -H "Authorization: Bearer ${API_KEY}" \
#   -H "Content-Type: application/json" \
#   -d '{
#     "model": "kimi-k2.5",
#     "messages": [
#       {"role": "system", "content": "你是一个有帮助的助手。"},
#       {"role": "user", "content": "你好，请介绍一下自己"}
#     ],
#     "stream": false,
#     "temperature": 0.7
#   }' | jq .

echo ""
echo "=========================================="
echo "测试2: 流式请求 (kimi-k2.5)"
echo "=========================================="
curl -s -X POST "${BASE_URL}/v1/chat/completions" \
  -H "Authorization: Bearer ${API_KEY}" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "kimi-k2.5",
    "messages": [
      {"role": "system", "content": "你是一个有帮助的助手。"},
      {"role": "user", "content": "你好，请介绍一下自己"}
    ],
    "stream": true,
    "temperature": 0.7
  }'

# echo ""
# echo "=========================================="
# echo "测试3: 认证失败测试 (错误的API Key)"
# echo "=========================================="
# curl -s -X POST "${BASE_URL}/v1/chat/completions" \
#   -H "Authorization: Bearer wrong-key" \
#   -H "Content-Type: application/json" \
#   -d '{
#     "model": "kimi-k2.5",
#     "messages": [{"role": "user", "content": "Hello"}],
#     "stream": false
#   }' | jq .

# echo ""
# echo "=========================================="
# echo "测试4: 404端点测试"
# echo "=========================================="
# curl -s -X POST "${BASE_URL}/v1/unknown" \
#   -H "Authorization: Bearer ${API_KEY}" \
#   -H "Content-Type: application/json" \
#   -d '{}' | jq .

echo ""
echo "=========================================="
echo "测试完成"
echo "=========================================="
