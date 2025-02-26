## How to import HUD in project add this to View+Extension file
```
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

extension View {
  public func errorHUD(
    isShowing: Binding<Bool>,
    text: Text,
    blurBackground: Bool = true) -> some View {
      ErrorHUD(isShowing: isShowing,
               text: text,
               blurBackground: blurBackground,
               presenting: { self })
    }
}

extension View {
  public func progressHUD(isShowing: Binding<Bool>,
                          type: ProgressHUDType = .default,
                          text: Text,
                          blurBackground: Bool = true,
                          disableInteraction: Bool = true) -> some View {
    ProgressHUD(isShowing: isShowing,
                type: type,
                text: text,
                blurBackground: blurBackground,
                disableInteraction: disableInteraction,
                presenting: { self })
  }
}
```

## How to import Toast
```
extension View {
  func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
  }
}
```
