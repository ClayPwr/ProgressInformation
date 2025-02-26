//
//  File.swift
//  ProgressInformation
//
//  Created by Игорь Тарабанов on 25.02.2025.
//

import SwiftUI

/// #StatusHUD
/// Status of ViewModel need to conform protocol `HUDStatusProtocol`
/// for avoid to use `@State or @Published` properties to different
/// HUD style we should use `.constant()` for `@Binding` values
/// it gives some trouble for hard depends on current state value
/// to handle expected result need to add bind in ViewModel
/**
 $status
   .sink(receiveValue: { [weak self] status in
     guard let self else { return }
     if case .error = status {
       Task {
         try await Task.sleep(for: .seconds(2))
         self.status = .idle
       }
     }
   })
   .store(in: &cancellables)
*/
/**
 struct ContentView: View {
   var body: some View {
     Text("Hello World")
       .statusHUD(isShowing: .constant(viewModel.status.showHud), status: viewModel.status)
   }
 }
 */


/// #ErrorHUD
/// If we need just show error from status and then forget about this
/// better use this `ErrorHUD` with `@Binding` value it's easy to manage
/// and no need to handle status in ViewModel bind()

struct ContentView: View {
  var body: some View {
    Text("Hello World")
      .errorHUD(isShowing: .constant(viewModel.status.isError),
                text: Text("This error description"))
  }
}


/// #Toast
/// Our main goal is give to user some short informataion
/// and it didn't need any feedback from him
/// we can use `Toast`
/// Here small example how to use Toast message

class ViewModel: ObservableObject {
  @Published var toast: Toast? = nil
  
  init() {
    toast = createSuccessToast()
  }
  
  private func createSuccessToast() -> Toast {
     Toast(style: .success,
           message: NotificationsViewTitles.notificationMovedToRead.localizedString(),
           duration: 1.5)
   }
}
struct ContentView: View {
  var body: some View {
    Text("Hello World")
      .toastView(toast: $viewModel.toast)
  }
}
