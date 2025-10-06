#!/bin/bash

export no_proxy=127.0.0.1,localhost

python -m vllm.entrypoints.cli.main benchmark_serving.py \
    --model ibm-granite/granite-3.2-8b-instruct \
    --host 127.0.0.1 \
    --port 8000 \
    --backend openai-chat \
    --endpoint /v1/chat/completions \
    --dataset-name tool_calling \
    --request-rate inf \
    --num-prompts 1 \
    --max-concurrency 5 \
    --ignore-eos \
    --tool-calling-input-tokens 4096 \
    --tool-calling-output-tokens 1024 \
    --percentile-metrics ttft,tpot,itl,e2el \
    --metric-percentiles 50,95,90 \
    --ready-check-timeout-sec 0 \
    --temperature 0