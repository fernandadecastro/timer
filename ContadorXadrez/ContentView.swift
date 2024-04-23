//
//  ContentView.swift
//  ContadorXadrez
//
//  Created by Fernanda de Castro Teixeira on 21/04/24.
//


import SwiftUI

// TIMER CODE

struct ContentView: View {
    
    // 600 because it's 10 minutes (10 * 60 seconds)
    @State var timeCountPlayer1 = 600.0
    @State var timeCountPlayer2 = 600.0
    @State var pausePlayer1 = true
    @State var pausePlayer2 = false
    
    
    // next line tells that we're gonna publish something every 1 second
    // 1 accuracy, if you don`t need all this you can change the accuracy yo 0.01, for example
    let timerPlayer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timerPlayer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var minutesPlayer1: Int {
        return Int(timeCountPlayer1) / 60
    }
    var secondsPlayer1: Int {
        return Int(timeCountPlayer1) % 60
    }
    
    var minutesPlayer2: Int {
        return Int(timeCountPlayer2) / 60
    }
    var secondsPlayer2: Int {
        return Int(timeCountPlayer2) % 60
    }
    
    var body: some View{
        
        VStack{
            
            Text(String(format: "%02d:%02d", minutesPlayer1, secondsPlayer1))
            
            // if the countdown was made just for seconds:
            // here we're gonna add the timeCount var and add a specifier and the %.0f is common to in lots of languages and means that you will gonna put no places after decimal point
            //Text("\(timeCount, specifier: "%.0f")")
            
                // we're going to get a signal from the timer every 1 second
                // and we want, on receiving that timer, firstly check if pause is false
                // if pause is false then we're going to increment the timer by 1
                // this keeps everything nice, accurate and in time
                .onReceive(timerPlayer1, perform: { _ in
                    if (pausePlayer1 == false) {
                        timeCountPlayer1 -= 1
                    }
                })
            
            Button("Pause/Start Player 1"){
                // use a toggle to go back and forth
                pausePlayer1.toggle()
                if pausePlayer1 {
                    timeCountPlayer1 += 5
                }
                pausePlayer2.toggle()
                
                print("pause 1: \(pausePlayer1)")
                print("pause 2: \(pausePlayer2)")
            }
            
            //reset button to put the variable back to 0.0
            Button("Reset Player 1"){
                timeCountPlayer1 = 600.0
            }
            
        }
        
        // add the same for player2
        
        VStack{
            
            Text(String(format: "%02d:%02d", minutesPlayer2, secondsPlayer2))
            
            // if the countdown was made just for seconds:
            // here we're gonna add the timeCount var and add a specifier and the %.0f is common to in lots of languages and means that you will gonna put no places after decimal point
            //Text("\(timeCount, specifier: "%.0f")")
            
                // we're going to get a signal from the timer every 1 second
                // and we want, on receiving that timer, firstly check if pause is false
                // if pause is false then we're going to increment the timer by 1
                // this keeps everything nice, accurate and in time
                .onReceive(timerPlayer2, perform: { _ in
                    if (pausePlayer2 == false) {
                        timeCountPlayer2 -= 1
                    }
                })
            
            Button("Pause/Start Player 2"){
                // use a toggle to go back and forth
                pausePlayer2.toggle()
                if pausePlayer2 {
                    timeCountPlayer2 += 5
                }
                pausePlayer1.toggle()
                
                print("pause 1: \(pausePlayer1)")
                print("pause 2: \(pausePlayer2)")
            }
            
            //reset button to put the variable back to 0.0
            Button("Reset Player 2"){
                timeCountPlayer2 = 600.0
            }
            
        }
        
    }
    
}





    

// COUNTDOWN CODE

//In this code, minutes calculates the minutes part of the timeCount and seconds calculates the seconds part. The Text view then displays these values formatted as "%02d:%02d" to ensure that the minutes and seconds are displayed with leading zeros if needed (e.g., 05:03 instead of 5:3).





// TENTATIVA DE RELÓGIO
//
//import SwiftUI
//
//struct ChessClockView: View {
//    @State private var player1Time: TimeInterval = 60 * 5 // 5 minutes
//    @State private var player2Time: TimeInterval = 60 * 5 // 5 minutes
//    @State private var isPlayer1Turn = true
//    @State private var timer: Timer?
//    
//    var body: some View {
//        VStack {
//            Text("Player 1: \(formatTime(player1Time))")
//            Text("Player 2: \(formatTime(player2Time))")
//            Button(action: {
//                startTimer()
//            }, label: {
//                Text("Start")
//            })
//        }
//        .padding()
//        .onDisappear {
//            timer?.invalidate()
//        }
//    }
//    
//    func startTimer() {
//        timer?.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            if isPlayer1Turn {
//                player1Time -= 1
//            } else {
//                player2Time -= 1
//            }
//            
//            if player1Time <= 0 || player2Time <= 0 {
//                timer?.invalidate()
//            }
//        }
//    }
//    
//    func formatTime(_ time: TimeInterval) -> String {
//        let minutes = Int(time) / 60
//        let seconds = Int(time) % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        ChessClockView()
//    }
//}
//
//struct ChessClockView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChessClockView()
//    }
//}
//
//


// CONTADOR DE MOVIMENTOS

//import SwiftUI
//
//struct ChessCounterView: View {
//    @State private var moveCount = 0
//
//    var body: some View {
//        VStack {
//            Text("Número de movimentos: \(moveCount)")
//                .font(.title)
//                .padding()
//            HStack {
//                Button(action: {
//                    moveCount -= 1
//                }) {
//                    Text("Desfazer")
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.red)
//                        .cornerRadius(8)
//                }
//                Button(action: {
//                    moveCount += 1
//                }) {
//                    Text("Refazer")
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.green)
//                        .cornerRadius(8)
//                }
//            }
//            .padding()
//        }
//        .padding()
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        ChessCounterView()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

#Preview {
    ContentView()
}
