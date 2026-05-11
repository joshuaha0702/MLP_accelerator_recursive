# INT8 Quantized Image Processing on FPGA (Zybo Z7-20)

## Description
본 프로젝트는 **Zybo Z7-20 FPGA** 환경에서 **INT8 양자화** 기법을 적용한 이미지 처리 가속기를 구현한 것입니다. 단일 하드웨어 자원을 레이어별로 재사용하는 **재귀적 아키텍처(Recursive Architecture)**로 설계되어 면적 효율성을 극대화했습니다.

## Layer Information
이 가속기는 1개의 Conv1d 레이어와 3개의 Fully Connected(FC) 레이어로 구성됩니다.

| Layer | Type | Input Size | Output Size | Weight/Kernel | Stride |
|:---:|:---:|:---:|:---:|:---:|:---:|
| **Layer 1** | **Conv1d** | 784 (28x28) | 64 | 28 (1x28) | **12** |
| **Layer 2** | **FC (MLP)** | 64 | 128 | 64 x 128 | - |
| **Layer 3** | **FC (MLP)** | 128 | 64 | 128 x 64 | - |
| **Layer 4** | **FC (MLP)** | 64 | 10 | 64 x 10 | - |

### Special Note: Layer 1 (Recursive Conv1d)
Layer 1은 일반적인 2D Convolution이 아닌, 1차원으로 평탄화된(Flattened) 784개의 픽셀 데이터를 대상으로 **1D 합성곱**을 수행합니다. 
- **연산 방식:** 커널 크기 28의 필터가 12의 스트라이드로 이동하며 연산합니다. 
- **출력 계산:** `(784 - 28) / 12 + 1 = 64`. 이 과정을 통해 64개의 특징점(Features)을 추출하며, 이는 다음 MLP 레이어의 입력이 됩니다.
- 하드웨어적으로는 `colcounter`를 이용해 64번의 루프를 돌며 DSP를 재귀적으로 호출하도록 설계되었습니다.

## System Overview
- **Platform:** Zybo Z7-20
- **Toolchain:** Xilinx Vivado
- **Language:** Verilog HDL
- **Architecture:** Recursive PU(Processing Unit) Design

## Data Format

### Input `x` Data (Image Data)
- 28×28 흑백 이미지가 1차원으로 펼쳐진 형태 (784 bytes)
- 인덱스 0~783 (1번째 이미지), 784~1567 (2번째 이미지) 순으로 연속 저장

### Weight `w` Data (INT8)
- 모든 가중치는 1차원으로 직렬화되어 저장되며, 하드웨어 인덱싱을 위해 **Index 0은 더미 데이터**로 비워둡니다.
- **Index 0:** Dummy
- **Index 1 ~ 28:** Layer 1 Weights (28개)
- **Index 29 ~ 8220:** Layer 2 Weights (128 * 64 = 8,192개)
- **Index 8221 ~ 16412:** Layer 3 Weights (64 * 128 = 8,192개)
- **Index 16413 ~ 17052:** Layer 4 Weights (10 * 64 = 640개)

## Module Overview

| Module | Description |
|:---:|---|
| **top** | 하위 모듈을 연결하는 최상위 모듈 |
| **glbl_ctrl** | State Machine을 통해 전체 연산 흐름 및 PU의 재귀 동작을 제어 |
| **pu** | DSP48E1 슬라이스를 포함하여 실제 연산을 수행하는 핵심 유닛 |
| **post_input** | 입력 데이터를 양자화(Quantization)하는 비동기 처리 모듈 |
| **last_pu** | 연산 결과에 ReLU, Scale 조정 및 다시 양자화를 수행하는 모듈 (5-clk delay) |
| **mac** | 단일 MAC 모듈을 공유하여 모든 레이어 연산을 시분할 처리 |

## Simulation & Execution
1. **Vivado 실행:** `open_project dsd_termprj.xpr`
2. **검증:** 제공된 `.tcl` 스크립트를 활용하여 시뮬레이션 파형과 메모리에 기록되는 최종 출력값(Address 기준)을 대조하여 정확도를 검증할 수 있습니다.

## Directory Structure
- **RTL Source:** `./00_RTL_Skeleton/dsd_termprj.srcs/sources_1/imports/`
- **Simulation Scripts:** `./sim/` (.tcl)

## License
This project is licensed under the MIT License.