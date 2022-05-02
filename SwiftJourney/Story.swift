//
//  Story.swift
//  SwiftJourney
//
//  Created by Hyeon-sang Lee on 2022/05/02.
//

import SwiftUI

struct Story: View {
    
    @Binding var backToMain: Bool
    
    var body: some View {
        VStack {
            Text("공부라는 게 원래 지루한거죠..\n주위에서 발생하는 페인 포인트를 해결하는 일에 관심이 많은 저는 스위프트 공부에 지루함을 느끼는 룸메이트에게 도움을 주고 싶었습니다.\n간단하고, 재미있고, 그리고 아이폰에서도 즐길 수 있는 학습 도구는 없을까? SwiftJourney는 이러한 고민을 해결하고자 제작된 어플리케이션입니다.\n스토리, 픽셀아트 등 게임적 요소를 가미하여 재미를 더하고, 스위프트 관련 문제를 풀면서 학습에 도움을 주고자 노력했습니다.")
                .multilineTextAlignment(.center)
        
            Button("메인으로") {
                self.backToMain = false
            }
        }
    }
}

/*
 "공부라는 게 원래 지루한거죠 뭐"
 주위에서 발생하는 페인 포인트를 해결하는 일에 관심이 많은 저는
 스위프트 공부에 지루함을 느끼는 룸메이트에게 도움을 주고 싶었습니다.
 간단하고, 재미있고, 그리고 아이폰에서도 즐길 수 있는 학습 도구는 없을까?
 SwiftJourney는 이러한 고민을 해결하고자 제작된 어플리케이션입니다.
 스토리, 픽셀아트 등 게임적 요소를 가미하여 재미를 더하고,
 스위프트 관련 문제를 풀면서 학습에 도움을 주고자 노력했습니다.
 */
