//
//  ContentView.swift
//  BipTheGuy
//
//  Created by Momoka Iwase on 2025/02/15.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer! //unwrapped optional
    @State private var isFullSize = true
    
    var body: some View {
        VStack {
            Spacer()
            Image("clown")
                .resizable()
                .scaledToFit()
                .scaleEffect(isFullSize ? 1.0 : 0.9)
                .onTapGesture {
                    playSound(soundName: "punchSound")
                    isFullSize = false //will immediately shrink scale effect to 90% of size, when var changes view is redrawn
                    //scale = scale + 0.1 //each tap increases scale by 10%
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.3)){
                        isFullSize = true //will go from 90 to 100% size but using the .spring animation
                    }
                }
                //.animation(.spring(response: 0.3, dampingFraction: 0.3), value: scale)
            Spacer()
            Button(action: {
                //Button action here
            }, label: {
                Label("Photo Library", systemImage: "photo.on.rectangle.fill")
            })
        }
        .padding()
    }
    func playSound(soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName)else {
            print("😡 Could not read file named \(soundName)") //ctrl cmd space to insert emoji
            return }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 Error: \(error.localizedDescription) creating audioPlayer")
        }
    }
}

#Preview {
    ContentView()
}
