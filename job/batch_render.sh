#!/bin/bash

# Define a list of subjects and sequences
# SUBJECTS=("055" "074" "104" "140" "165" "210" "218" "221" "238" "251" "253" "264" "302" "304" "306" "375")  # 16
# SUBJECTS=("074" "104" "140" "165" "218" "238" "253" "264" "302" "304" "306")  #11
# SUBJECTS=("074" "104" "140" "165" "210" "218" "238" "253" "264" "302" "304" "306" "460")  #V2 (#13)
# SUBJECTS=("304")  # tmp


# TGT_SUBJECTS=("074" "104" "140" "165" "210" "218" "238" "251" "253" "264" "302" "304" "306")  # 12
# TGT_SUBJECTS=("074" "104" "140" "165" "210" "218" "238" "253" "264" "302" "304" "306" "460")  #V2 (#13)
# TGT_SUBJECTS=("306")



for SUBJECT in "${SUBJECTS[@]}"; do

src_folder=$IKARUS/project/dynamic-head-avatars/code/multi-view-head-tracker/export/UNION_${SUBJECT}_EMO1234EXP234589_v16_DS2-0.5x_lmkSTAR_teethV3_SMOOTH_offsetS_whiteBg_maskBelowLine

model_folder=$IKARUS/project/dynamic-head-avatars/code/gaussian-splatting/output/Union10EMOEXP_${SUBJECT}_eval_600k_localScale1e0-thresh0.6_localXyz1e-2-thresh1


#======= render (val) =======#
# JOB_NAME="gs_render_${SUBJECT}_val"
# RENDER_VAL="python render.py \
# -s $src_folder \
# -m $model_folder \
# --skip_train --skip_test
# "

#======= render (test) =======#
# JOB_NAME="gs_render_${SUBJECT}_test"
# RENDER_TEST="python render.py \
# -s $src_folder \
# -m $model_folder \
# --skip_train --skip_val
# --select_camera_id 8
# "

# --select_camera_id 8
# --skip_train --skip_val

#======= render (seq) =======#
# tgt_folder=$IKARUS/project/dynamic-head-avatars/code/multi-view-head-tracker/export/${SUBJECT}_FREE_v16_DS2-0.5x_lmkSTAR_teethV3_SMOOTH_offsetS_whiteBg_maskBelowLine
# JOB_NAME="gs_render_${SUBJECT}_seq"
# RENDER_SEQ="python render.py \
# -t $tgt_folder \
# -m $model_folder \
# --select_camera_id 8
# "

#======= render (tgt) =======#
# for TGT_SUBJECT in "${TGT_SUBJECTS[@]}"; do
# if [ "$SUBJECT" -eq "$TGT_SUBJECT" ]; then
#     continueW
# fi
# JOB_NAME="gs_render_${SUBJECT}-${TGT_SUBJECT}"
# # tgt_folder=$IKARUS/project/dynamic-head-avatars/code/multi-view-head-tracker/export/UNION_${TGT_SUBJECT}_EMO1234EXP234589_v16_DS2-0.5x_lmkSTAR_teethV3_SMOOTH_offsetS_whiteBg_maskBelowLine
# tgt_folder=$IKARUS/project/dynamic-head-avatars/code/multi-view-head-tracker/export/${TGT_SUBJECT}_FREE_v16_DS2-0.5x_lmkSTAR_teethV3_SMOOTH_offsetS_whiteBg_maskBelowLine
# echo "$SUBJECT -> $TGT_SUBJECT "
# RENDER_TGT="python render.py \
# -t $tgt_folder \
# -m $model_folder \
# --select_camera_id 8
# "


#------- run -------#
# COMMAND="$HOME/usr/bin/isbatch.sh $JOB_NAME $RENDER_VAL && $RENDER_TEST"
# COMMAND=$RENDER_VAL && $RENDER_TEST

# COMMAND="$HOME/usr/bin/isbatch.sh $JOB_NAME $RENDER_VAL"
# COMMAND=$RENDER_VAL

# COMMAND="$HOME/usr/bin/isbatch.sh $JOB_NAME $RENDER_TEST"
# COMMAND=$RENDER_TEST

# COMMAND="$HOME/usr/bin/isbatch.sh $JOB_NAME $RENDER_SEQ"

# COMMAND="$HOME/usr/bin/isbatch.sh $JOB_NAME $RENDER_TGT"
# COMMAND=$RENDER_TGT

# echo $COMMAND
$COMMAND

sleep 1
done

done
