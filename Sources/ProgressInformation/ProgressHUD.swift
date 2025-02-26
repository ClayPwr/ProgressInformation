//
//  ProgressHUD.swift
//  ProgressInformation
//
//  Created by Игорь Тарабанов on 26.02.2025.
//

import SwiftUI

struct ProgressHUD<Presenting>: View where Presenting: View {
  /// Show Progress HUD
  @Binding var isShowing: Bool
  
  /// Progress HUD Type
  let type: ProgressHUDType
  
  /// Optional Text to show below the activity
  let text: Text?
  
  /// Blur the background behind the ProgressHUD
  let blurBackground: Bool
  
  let disableInteraction: Bool
  
  /// The view that will be behind the ProgressHUD
  let presenting: () -> Presenting
  
  var body: some View {
    
    ZStack(alignment: .center) {
      
      self.presenting()
        .allowsHitTesting(!(isShowing && blurBackground))
        .blur(radius: (isShowing && blurBackground) ? 1 : 0)
      
      VStack {
        
        if self.type == .error {
          Image(systemName: "xmark").resizable().frame(width: 30, height: 30).padding(.leading, 16).padding(.trailing, 16)
        } else if self.type == .success {
          Image(systemName: "checkmark").resizable().frame(width: 30, height: 30)
        } else if self.type == .info {
          Image(systemName: "info.circle").resizable().frame(width: 30, height: 30)
        } else {
          ActivityIndicator(isAnimating: .constant(true), style: .large)
        }
        
        if self.text != nil {
          self.text
        }
      }
      .padding()
      .background(Color.secondary.colorInvert())
      .foregroundColor(Color.primary)
      .cornerRadius(20)
      .opacity(self.isShowing ? 1 : 0)
    }
  }
}
