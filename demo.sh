#!/usr/bin/env bash
#MSRN for train
cd Train/

# MSRN x2  LR: 48 * 48  HR: 96 * 96
python3 main.py --template MSRN --save MSRN_X2 --scale 2 --reset --save_results --patch_size 96 --ext sep

python3 main.py --template MHY1 --save MHY1_X2 --scale 2 --reset --save_results --patch_size 96 --ext sep


# MSRN x3  LR: 48 * 48  HR: 144 * 144
python3 main.py --template MSRN --save MSRN_X3 --scale 3 --reset --save_results --patch_size 144 --ext sep_reset

# MSRN x4  LR: 48 * 48  HR: 192 * 192
python3 main.py --template MSRN --save MSRN_X4 --scale 4 --reset --save_results --patch_size 192 --ext sep_reset




MSRN for test
cd Test/code/


#MSRN x2
python3 main.py --data_test MyImage --scale 2 --model MSRN --pre_train ../model/MSRN_x2.pt --test_only --save_results --chop --save "MSRN" --testpath ../LR/LRBI --testset Set5

python3 main.py --data_test MyImage --scale 2 --model MHY1 --pre_train ../model/MHY1_x2.pt --test_only --save_results --chop --save "MHY1" --testpath ../LR/LRBI --testset B100


#MSRN+ x2
python main.py --data_test MyImage --scale 2 --model MSRN --pre_train ../model/MSRN_x2.pt --test_only --save_results --chop --self_ensemble --save "MSRN_plus" --testpath ../LR/LRBI --testset Set5


#MSRN x3
python main.py --data_test MyImage --scale 3 --model MSRN --pre_train ../model/MSRN_x3.pt --test_only --save_results --chop --save "MSRN" --testpath ../LR/LRBI --testset Set5

#MSRN+ x3
python main.py --data_test MyImage --scale 3 --model MSRN --pre_train ../model/MSRN_x3.pt --test_only --save_results --chop --self_ensemble --save "MSRN_plus" --testpath ../LR/LRBI --testset Set5


#MSRN x4
python main.py --data_test MyImage --scale 4 --model MSRN --pre_train ../model/MSRN_x4.pt --test_only --save_results --chop --save "MSRN" --testpath ../LR/LRBI --testset Set5

#MSRN+ x4
python main.py --data_test MyImage --scale 4 --model MSRN --pre_train ../model/MSRN_x4.pt --test_only --save_results --chop --self_ensemble --save "MSRN_plus" --testpath ../LR/LRBI --testset Set5

