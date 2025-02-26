//
//  ErrorHUD.swift
//  ProgressInformation
//
//  Created by Игорь Тарабанов on 25.02.2025.
//

import SwiftUI

struct ErrorHUD<Presenting>: View where Presenting: View {
  /// Show Progress HUD
  @Binding var isShowing: Bool
  
  /// Optional Text to show below the activity
  let text: Text?
  
  /// Blur the background behind the ProgressHUD
  let blurBackground: Bool
  
  /// The view that will be behind the ProgressHUD
  let presenting: () -> Presenting
  
  /// Delay of seconds (1 second = 1_000_000_000 nanoseconds)
  let delaySeconds: UInt64 = 2
  private let multiplayer: UInt64 = 1_000_000_000
  
  var body: some View {
    
    GeometryReader { geometry in
      
      ZStack(alignment: .center) {
        
        self.presenting()
          .blur(radius: (self.isShowing && self.blurBackground) ? 1 : 0)
        
        VStack {
          Image(systemName: "xmark").resizable().frame(width: 30, height: 30).padding(.leading, 16).padding(.trailing, 16)
          
          if self.text != nil {
            self.text
          }
        }.padding()
          .background(Color.secondary.colorInvert())
          .foregroundColor(Color.primary)
          .cornerRadius(20)
          .opacity(self.isShowing ? 1 : 0)
      }
      .onChange(of: isShowing) { newValue in
        handleErrorHud(newValue)
      }
    }
  }
  
  private func handleErrorHud(_ newValue: Bool) {
    if newValue {
      Task {
        try? await Task.sleep(nanoseconds: delaySeconds * multiplayer)
        isShowing = false
      }
    }
  }
}


