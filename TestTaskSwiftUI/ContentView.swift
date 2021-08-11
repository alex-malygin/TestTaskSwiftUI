//
//  ContentView.swift
//  TestTaskSwiftUI
//
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var showingAlert = false
    
    var body: some View {
        Spacer()
        Button(action: {},
               label: {
                Text("Play")
                    .bold()
                    .frame(width: 150, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                        
                        if pressing {
                            audioPlayer?.play()
                        } else {
                            audioPlayer?.pause()
                        }
                    }, perform: {})
               })
            .onAppear {
                initPlayer()
            }
        Spacer()
    }
    
    private func initPlayer() {
        // Setup local audio path
        guard let soundPath = Bundle.main.path(forResource: "dtmf_1", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: soundPath)
        
        // Set audioPlayer
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            debugPrint("Failed to play file")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
