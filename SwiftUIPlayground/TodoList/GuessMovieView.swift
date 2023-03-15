//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by 陳晉翔 on 2023/3/9.
//

import SwiftUI
import AVFoundation

struct GuessMovieView: View {
   
    let synthesizer = AVSpeechSynthesizer()

    
    var body: some View {
        VStack {
            
            Text("猜猜電影名稱")
                .fontWeight(.bold)
                .font(.system(size: 36))
            Text("你可以從這些Emojis猜出電影媽？")
                .fontWeight(.bold)
                .font(.system(size: 18))
            Button {
                sppeak(text: "蜘蛛人", language: "zh-tw")
            } label: {
                Text("🕷️👨‍🎓")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
            }.padding()
                .background(Color.red)
                .cornerRadius(20)
            Button {
                sppeak(text: "冰與火之歌", language: "zh-tw")
            } label: {
                Text("🧊🔥🎤")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
            }.padding()
                .background(Color.orange)
                .cornerRadius(20)
            Button {
                sppeak(text: "玩命光頭", language: "zh-tw")
            } label: {
                Text("🧑🏾‍🦲🚗🚗")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
            }.padding()
                .background(Color.yellow)
                .cornerRadius(20)
            Button {
                sppeak(text: "Bonjour le monde", language: "zh-tw")
            } label: {
                Text("Hello World")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
            }.padding()
                .background(Color.blue)
                .cornerRadius(20)

        }
        .padding()
    }
    
    func sppeak(text: String, language: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        synthesizer.speak(utterance)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GuessMovieView()
    }
}
