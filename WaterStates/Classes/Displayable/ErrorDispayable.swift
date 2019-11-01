public protocol ErrorDispayable {
    func showError(_: Error?)
    func hideError()
}

public extension ErrorDispayable {
    func showError(_ error: Error? = nil) {
        showError(error)
    }
}
