//
//  Toast.swift
//  iosApp
//
//  Created by Игорь Тарабанов on 02.01.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation

struct Toast: Equatable {
  var style: ToastStyle
  var message: String
  var duration: Double = 3
  
  static var mock: Self {
    .init(style: .success, message: "Saved")
  }
}
