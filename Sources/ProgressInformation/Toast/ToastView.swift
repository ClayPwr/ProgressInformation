//
//  ToastView.swift
//  iosApp
//
//  Created by Игорь Тарабанов on 02.01.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI

struct ToastView: View {
  
  var style: ToastStyle
  var message: String
  var onCancelTapped: (() -> Void)
  
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      style.IconImage
        .resizable()
        .frame(width: 18, height: 18, alignment: .leading)
      Text(message)
        .font(Font.caption)
        .foregroundColor(Color.white)
      
      Spacer(minLength: 10)
      
      Button {
        onCancelTapped()
      } label: {
        Image(systemName: "xmark")
          .foregroundColor(style.themeColor)
      }
    }
    .padding()
    .background(.ultraThickMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    .padding(.horizontal, 16)
  }
}
