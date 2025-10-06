vllm serve \
    ibm-granite/granite-3.2-8b-instruct  \
    --max-model-len 128000 \
    --enable-auto-tool-choice \
    --tool-call-parser granite \
    --enable-chunked-prefill &

sleep 100

vllm bench serve \
    --model ibm-granite/granite-3.2-8b-instruct \
    --endpoint /v1/chat/completions \
    --host 127.0.0.1 \
    --port 8000 \
    --dataset-name tool_calling \
    --request-rate inf \
    --num-prompts 128 \
    --max-concurrency 5 \
    --ignore-eos \
    --tool-calling-input-tokens 4096 \
    --tool-calling-output-tokens 1024 \
    --percentile-metrics ttft,tpot,itl,e2el \
    --metric-percentiles 50,95,90   

