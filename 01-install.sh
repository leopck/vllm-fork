#!/bin/bash
pip uninstall vllm
VLLM_USE_PRECOMPILED=1 uv pip install --editable .
