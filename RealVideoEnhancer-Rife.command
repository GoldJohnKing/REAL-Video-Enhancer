#!/bin/bash

CURRENT_DIR=$(dirname "$(realpath "$0")")

echo $CURRENT_DIR

INPUT_FILE="$CURRENT_DIR/input.mp4"
OUTPUT_FILE="$CURRENT_DIR/output.mp4"

cd "$CURRENT_DIR/../REAL-Video-Enhancer/backend"

uv venv --python 3.12

uv pip install -r requirements.txt

uv run rve-backend.py --backend ncnn \
--input=$INPUT_FILE --output=$OUTPUT_FILE --overwrite \
--interpolate_factor 2 --interpolate_model /Users/goldjohnking/Library/REAL-Video-Enhancer/models/rife-v4.25 --UHD_mode \
--scene_detect_method pyscenedetect --scene_detect_threshold 3.5 \
--border_detect \
--video_encoder_preset libx265 --crf 15 --video_pixel_format yuv422p10le \
--audio_encoder_preset copy_audio --audio_bitrate 320k \
--merge_subtitles --subtitle_encoder_preset copy_subtitle

read -n 1 -s -r -p "Press any key to continue..."
