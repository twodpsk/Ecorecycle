# 분리수거 분류 및 식물 성장 앱
<!-- 한 줄에 4개 이미지 고정 -->
<div style="display: flex; justify-content: center; gap: 10px; flex-wrap: nowrap; overflow-x: auto;">
  <img src="https://github.com/user-attachments/assets/ebb9f7c6-4025-40dc-b991-a1a89b82b49f" width="250" />
  <img src="https://github.com/user-attachments/assets/d6de90bd-79ea-494c-974e-ec752f9d4002" width="250" />\n
  <img src="https://github.com/user-attachments/assets/54769263-e853-494e-997e-a1d1acd50bff" width="250" />
  <img src="https://github.com/user-attachments/assets/dbe0027b-9c2f-427c-b332-60ae346696de" width="250" />
</div>

## 문제의식
한국에서 **분리배출 규칙에 대한 인식 부족**과 **실제 재활용률의 낮음**이 큰 문제 특히, 사람들이 **분리배출 규칙을 잘 모르거나 헷갈려** 재활용이 제대로 이루어지지 않으며, 이로 인해 환경 오염이 발생하고 있음. 또한, **선별시설의 비효율성**과 **폐플라스틱 증가** 등의 문제도 환경 문제를 악화시키고 있음

- **출처**: [KoreaScience](https://www.koreascience.or.kr/article/JAKO202209542000695.pdf?utm_source=chatgpt.com), [해피캠퍼스](https://www.happycampus.com/paper-doc/32470884/?utm_source=chatgpt.com)

## 앱 소개
이 앱은 **Flutter**로 개발되었으며, **TensorFlow Lite**를 사용한 **이미지 분류 모델**을 통해 **플라스틱**, **종이**, **캔** 등 다양한 재활용 품목을 정확하게 분류하고, 사용자가 정확한 분리배출을 할 때마다 포인트를 쌓아 **식물이 자라나는** 재미있는 시스템을 제공함.

## 주요 기능
- **이미지 분류**: 사용자가 촬영한 이미지를 AI가 분석하여 재활용 가능한 품목을 정확하게 분류합니다.
- **식물 성장**: 사용자가 정확한 분리배출을 할 때마다 포인트가 쌓이고, 포인트에 따라 **식물이 자라나는** 시스템을 도입하여 지속적인 참여를 유도합니다.
- **지역별 배출 규칙 제공**: 사용자의 **지역에 맞는 분리배출 규칙**을 제공하여 실용성을 높입니다.
- **게임화 요소**: 포인트 시스템과 보상으로 사용자 참여를 유도하며, 행동 변화를 장려합니다.

## 기술 스택
- **Flutter**: 앱 UI 개발을 위한 크로스 플랫폼 프레임워크.
- **TensorFlow Lite**: 이미지 분류 모델을 경량화하여 모바일에서 사용.
- **Dart**: Flutter 앱의 주요 프로그래밍 언어.
- **Python** (모델 훈련): TensorFlow를 사용해 재활용 품목 분류 모델을 훈련.
- **Firebase**: 사용자 데이터 및 앱 상태 관리.



