//
//  ToastStyle.swift
//  iosApp
//
//  Created by Игорь Тарабанов on 02.01.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI

enum ToastStyle {
  case error
  case warning
  case success
  case info
  
  case violation
}

extension ToastStyle {
  var themeColor: Color {
    switch self {
    case .error: return Color.red
    case .warning: return Color.orange
    case .info: return Color.blue
    case .success: return Color.green
    case .violation: return Color.clear
    }
  }
  
  var IconImage: Image {
    switch self {
    case .info: return Image(systemName: "info.circle.fill")
    case .warning: return Image(systemName: "exclamationmark.triangle.fill")
    case .success: return Image(systemName: "checkmark.circle.fill")
    case .error: return Image(systemName: "xmark.circle.fill")
    case .violation: return Image(systemName: "xmark.circle.fill")
    }
  }
}
