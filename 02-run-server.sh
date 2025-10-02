#!/bin/bash

# Server code
vllm serve \
    ibm-granite/granite-3.2-8b-instruct  \
    --max-model-len 128000 \
    --enable-auto-tool-choice \
    --tool-call-parser granite \
    --chat-template /raid/phoongst/benchmark_config/vllm-granite/examples/tool_chat_template_granite.jinja \
    --enable-chunked-prefill
