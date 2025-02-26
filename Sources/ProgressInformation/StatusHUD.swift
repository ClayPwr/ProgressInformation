//
//  StatusHUD.swift
//  ProgressInformation
//
//  Created by Игорь Тарабанов on 25.02.2025.
//

import SwiftUI

public enum ProgressHUDType {
  case `default`
  case success
  case error
  case info
}

public protocol HUDStatusProtocol {
  var showHud: Bool { get }
  var isError: Bool { get }
  var typeHUD: ProgressHUDType { get }
  var textDescription: Text? { get }
}

public struct StatusHUD<Presenting>: View where Presenting: View {
  /// Show Progress HUD
  @Binding var isShowing: Bool
  
  /// Blur the background behind the ProgressHUD
  let blurBackground: Bool
  
  /// ViewModel status with HUDStatusProtocol implementation
  let status: HUDStatusProtocol
  
  /// The view that will be behind the ProgressHUD
  let presenting: () -> Presenting
  
  public var body: some View {
      
      ZStack(alignment: .center) {
        
        self.presenting()
          .allowsHitTesting(!(isShowing && blurBackground))
          .blur(radius: (self.isShowing && self.blurBackground) ? 1 : 0)
        
        VStack {
          switch status.typeHUD {
          case .error:
            Image(systemName: "xmark").resizable().frame(width: 30, height: 30).padding(.leading, 16).padding(.trailing, 16)
          default:
            ActivityIndicator(isAnimating: .constant(true), style: .large)
          }
          if status.textDescription != nil {
            status.textDescription
          }
        }.padding()
          .background(Color.secondary.colorInvert())
          .foregroundColor(Color.primary)
          .cornerRadius(20)
          .opacity(self.isShowing ? 1 : 0)
      }
  }
}

extension View {
  public func statusHUD(
    isShowing: Binding<Bool>,
    status: HUDStatusProtocol,
    blurBackground: Bool = true) -> some View {
      StatusHUD(isShowing: isShowing,
               blurBackground: blurBackground,
               status: status,
               presenting: { self })
    }
}
