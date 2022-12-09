g++ -o build/examples/neon_cnn.o -c -Wall -DARCH_ARM -Wextra -pedantic -Wdisabled-optimization -Wformat=2 -Winit-self -Wstrict-overflow=2 -Wswitch-default -std=gnu++14 -Woverloaded-virtual -Wformat-security -Wctor-dtor-privacy -Wsign-promo -Weffc++ -Wno-overlength-strings -Wlogical-op -Wnoexcept -Wstrict-null-sentinel -march=armv8-a -Wno-ignored-attributes -DENABLE_FP16_KERNELS -DENABLE_FP32_KERNELS -DENABLE_QASYMM8_KERNELS -DENABLE_QASYMM8_SIGNED_KERNELS -DENABLE_QSYMM16_KERNELS -O3 -D_GLIBCXX_USE_NANOSLEEP -DARM_COMPUTE_CPP_SCHEDULER=1 -DEMBEDDED_KERNELS -Dic=$1 -Doc=$2 -Dow=$3 -Iinclude -I. -I. examples/neon_cnn.cpp

g++ -o build/examples/neon_cnn build/examples/neon_cnn.o build/utils/Utils.o -Lbuild -L. -lpthread -larm_compute -larm_compute_core

taskset -ac 0 ./build/examples/neon_cnn > data.tmp

tail -n 4 data.tmp

