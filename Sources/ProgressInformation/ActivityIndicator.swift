//
//  File.swift
//  ProgressInformation
//
//  Created by Игорь Тарабанов on 25.02.2025.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
  @Binding var isAnimating: Bool
  let style: UIActivityIndicatorView.Style
  
  func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
    return UIActivityIndicatorView(style: style)
  }
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
    isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
  }
}
