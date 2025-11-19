# INT8 Quantized Image Processing on FPGA (Zybo Z7-20)

## Description
This project implements an INT8 quantized image processing pipeline on the Zybo Z7-20 FPGA using Verilog and Vivado.

It processes pre-quantized image data and performs layer-wise computation using a custom DSP-based MAC module.  
The entire computation is designed using register-level Verilog modules and follows a modular architecture.  
**This project is implemented using a recursive architecture.**

## System Overview
- Platform: Zybo Z7-20
- Toolchain: Xilinx Vivado
- Language: Verilog HDL

## Data Format

### Input `x` Data (Image Data)
- Flattened grayscale image data (e.g., 28×28)
- Stored sequentially without any reordering
- Example:
  - 1st image: index 0 ~ 783
  - 2nd image: index 784 ~ 1567

### Weight `w` Data
- Fully flattened and stored sequentially
- No position rearrangement
- Format:
  - Index 0: Dummy data (used for indexing)
  - Index 1~28: Layer 1 weights
  - Index 29~8220: Layer 2 weights
  - Index 8221~16412: Layer 3 weights
  - Index 16413~17052: Layer 4 weights

## Module Overview

| Module      | Description |
|-------------|-------------|
| top         | Top module |
| glbl_ctrl   | Global control module – manages PU operation |
| pu          | Processing Unit using DSP for calculation |
| post_input  | Quantizes input image data (asynchronous) |
| last_pu     | Dequantizes output data (synchronous, 5-clock delay) |
| mac         | All computation (not GEMV) handled using a single MAC module |

## Simulation
To verify simulation output, refer to the provided .tcl scripts.
They allow you to observe output values along with their corresponding address locations.

## Project Directory Structure
- Verilog source code: /srcs/sources_1/imports/

## License
This project is provided as-is for academic and prototyping purposes.

---

# INT8 양자화 이미지 처리 FPGA 설계 (Zybo Z7-20 기반)

## 개요
이 프로젝트는 Verilog 및 Vivado를 이용하여 Zybo Z7-20 보드 상에서 작동하는 INT8 양자화 이미지 처리를 재귀적인 방법으로 구현한 것이다.

이미지 데이터를 정수형으로 양자화한 뒤, 레이어별 연산을 DSP 기반 MAC 모듈을 통해 수행하며 전체 연산은 레지스터 기반 모듈로 구성되어 있다.

## 시스템 구성
- 보드: Zybo Z7-20
- 개발 도구: Xilinx Vivado
- 사용 언어: Verilog HDL

## 데이터 형식

### 입력 `x` 데이터 (이미지 데이터)
- 28×28 등 1차원으로 펼쳐진 흑백 이미지
- 데이터 위치 변환 없이 순차적으로 저장됨
- 예시:
  - 1번째 이미지: 인덱스 0~783
  - 2번째 이미지: 인덱스 784~1567

### 가중치 `w` 데이터
- 전부 1차원으로 펼쳐 저장
- 위치 변환 없이 위에서부터 순차 저장
- 구성:
  - 인덱스 0: 더미 데이터 (인덱싱용)
  - 인덱스 1~28: 레이어 1 가중치
  - 인덱스 29~8220: 레이어 2 가중치
  - 인덱스 8221~16412: 레이어 3 가중치
  - 인덱스 16413~17052: 레이어 4 가중치

## 모듈 설명

| 모듈 이름   | 역할 설명 |
|-------------|-----------|
| top         | 최상위 모듈 |
| glbl_ctrl   | 전체 동작 제어, PU 제어 |
| pu          | DSP를 이용한 연산 처리 유닛 |
| post_input  | 입력 이미지 데이터를 양자화하는 비동기 모듈 |
| last_pu     | 출력 데이터를 역 양자화하는 동기식 모듈 (5클럭 딜레이) |
| mac         | GEMV가 아닌 단일 MAC 연산 모듈로 전체 연산 수행 |

## 시뮬레이션 확인 방법
- .tcl 파일을 확인하면 출력값 및 해당 시점의 메모리 주소값을 확인할 수 있음.

## 프로젝트 구조
- Verilog 코드 위치: /srcs/sources_1/imports/

## 라이선스
본 프로젝트는 학습 및 프로토타이핑 용도로 자유롭게 사용 가능합니다.
