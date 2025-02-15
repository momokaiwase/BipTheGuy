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
    
    var body: some View {
        VStack {
            Spacer()
            Image("clown")
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    playSound(soundName: "punchS ound")
                }
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
